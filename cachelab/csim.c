#include "cachelab.h"
#include <errno.h>
#include <getopt.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int s, E, b, S, B, verbose = 0;
#define LINELEN 512
char trace[2048];

typedef struct line_ {
    int valid;
    unsigned long tag;
    int time;
    int dirty; // track dirty status
} Line;
typedef struct cache_ {
    Line **line;
} Cache;
Cache *cache = NULL;

csim_stats_t stats;

void initializateCache(int s, int E, int b) {
    S = 1 << s;
    B = 1 << b;
    cache = (Cache *)malloc(sizeof(Cache));
    cache->line = (Line **)malloc(sizeof(Line *) * (unsigned long)S);
    for (int i = 0; i < S; i++) {
        cache->line[i] = (Line *)malloc(sizeof(Line) * (unsigned long)E);
        for (int j = 0; j < E; j++) {
            cache->line[i][j].valid = 0;
            cache->line[i][j].tag = 0;
            cache->line[i][j].time = 0;
        }
    }
}
void freeCache(void) {
    for (int i = 0; i < S; i++) {
        free(cache->line[i]);
    }
    free(cache->line);
    free(cache);
}
// get the input from the command line and produce S,B,E and file
void getinput(int argc, char **argv) {
    int opt;
    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch (opt) {
        case 'h':
            // printf("get h");
            printf("help words\n\n");
            exit(0);
        case 'v':
            // printf("get v");
            verbose = 1;
            break;
        case 's':
            // printf("get s");
            s = atoi(optarg);
            // S = 1<<s;
            break;
        case 'E':
            // printf("get E");
            E = atoi(optarg);
            break;
        case 'b':
            // printf("get b");
            b = atoi(optarg);
            // B = 1<<b;
            break;
        case 't':
            // printf("get t");
            // file output name is trace
            strcpy(trace, optarg);
            break;
        default:
            printf("default help words\n\n");
            exit(1);
        }
    }
}
int findLRUReplace(unsigned long nowSet) {
    int maxTime = 0;
    int maxE = 0;
    for (int i = 0; i < E /*cache->E*/; i++) {
        if (cache->line[nowSet][i].time > maxTime) {
            maxTime = cache->line[nowSet][i].time;
            maxE = i;
        }
    }
    return maxE;
}
void RecordLRU(unsigned long nowTag, unsigned long nowSet, int e, char op) {
    cache->line[nowSet][e].tag = nowTag;
    cache->line[nowSet][e].valid = 1;
    if (op == 'S') {
        cache->line[nowSet][e].dirty = 1;
    }
    for (int i = 0; i < E /*cache->E*/; i++) {
        // if not called, time+1, if called, time turn to 0
        if (cache->line[nowSet][i].valid == 1) {
            cache->line[nowSet][i].time++;
        }
        cache->line[nowSet][e].time = 0;
    }
}

void simulateCache(unsigned long nowTag, unsigned long nowSet, char op) {
    int checkHit = -1;
    int checkEvict = -1;
    int e = 0;
    // check the hit state
    //  ==1509274== Conditional jump or move depends on uninitialised value(s)
    //  ==1509274==    at 0x1095DA: simulateCache (csim.c:116)
    //  ==1509274==    by 0x109834: process_trace_file (csim.c:0)
    //  ==1509274==    by 0x109A32: main (csim.c:207)
    for (int i = 0; i < E /*cache->E*/; i++) {
        if (cache->line[nowSet][i].valid &&
            cache->line[nowSet][i].tag == nowTag) {
            checkHit = i; // hit
            break;
        }
    }

    if (checkHit == -1) {
        stats.misses++;
        if (verbose) {
            printf("miss");
        }
        // check evict
        for (int j = 0; j < E /*cache->E*/; j++) {
            if (cache->line[nowSet][j].valid == 0) {
                checkEvict = j; // E is valid
                break;
            }
        }
        // no empty line evict
        if (checkEvict == -1) {
            stats.evictions++;
            if (verbose) {
                printf("evict");
            }
            // when evict happens, need to find LRU to replace
            e = findLRUReplace(nowSet);
            if (cache->line[nowSet][e].dirty) {
                stats.dirty_bytes += (unsigned long)B;

                stats.dirty_evictions++;
            }
        } else {
            e = checkEvict;
        }
        RecordLRU(nowTag, nowSet, e, op);
    } else {
        stats.hits++;
        if (verbose) {
            printf("hit");
        }
        if (op == 'S' && !cache->line[nowSet][checkHit].dirty) {
            cache->line[nowSet][checkHit].dirty = 1;
            stats.dirty_bytes += (unsigned long)B;
        }
        RecordLRU(nowTag, nowSet, checkHit, op);
    }
}
// process the output of "getinput", which is the trace file and take the
// opeartion (L and S), address, and size from the linebuf
// get nowSet and nowTag from the linebuf and call
int process_trace_file(char *trace) {
    FILE *tfp = fopen(trace, "rt");
    if (!tfp) {
        fprintf(stderr, "Error opening '%s': %s\n", trace, strerror(errno));
        return 1;
    }
    char linebuf[LINELEN];
    int parse_error = 0;
    char op;
    unsigned long addr;
    int size;

    while (fgets(linebuf, LINELEN, tfp)) {
        if (sscanf(linebuf, "%c %lx,%d", &op, &addr, &size) == 3) {

            unsigned long nowSet = addr >> (s + b);
            printf("nowSet: %lx \n", nowSet);
            unsigned long nowTag = (addr >> b) & (1 << s) - 1;
            printf("nowtag: %lx \n", nowTag);
            switch (op) {
            case 'L':
                simulateCache(nowSet, nowTag, op);
                break;
            case 'S':
                simulateCache(nowSet, nowTag, op);
                break;
            default:
                printf("Please make sure your opeartor is L or S");
                parse_error = 1;
                break;
            }
        } else {
            fprintf(stderr, "Invalid Line format: %s\n", linebuf);
            parse_error = 1;
        }
    }
    fclose(tfp);
    return parse_error;
}

int main(int argc, char **argv) {
    stats.hits = 0;
    stats.misses = 0;
    stats.evictions = 0;
    stats.dirty_bytes = 0;
    stats.dirty_evictions = 0;

    getinput(argc, argv);
    initializateCache(s, E, b);
    process_trace_file(trace);
    freeCache();
    printSummary(&stats);
    return 0;
}
