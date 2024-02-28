/**
 * @file queue.c
 * @brief Implementation of a queue that supports FIFO and LIFO operations.
 *
 * This queue implementation uses a singly-linked list to represent the
 * queue elements. Each queue element stores a string value.
 *
 * Assignment for basic C skills diagnostic.
 * Developed for courses 15-213/18-213/15-513 by R. E. Bryant, 2017
 * Extended to store strings, 2018
 *
 * TODO: fill in your name and Andrew ID
 * @author Tianqi Yu <tianqiyu@andrew.cmu.edu>
 */

#include "queue.h"
#include "harness.h"

#include <stdlib.h>
#include <string.h>
//#include <stdio.h>

/**
 * @brief Allocates a new queue
 * @return The new queue, or NULL if memory allocation failed
 */
queue_t *queue_new(void) {
    queue_t *q = (queue_t *)malloc(sizeof(queue_t));
    /* What if malloc returned NULL? */
    if (!q) {
        free(q);
        return NULL;
    }
    q->head = NULL;
    q->tail = NULL;
    // q->tail->next = NULL;
    q->size_q = 0;
    return q;
}

/**
 * @brief Frees all memory used by a queue
 * @param[in] q The queue to free
 */
void queue_free(queue_t *q) {
    /* How about freeing the list elements and the strings? */
    /* Free queue structure */
    if (!q) {
        free(q);
        return;
    }
    if (q) {
        list_ele_t *p = q->head;
        list_ele_t *tmp = NULL;
        while (p) {
            free(p->value);
            tmp = p->next;
            free(p);
            p = tmp;
        }
        // q->size_q = 0;
        free(q);
    }
    // free(q);
}

/**
 * @brief Attempts to insert an element at head of a queue
 *
 * This function explicitly allocates space to create a copy of `s`.
 * The inserted element points to a copy of `s`, instead of `s` itself.
 *
 * @param[in] q The queue to insert into
 * @param[in] s String to be copied and inserted into the queue
 *
 * @return true if insertion was successful
 * @return false if q is NULL, or memory allocation failed
 */
bool queue_insert_head(queue_t *q, const char *s) {

    /* What should you do if the q is NULL? */
    if (!q) {
        // free(q);
        return false;
    }
    // if(!s){
    //     return false;
    // }
    list_ele_t *newh = (list_ele_t *)malloc(sizeof(list_ele_t));
    if (!newh) {
        free(newh);
        // free(newh->value);
        return false;
    }
    /* Don't forget to allocate space for the string and copy it */
    // unsigned long s_length=0;
    //  int s_length=0;
    //  while(s[s_length]!='\0') s_length++;

    // newh->value = malloc(sizeof(const char)*(strlen(s)+1));
    char *tmp = (char *)malloc(strlen(s) + 1);
    /* What if either call to malloc returns NULL? */
    if (!tmp) {
        free(newh);
        return false;
    }

    strcpy(tmp, s);

    newh->value = tmp;
    newh->next = NULL;

    if (!q->tail) {
        q->head = newh;
        q->tail = newh;
    } else {
        newh->next = q->head;
        q->head = newh;
    }

    ++q->size_q;
    // free(tmp);
    // free(newh);
    return true;
}

/**
 * @brief Attempts to insert an element at tail of a queue
 *
 * This function explicitly allocates space to create a copy of `s`.
 * The inserted element points to a copy of `s`, instead of `s` itself.
 *
 * @param[in] q The queue to insert into
 * @param[in] s String to be copied and inserted into the queue
 *
 * @return true if insertion was successful
 * @return false if q is NULL, or memory allocation failed
 */
bool queue_insert_tail(queue_t *q, const char *s) {
    /* You need to write the complete code for this function */
    /* Remember: It should operate in O(1) time */
    if (!q) {
        return false;
    }

    list_ele_t *newt = (list_ele_t *)malloc(sizeof(list_ele_t));
    if (!newt) {
        // free(newt);
        return false;
    }
    // unsigned long s_length=0;
    //  int s_length=0;
    //  while(s[s_length]!='\0') s_length++;
    // newt->value = malloc(sizeof(const char)*(strlen(s)+1));

    char *tmp = (char *)malloc(strlen(s) + 1);
    if (!tmp) {
        free(newt);
        return false;
    }
    strcpy(tmp, s);
    newt->value = tmp;
    newt->next = NULL;

    if (q->tail) {
        q->tail->next = newt;
    }
    q->tail = newt;
    // if(q->tail == NULL){
    //     //q->tail->next = newt;
    //     //q->head = newt;
    //     q->tail = newt;
    // }
    // else{
    //     q->tail->next = newt;
    //     q->tail = newt;
    // }
    // q->tail->next = NULL;

    ++q->size_q;
    return true;
}

/**
 * @brief Attempts to remove an element from head of a queue
 *
 * If removal succeeds, this function frees all memory used by the
 * removed list element and its string value before returning.
 *
 * If removal succeeds and `buf` is non-NULL, this function copies up to
 * `bufsize - 1` characters from the removed string into `buf`, and writes
 * a null terminator '\0' after the copied string.
 *
 * @param[in]  q       The queue to remove from
 * @param[out] buf     Output buffer to write a string value into
 * @param[in]  bufsize Size of the buffer `buf` points to
 *
 * @return true if removal succeeded
 * @return false if q is NULL or empty
 */
bool queue_remove_head(queue_t *q, char *buf, size_t bufsize) {
    /* You need to fix up this code. */
    if (q == NULL || q->size_q == 0) {
        return false;
    }
    list_ele_t *tmp = q->head;
    q->head = q->head->next;
    tmp->next = NULL;

    if (buf) {
        strncpy(buf, tmp->value, bufsize - 1);
        buf[bufsize - 1] = '\0';
    }
    if (tmp->value != NULL)
        free(tmp->value);
    free(tmp);

    // q->tail->next = NULL;
    --q->size_q;
    return true;
}

/**
 * @brief Returns the number of elements in a queue
 *
 * This function runs in O(1) time.
 *
 * @param[in] q The queue to examine
 *
 * @return the number of elements in the queue, or
 *         0 if q is NULL or empty
 */
size_t queue_size(queue_t *q) {
    /* You need to write the code for this function */
    /* Remember: It should operate in O(1) time */
    if (q == NULL || q->size_q == 0) {
        return 0;
    } else {
        return q->size_q;
    }
}

/**
 * @brief Reverse the elements in a queue
 *
 * This function does not allocate or free any list elements, i.e. it does
 * not call malloc or free, including inside helper functions. Instead, it
 * rearranges the existing elements of the queue.
 *
 * @param[in] q The queue to reverse
 */
void queue_reverse(queue_t *q) {
    /* You need to write the code for this function */
    if (q == NULL || q->size_q == 0) {
        return;
    }
    list_ele_t *oldh = q->head;
    list_ele_t *oldt = q->tail;

    list_ele_t *tmp_out =
        NULL; // first one become the last and point out to NULL (left)
    list_ele_t *tmp =
        q->head; // first one in the queue Become the last one      (center)
    list_ele_t *tmp_in = NULL; // second one in the queue (right)
    while (tmp) {
        tmp_out = tmp->next;
        tmp->next = tmp_in;
        tmp_in = tmp;
        tmp = tmp_out;

        // tmp->next = tmp_out;
        // tmp_out=tmp;
        // tmp=tmp_in;                //all opearter move right 1
        // if(tmp_in){                //stop when reached the original tail
        //     tmp_in=tmp_in->next;
        // }
    }
    q->head = oldt;
    q->tail = oldh;
    q->tail->next = NULL;
}
