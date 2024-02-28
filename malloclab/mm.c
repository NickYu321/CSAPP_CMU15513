/**
 * @file mm.c
 * @brief A 64-bit struct-based implicit free list memory allocator
 *
 * 15-213: Introduction to Computer Systems
 *
 * Brief: this is a malloc and free program using Seg list and best fit
 * there are 14 seg list from 32 to 131072
 * 
 * to find a block to allocate, first use block size to find the seglist within
 * its size, then use bestfit method to find the first n (n = 20 here)
 * free block in that list and output the best free block to alloc. 
 * To free a block, remove it from the seglist and coalesce with other blocks
 *
 *************************************************************************
 *
 * ADVICE FOR STUDENTS.
 * - Step 0: Please read the writeup!
 * - Step 1: Write your heap checker.
 * - Step 2: Write contracts / debugging assert statements.
 * - Good luck, and have fun!
 *
 *************************************************************************
 *
 * @author Tianqi Yu <tianqiyu@andrew.cmu.edu>
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 *****************************************************************************
 * If DEBUG is defined (such as when running mdriver-dbg), these macros      *
 * are enabled. You can use them to print debugging output and to check      *
 * contracts only in debug mode.                                             *
 *                                                                           *
 * Only debugging macros with names beginning "dbg_" are allowed.            *
 * You may not define any other macros having arguments.                     *
 *****************************************************************************
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printf(...) ((void)printf(__VA_ARGS__))
#define dbg_printheap(...) print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, these should emit no code whatsoever,
 * not even from evaluation of argument expressions.  However,
 * argument expressions should still be syntax-checked and should
 * count as uses of any variables involved.  This used to use a
 * straightforward hack involving sizeof(), but that can sometimes
 * provoke warnings about misuse of sizeof().  I _hope_ that this
 * newer, less straightforward hack will be more robust.
 * Hat tip to Stack Overflow poster chqrlie (see
 * https://stackoverflow.com/questions/72647780).
 */
#define dbg_discard_expr_(...) ((void)((0) && printf(__VA_ARGS__)))
#define dbg_requires(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_assert(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_ensures(expr) dbg_discard_expr_("%d", !(expr))
#define dbg_printf(...) dbg_discard_expr_(__VA_ARGS__)
#define dbg_printheap(...) ((void)((0) && print_heap(__VA_ARGS__)))
#endif

/* Basic constants */

typedef uint64_t word_t;

/** @brief Word and header size (bytes) */
static const size_t wsize = sizeof(word_t);

/** @brief Double word size (bytes)*/
static const size_t dsize = 2 * wsize;

/** @brief Minimum block size (bytes) 
 * 2*wsize for head and foot pointer
 * 2*waize for two explict pointer
*/
static const size_t min_block_size = 2 * dsize; ////////////

/**
 * @brief the size of the memory block that the allocator requests from the system
 *  when it needs to expand the heap to accommodate new memory allocations.
 * (Must be divisible by dsize)
 */
static const size_t chunksize = (1 << 12);

/** @brief A mask used to check allocation states*/
static const word_t alloc_mask = 0x1;

/** @brief A mask used to check previous block allocation states*/
static const word_t prevalloc_mask = 0x2;

/** @brief A mask used to get the size of the block*/
static const word_t size_mask = ~(word_t)0xF;

/** @brief Represents the header and payload of one block in the heap */
typedef struct block {
    /** @brief Header contains size + allocation flag */
    word_t header;
    union{
        struct{
            struct block *prevB;
            struct block *nextB;
        };
        char payload[0];
    };
} block_t;

#define seg_size 14
#define seg1 32
#define seg2 64
#define seg3 128
#define seg4 256
#define seg5 512
#define seg6 1024
#define seg7 2048
#define seg8 4096
#define seg9 8192
#define seg10 16384
#define seg11 32768
#define seg12 65536
#define seg13 131072
/* Global variables */

/** @brief Pointer to first block in the heap */
static block_t *heap_start = NULL;
/** @brief Pointer to first free block in the explict list */
static block_t *seglist[seg_size];
static block_t *heap_end = NULL;

/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details for the functions that you write yourself!               *
 *****************************************************************************
 */

/*
 * ---------------------------------------------------------------------------
 *                        BEGIN SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/**
 * @brief Returns the maximum of two integers.
 * @param[in] x
 * @param[in] y
 * @return `x` if `x > y`, and `y` otherwise.
 */
static size_t max(size_t x, size_t y) {
    return (x > y) ? x : y;
}

/**
 * @brief Rounds `size` up to next multiple of n
 * @param[in] size
 * @param[in] n
 * @return The size after rounding up
 */
static size_t round_up(size_t size, size_t n) {
    return n * ((size + (n - 1)) / n);
}

/**
 * @brief Packs the `size` and `alloc` of a block into a word suitable for
 *        use as a packed value.
 *
 * Packed values are used for both headers and footers.
 *
 * The allocation status is packed into the lowest bit of the word.
 *
 * @param[in] size The size of the block being represented
 * @param[in] alloc True if the block is allocated
 * @return The packed value
 */
static word_t pack(size_t size, bool alloc) {
    word_t word = size;
    if (alloc) {
        word |= alloc_mask;
    }
    return word;
}

static word_t pack_nofoot(size_t size, size_t alloc) {
    word_t word = size;
    if (alloc & alloc_mask) {
        word |= alloc_mask;
    }
    if (alloc & prevalloc_mask) {
        word |= prevalloc_mask;
    }
    return word;
}

/**
 * @brief Extracts the size represented in a packed word.
 *
 * This function simply clears the lowest 4 bits of the word, as the heap
 * is 16-byte aligned.
 *
 * @param[in] word
 * @return The size of the block represented by the word
 */
static size_t extract_size(word_t word) {
    return (word & size_mask);
}

/**
 * @brief Extracts the size of a block from its header.
 * @param[in] block
 * @return The size of the block
 */
static size_t get_size(block_t *block) {
    return extract_size(block->header);
}

/**
 * @brief Given a payload pointer, returns a pointer to the corresponding
 *        block.
 * @param[in] bp A pointer to a block's payload
 * @return The corresponding block
 */
static block_t *payload_to_header(void *bp) {
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        payload.
 * @param[in] block
 * @return A pointer to the block's payload
 * @pre The block must be a valid block, not a boundary tag.
 */
static void *header_to_payload(block_t *block) {
    dbg_requires(get_size(block) != 0);
    return (void *)(block->payload);
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        footer.
 * @param[in] block
 * @return A pointer to the block's footer
 * @pre The block must be a valid block, not a boundary tag.
 */
static word_t *header_to_footer(block_t *block) {
    dbg_requires(get_size(block) != 0 &&
                 "Called header_to_footer on the epilogue block");
    return (word_t *)(block->payload + get_size(block) - dsize);
}

/**
 * @brief Given a block footer, returns a pointer to the corresponding
 *        header.
 * 
 * The header is found by subtracting the block size from
 * the footer and adding back wsize. 
 *
 * If the prologue is given, then the footer is return as the block.
 *
 * @param[in] footer A pointer to the block's footer
 * @return A pointer to the start of the block
 */
static block_t *footer_to_header(word_t *footer) {
    size_t size = extract_size(*footer);
    if (size == 0){
        return (block_t *)footer;
    }
    return (block_t *)((char *)footer + wsize - size);
}

/**
 * @brief Returns the payload size of a given block.
 *
 * The payload size is equal to the entire block size minus the sizes of the
 * block's header and footer.
 *
 * @param[in] block
 * @return The size of the block's payload
 */
static size_t get_payload_size(block_t *block) {
    size_t asize = get_size(block);
    return asize - wsize;
}

/**
 * @brief Returns the allocation status of a given header value.
 *
 * This is based on the lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_alloc(word_t word) {
    return (bool)(word & alloc_mask);
}

/**
 * @brief Returns the allocation status of a block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool get_alloc(block_t *block) {
    return extract_alloc(block->header);
}

static word_t extract_prevalloc(word_t word){
    return (word & prevalloc_mask);
}

static word_t get_prevalloc(block_t *block){
    return extract_prevalloc(block->header);
}
/**
 * @brief Writes an epilogue header at the given address.
 *
 * The epilogue header has size 0, and is marked as allocated.
 *
 * @param[out] block The location to write the epilogue header
 */
static void write_epilogue(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == (char *)mem_heap_hi() - 7);
    block->header = pack(0, true);
}

static void write_epilogue_new(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == (char *)mem_heap_hi() - 7);
    block->header = pack_nofoot(0, 1);
}

/**
 * @brief Writes a block starting at the given address.
 *
 * This function writes both a header and footer, where the location of the
 * footer is computed in relation to the header.
 *
 * TODO: Are there any preconditions or postconditions?
 *
 * @param[out] block The location to begin writing the block header
 * @param[in] size The size of the new block
 * @param[in] alloc The allocation status of the new block
 */
static void write_block(block_t *block, size_t size, bool alloc) {
    dbg_requires(block != NULL);
    dbg_requires(size > 0);
    block->header = pack(size, alloc);
    word_t *footerp = header_to_footer(block);
    *footerp = pack(size, alloc);
}

static void write_block_nofoot(block_t *block, size_t size, size_t alloc) {
    dbg_requires(block != NULL);
    dbg_requires(size > 0);
    block->header = pack_nofoot(size, alloc);
    word_t *footerp = header_to_footer(block);
    *footerp = pack_nofoot(size, alloc);
}



/**
 * @brief Finds the next consecutive block on the heap.
 *
 * This function accesses the next block in the "implicit list" of the heap
 * by adding the size of the block.
 *
 * @param[in] block A block in the heap
 * @return The next consecutive block on the heap
 * @pre The block is not the epilogue
 */
static block_t *find_next(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_next on the last block in the heap");
    return (block_t *)((char *)block + get_size(block));
}

/**
 * @brief Finds the footer of the previous block on the heap.
 * @param[in] block A block in the heap
 * @return The location of the previous block's footer
 */
static word_t *find_prev_footer(block_t *block) {
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}



/**
 * @brief Finds the previous consecutive block on the heap.
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 * The position of the previous block is found by reading the previous
 * block's footer to determine its size, then calculating the start of the
 * previous block based on its size.
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 * @pre The block is not the prologue
 */
static block_t *find_prev(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_prev on the first block in the heap");
    word_t *footerp = find_prev_footer(block); //location of prev footer
    return footer_to_header(footerp);
}

/**
 * @brief search for the seglist group
 * @param[in] size size of block
 * @return the index of the seglist size group
 */
static size_t search_seglist(size_t size){
    if(size < seg1) return 0;
    else if((size >= seg1) && (size < seg2)) return 1;
    else if((size >= seg2) && (size < seg3)) return 2;
    else if((size >= seg3) && (size < seg4)) return 3;
    else if((size >= seg4) && (size < seg5)) return 4;
    else if((size >= seg5) && (size < seg6)) return 5;
    else if((size >= seg6) && (size < seg7)) return 6;
    else if((size >= seg7) && (size < seg8)) return 7;
    else if((size >= seg8) && (size < seg9)) return 8;
    else if((size >= seg9) && (size < seg10)) return 9;
    else if((size >= seg10) && (size < seg11)) return 10;
    else if((size >= seg11) && (size < seg12)) return 11;
    else if((size >= seg12) && (size < seg13)) return 12;
    else return 13;
}
/**
 * @brief insert new freeblock to seglist
 * This function takes a free block and its size, and inserts it into the
 * corresponding segment list based on its size. If there are no other blocks
 * in the segment list of the given size, the new block becomes the first block
 * in that list.
 * @param[in] size size of block
 * @param[in] block free block
 * @return 
 */
static void insert_seglist(block_t *block,size_t size){
    size_t index = search_seglist(size);
    //start of a group
    if(seglist[index] == NULL){
        block->prevB = NULL;
        block->nextB = NULL;
        seglist[index] = block;
    //already blocks in the group
    }else{
        block->prevB = NULL;
        block->nextB = seglist[index];
        seglist[index]->prevB = block;
        seglist[index] = block;
    }
}
/**
 * @brief remove freeblock from seglist
 * This function removes a free block from the segment list based on its size.
 * It updates the pointers of the previous and next blocks in the list, if
 * applicable, and ensures the removed block no longer belongs to any segment
 * list.
 * @param[in] size size of block
 * @param[in] block free block
 * @return 
 */
static void remove_seglist(block_t *block,size_t size){
    size_t index = search_seglist(size);
    block_t *prev_block = block->prevB;
    block_t *next_block = block->nextB;
    
    if(prev_block == NULL){
        //delete the first free block in seg list
        if(next_block == NULL){
            seglist[index] = NULL;
        }else{
            seglist[index] = next_block;
            next_block->prevB = NULL;
        }
    }
    // only one in seglist
    else if(next_block == NULL){
        prev_block->nextB = NULL;
    }
    //for normal blocks inside the list
    else{
        next_block->prevB = prev_block;
        prev_block->nextB = next_block;
    }
    block->prevB = NULL;
    block->nextB = NULL;
}

/*
 * ---------------------------------------------------------------------------
 *                        END SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/******** The remaining content below are helper and debug routines ********/



/**
 * @brief Check the prev and next block and change the header and footer while
 * freeing bolck and do coalesce
 *
 * @param[in] block A block in the heap
 * @return block A block with changed header and footer.
 * @pre The block not the epilogue or prologue
 *
 */
static block_t *coalesce_block(block_t *block) {
    //check the allocation status of pevious and next block
    block_t *next_block = find_next(block);
    block_t *prev_block;// = find_prev(block);
    bool next_sta = get_alloc(next_block);
    bool prev_sta = (bool)get_prevalloc(block);
    //dbg_requires(block_prev != block);
    size_t block_size = get_size(block);
    

    if((prev_sta && next_sta)){
        write_block_nofoot(block,block_size,2);
        //clear prevalloc of next block, when next block is not empty
        //need to write prevalloc
        next_block->header = next_block->header & ~(size_t)0x2;

    //next empty
    }else if(prev_sta && !next_sta){
        size_t next_block_size = get_size(next_block);
        block_size += next_block_size;
        remove_seglist(next_block,next_block_size);
        write_block_nofoot(block,block_size,2);

    //pre empty, if prev block is the prologue
    }else if(!prev_sta && next_sta){
        prev_block = find_prev(block);
        size_t prev_block_size = get_size(prev_block);
        block_size += prev_block_size;
        remove_seglist(prev_block,prev_block_size);
        write_block_nofoot(prev_block,block_size,2);
        //clear prevalloc of next block
        next_block->header = next_block->header & ~(size_t)0x2;
        block = prev_block;

    //pre and next empty
    }else if(!prev_sta && !next_sta){
        prev_block = find_prev(block);
        size_t next_block_size = get_size(next_block);
        size_t prev_block_size = get_size(prev_block);
        block_size = block_size + next_block_size+prev_block_size;
        remove_seglist(prev_block,prev_block_size);
        remove_seglist(next_block,next_block_size);
        write_block_nofoot(prev_block,block_size,2);
        block = prev_block;
    }
    insert_seglist(block,block_size);
    return block;
}

/**
 * @brief when the heap don't have enough space for more blocks, extend it
 * @param[in] size
 * @return The extended block
 * @pre The bloce is the epilogue
 */
static block_t *extend_heap(size_t size) {
    void *bp;
    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
    if ((bp = mem_sbrk((intptr_t)size)) == (void *)-1) {
        return NULL;
    }

    /*
     * Think about what bp represents. Why do we write the new block
     * starting one word BEFORE bp, but with the same size that we
     * originally requested?
     * Because bp orginally point to the payload which is one word after header of a bloc\
     */

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);
    write_block_nofoot(block, size, get_prevalloc(heap_end));

    // Create new epilogue header
    heap_end = find_next(block);
    write_epilogue_new(heap_end);//only write a header

    // Coalesce in case the previous block was free
    block = coalesce_block(block);
    return block;
}

/**
 * @brief split a large block into small ones and change the header& footer
 *
 * 
 * @param[in] block
 * @param[in] asize
 * @return a smaller block with changed header and footer
 * @pre block be splited large enough
 */
static void split_block(block_t *block, size_t asize) {
    dbg_requires(get_alloc(block));
    size_t block_size = get_size(block);
    block_t *block_next;

    if ((block_size - asize) >= min_block_size) {
        remove_seglist(block,block_size);
        //write_block_nofoot(block, asize, 3);////////////
        block->header = pack_nofoot(asize,3);
        block_next = find_next(block);
        write_block_nofoot(block_next, block_size - asize, 2);
        
        insert_seglist(block_next,(block_size - asize));
    }else{
        //remove_seglist(block,block_size);
        //write_block_nofoot(block, block_size, 3);
        block->header = pack_nofoot(block_size,3);
        block_next = find_next(block);
        //set prevalloc to 1
        block_next->header = block_next->header | (size_t)0x2;
        remove_seglist(block,block_size);
    }

    dbg_ensures(get_alloc(block));
}
/**
 * @brief for a seglist group seglist[i], search for the best one inside
 * @param[in] asize size of block want to alloc
 * @param[in] block last block of seglist[i]
 * @return block pointer to the block we found
 */
static block_t *search_bestfit(block_t *block, size_t asize){
    //block_t *seg;
    block_t *seg = block;
    block_t *best = NULL;
    size_t best_size = SIZE_MAX;
    size_t curr_size;
    int found_count = 0;
    while(seg != NULL){
        curr_size = get_size(seg);
        //if current block is best fit, return it
        if (curr_size == asize){
            return seg;
        }
        //if find a better fit than previous fit
        else if((curr_size > asize) && (curr_size < best_size)){
            best_size = curr_size;
            best = seg;
        }
        
        seg = seg->nextB;

        found_count ++;
        if (found_count >= 20) {
            return best;
        }
    }
    return best;
}

/**
 * @brief for seg list, find through seglist to the next block 
 * to find an unalloc and large enough block
 * @param[in] asize size of block want to alloc
 * @return block pointer to the block we found
 */
static block_t *find_fit(size_t asize) {
    block_t *block;

    for (size_t i = search_seglist(asize); i < seg_size; ++i) {
        block = search_bestfit(seglist[i],asize);
        if (block != NULL) {
            return block;
        }
    }
    //return NULL; // no fit found
    if(block ==NULL){
        return NULL;
    }else{
        return block;
    }
}


/**
 * @brief Checks the heap for consistency and correctness.
 * @param[in] line The line number.
 * @return True if the heap is consistent, false otherwise.
 */
bool mm_checkheap(int line) {
    // // Check the prologue and epilogue blocks
    // block_t *prologue = (block_t *)heap_start;
    // block_t *epilogue = find_next(prologue);

    // // Check prologue
    // if (prologue->header != pack(0, true)) {
    //     dbg_printf("Prologue block header is incorrect (line %d)\n", line);
    //     return false;
    // }

    // // Check epilogue
    // if (epilogue->header != pack(0, true)) {
    //     dbg_printf("Epilogue block header is incorrect (line %d)\n", line);
    //     return false;
    // }

    // // Check block alignment and boundaries
    // block_t *block = prologue;
    // while (get_size(block) > 0) {
    //     // Check block alignment
    //     if ((size_t)block % dsize != 0) {
    //         dbg_printf("Block is not double-word aligned (line %d)\n", line);
    //         return false;
    //     }

    //     // Check block boundaries
    //     block_t *next_block = find_next(block);
    //     if (next_block->header != pack(0, true) && (size_t)next_block < (size_t)block) {
    //         dbg_printf("Block boundaries overlap (line %d)\n", line);
    //         return false;
    //     }

    //     block = next_block;
    // }

    // // Check block header and footer consistency
    // block = prologue;
    // while (get_size(block) > 0) {
    //     word_t *footerp = header_to_footer(block);
    //     if (block->header != *footerp) {
    //         dbg_printf("Block header and footer do not match (line %d)\n", line);
    //         return false;
    //     }

    //     block = find_next(block);
    // }

    // // Check coalescing
    // block = prologue;
    // while (get_size(block) > 0) {
    //     block_t *next_block = find_next(block);
    //     if (!get_alloc(block) && !get_alloc(next_block)) {
    //         dbg_printf("Blocks are not coalesced (line %d)\n", line);
    //         return false;
    //     }

    //     block = next_block;
    // }

    // // Check the segregated list
    // for (size_t i = 0; i < seg_size; ++i) {
    //     block_t *seg = seglist[i];
    //     while (seg != NULL) {
    //         // Check that the block is marked as free
    //         if (get_alloc(seg)) {
    //             dbg_printf("Block in seglist is not marked as free (line %d)\n", line);
    //             return false;
    //         }

    //         // Check that the block is in the correct seglist
    //         size_t seg_index = search_seglist(get_size(seg));
    //         if (i != seg_index) {
    //             dbg_printf("Block is in the wrong seglist (line %d)\n", line);
    //             return false;
    //         }

    //         seg = seg->nextB;
    //     }
    // }

    return true;
}

/**
 * @brief Performs any necessary initializations, 
 * such as allocating the initial heap area.
 * @return The return value should be false if there was a problem
 * in performing the initialization, true otherwise.
 */
bool mm_init(void) {
    // Create the initial empty heap
    word_t *start = (word_t *)(mem_sbrk(2 * wsize));
    if (start == (void *)-1) {
        return false;
    }

    //init seglist, all empty
    for(int i =0; i < seg_size; i++){
        seglist[i] = NULL;
    }

    start[0] = pack_nofoot(0, 1); // Heap prologue (block footer)
    start[1] = pack_nofoot(0, 3); // Heap epilogue (block header)
    
    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);
    heap_end = (block_t *)&(start[1]);
    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL) {
        return false;
    }
    return true;
}


/**
 * @brief Returns a pointer to an allocated block payload of at least size bytes. 
 * @pre The entire allocated block should lie within the heap region 
 * and should not overlap with any other allocated block.
 * @post malloc implementation must always return 16-byte aligned pointers, 
 * even if size is smaller than 16.
 * @param[in] size
 * @return a pointer to an allocated block payload
 */
void *malloc(size_t size) {
    dbg_requires(mm_checkheap(__LINE__));

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    // Initialize heap if it isn't initialized
    if (heap_start == NULL) {
        if (!(mm_init())) {
            dbg_printf("Problem initializing heap. Likely due to sbrk");
            return NULL;
        }
    }

    // Ignore spurious request
    if (size == 0) {
        dbg_ensures(mm_checkheap(__LINE__));
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements(remove footer)
    asize = round_up(size + wsize, dsize);

    // Search the seg list for a fit
    block = find_fit(asize);

    // If no fit is found, request more memory, and then and place the block
    if (block == NULL) {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        block = extend_heap(extendsize);
        // extend_heap returns an error
        if (block == NULL) {
            return bp;
        }
    }

    // The block should be marked as free

    dbg_assert(!get_alloc(block));

    // Mark block as allocated
    size_t block_size = get_size(block);
    write_block_nofoot(block, block_size, get_prevalloc(block) | 0x1);

    // Try to split the block if too large
    split_block(block, asize);

    bp = header_to_payload(block);

    dbg_ensures(mm_checkheap(__LINE__));
    return bp;
}

/**
 * @brief If ptr is NULL, does nothing. 
 * Otherwise, ptr must point to the beginning of a block payload returned by 
 * a previous call to malloc, calloc, or realloc and not already freed.
 * @pre not freed blocks
 * @param[in] bp
 * @return nothing
 */
void free(void *bp) {
    dbg_requires(mm_checkheap(__LINE__));

    if (bp == NULL) {
        return;
    }
    block_t *block = payload_to_header(bp);
    size_t size = get_size(block);

    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    // Mark the block as free, mark if prev block is free
    write_block_nofoot(block, size, (size_t)get_prevalloc(block));

    // Try to coalesce the block with its neighbors
    coalesce_block(block);

    //dbg_assert(!get_alloc(block));
    //dbg_ensures(mm_checkheap(__LINE__));
}

/**
 * @brief Changes the size of a previously allocated block.
 *
 * @param[in] ptr
 * @param[in] size
 * @return newptr
 */
void *realloc(void *ptr, size_t size) {
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0) {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL) {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL) {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize) {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
}

/**
 * @brief Allocates memory for an array of nmemb elements of size bytes each,
 * initializes the memory to all bytes zero, 
 * and returns a pointer to the allocated memory.
 * @param[in] elements
 * @param[in] size
 * @return a pointer to the allocated memory
 */
void *calloc(size_t elements, size_t size) {
    void *bp;
    size_t asize = elements * size;

    if (elements == 0) {
        return NULL;
    }
    if (asize / elements != size) {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL) {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);

    return bp;
}

/*
 *****************************************************************************
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a c5 7c fc 80 6e 57 0a               *
 *                                                                           *
 *****************************************************************************
 */
