/*
 * CS:APP Data Lab
 *
 * <Name: Tianqi Yu     ID: tianqiyu@andrew.cmu.edu>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 */

/* Instructions to Students:

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  long Funct(long arg1, long arg2, ...) {
      // brief description of how your implementation works
      long var1 = Expr1;
      ...
      long varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. (Long) integer constants 0 through 255 (0xFFL), inclusive. You are
      not allowed to use big constants such as 0xffffffffL.
  2. Function arguments and local variables (no global variables).
  3. Local variables of type int and long
  4. Unary integer operations ! ~
     - Their arguments can have types int or long
     - Note that ! always returns int, even if the argument is long
  5. Binary integer operations & ^ | + << >>
     - Their arguments can have types int or long
  6. Casting from int to long and from long to int

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting other than between int and long.
  7. Use any data type other than int or long.  This implies that you
     cannot use arrays, structs, or unions.

  You may assume that your machine:
  1. Uses 2s complement representations for int and long.
  2. Data type int is 32 bits, long is 64.
  3. Performs right shifts arithmetically.
  4. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31 (int) or 63 (long)

EXAMPLES OF ACCEPTABLE CODING STYLE:
  //
  // pow2plus1 - returns 2^x + 1, where 0 <= x <= 63
  //
  long pow2plus1(long x) {
     // exploit ability of shifts to compute powers of 2
     // Note that the 'L' indicates a long constant
     return (1L << x) + 1L;
  }

  //
  // pow2plus4 - returns 2^x + 4, where 0 <= x <= 63
  //
  long pow2plus4(long x) {
     // exploit ability of shifts to compute powers of 2
     long result = (1L << x);
     result += 4L;
     return result;
  }

NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

CAUTION:
  Do not add an #include of <stdio.h> (or any other C library header)
  to this file.  C library headers almost always contain constructs
  that dlc does not understand.  For debugging, you can use printf,
  which is declared for you just below.  It is normally bad practice
  to declare C library functions by hand, but in this case it's less
  trouble than any alternative.

  dlc will consider each call to printf to be a violation of the
  coding style (function calls, after all, are not allowed) so you
  must remove all your debugging printf's again before submitting your
  code or testing it with dlc or the BDD checker.  */

extern int printf(const char *, ...);

/* Edit the functions below.  Good luck!  */
// 2
/*
 * copyLSB - set all bits of result to least significant bit of x
 *   Examples:
 *     copyLSB(5L) = 0xFFFFFFFFFFFFFFFFL,
 *     copyLSB(6L) = 0x0000000000000000L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
long copyLSB(long x) {
    // if LSB is 1, LSB_last = 0x0000000000000001L. if LSB is 0, LSB_last =
    // 0x000000000000000L
    long LSB_last = x & 1;
    // FFFFFFFFFFFE+1=FFFFFFFFFFFFFFFF         FFFFFFFFFFFFFF+1=0
    return ~LSB_last + 1;
}

/*
 * dividePower2 - Compute x/(2^n), for 0 <= n <= 62
 *  Round toward zero
 *   Examples: dividePower2(15L,1L) = 7L, dividePower2(-33L,4L) = -2L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
// 15L = 0000.....01111
// 15L >> (n=1)  =  00.....00111 = 7
//-33L = 100000---00100001
//-33L >> 4   =  00001...0000010
//-33L/2^4 =   100000000...010 = 00001...0010 - 00001.... +100000000000
long dividePower2(long x, long n) {
    // all 1 if positive, all 0 if negative
    long sign = x >> 63;
    // last n-1 all change to 1, previous all 0
    long lastNum = (1L << n) + ~0L;
    // if x pos, sign & lastNum 0; if x neg, sign & lastNum 00000001...111
    // make negitive number closer to "0"
    return (x + (sign & lastNum)) >> n;
}
/*
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (least significant) to 7 (most significant)
 *   Examples: getByte(0x12345678L,1) = 0x56L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
// one byte is 2x16

long getByte(long x, long n) {
    // move x to left by n*8 bits (n << 3)
    long moveLeft = x >> (n << 3);
    // only show the last one byte
    long lastNum = 0xFFL;
    return moveLeft & lastNum;
}
/*
 * anyOddBit - return 1 if any odd-numbered bit in word set to 1
 *   where bits are numbered from 0 (least significant) to 63 (most significant)
 *   Examples anyOddBit(0x5L) = 0L, anyOddBit(0x7L) = 1L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 14
 *   Rating: 2
 */
// odd set to 1 <=> 10101010101010101010...10 <=> 0xAAAAAAAAAAA...AA
long anyOddBit(long x) {
    // make Odd to 0xAAAAAAAAAAAAAAAA...
    long Odd = 0xAA;
    Odd = (Odd << 8) | Odd;
    Odd = (Odd << 16) | Odd;
    Odd = (Odd << 32) | Odd;
    // leave odd 1 inside x
    long comp = !!(x & Odd);
    // return (comp != 0);
    return comp;
}
// 3
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4L,5L) = 4L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
long conditional(long x, long y, long z) {
    // if x=1,mask = 000000...;if x=0, mask=fffffffff...
    long mask = (!!x) + ~0L;
    // x=true,y=y,z=0,mask=fffffffff to show y
    return ((y & ~mask) | (z & mask));
}
/*
 * subtractionOK - Determine if can compute x-y without overflow
 *   Example: subtractionOK(0x8000000000000000L,0x8000000000000000L) = 1L,
 *            subtractionOK(0x8000000000000000L,0x7000000000000000L) = 0L,
 *            start with      1000                0111
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
long subtractionOK(long x, long y) {
    // signs of x y (x-y)
    long signX = (x >> 63) & 1;
    long signY = (y >> 63) & 1;
    long signXY = ((x + (~y) + 1) >> 63) & 1;
    // signX ^ signY True if different sign
    // with same sign, can't overflow
    long check = (signX ^ signY) & (signX ^ signXY);
    return !check;
}
/*
 * bitMask - Generate a mask consisting of all 1's
 *   between lowbit and highbit
 *   Examples: bitMask(5L,3L) = 0x38L
 *   0011 1000 from left to right is bit 7 to 0
 *
 *   Assume 0 <= lowbit < 64, and 0 <= highbit < 64
 *   If lowbit > highbit, then mask should be all 0's
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */

long bitMask(long highbit, long lowbit) {
    // left shift all "1" to highbit/lowbit position, looks like 111111110000
    long maskHigh = (~0L << highbit) << 1;
    long maskLow = ~0L << lowbit;
    // when lowbit > highbit, maskReverse will be all 1, return 0
    // when lowbit <= highbit, maskReverse will be all 0, return
    // maskLow^maskHigh
    long maskReverse = (highbit + (~lowbit) + 1) >> 63;
    return (maskLow ^ maskHigh) & (~maskReverse);
}
/*
 * rotateLeft - Rotate x to the left by n
 *   Can assume that 0 <= n <= 63
 *   Examples:
 *      rotateLeft(0x8765432187654321L,4L) = 0x7654321876543218L
 *   Legal ops: ~ & ^ | + << >> !
 *   Max ops: 25
 *   Rating: 3
 */
long rotateLeft(long x, long n) {

    // parts directly shift left
    long shiftLeft = x << n;
    // parts go around and insert on the right
    //  create roundMask because there will be all 1 in the left if directly do
    //  shift round 0000001111...111(n number of 1)
    long roundMask = (1L << n) + (~0L);
    long shiftRound = (x >> (65 + (~n))) & roundMask;
    return shiftLeft + shiftRound;
}
// 4
/*
 * trueFiveEighths - multiplies by 5/8 rounding toward 0,
 *  avoiding errors due to overflow
 *  Examples:
 *    trueFiveEighths(11L) = 6L   55/8 = 6 ... 7
 *    trueFiveEighths(-9L) = -5L  -45/8 = -5 ... -5
 *    trueFiveEighths(0x3000000000000000L) = 0x1E00000000000000L (no overflow)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 20
 *  Rating: 4
 */
long trueFiveEighths(long x) {
    // divide the x by 8 first
    long divd8 = x >> 3;
    // make a mask to take the last 3 bits
    long mask = 7L;
    // the leftover number when dicide the 8
    long divd8left = x & mask;
    // if the number is negative, sign will be 7L to deal with filling of miss
    // and make the number closer to zero
    long sign = (x >> 63) & 7L;
    // calculate the divd8left x 5 and add 7 when x is negative
    long fill = (((divd8left << 2) + divd8left + sign) >> 3);

    return ((divd8 << 2) + divd8) + fill;
}

/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5L) = 2, bitCount(7L) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
// long bitCount(long x) {
//     //01010101.....
//     long mask1 = 0x55 | (0x55 << 8);
//     mask1 = mask1 | (mask1 << 16);
//     mask1 = mask1 | (mask1 << 32);
//     //00110011.....
//     long mask2 = 0x33 | (0x33 << 8);
//     mask2 = mask2 | (mask2 << 16);
//     mask2 = mask2 | (mask2 << 32);
//     //00001111.....
//     long mask3 = 0x0F | (0x0F << 8);
//     mask3 = mask3 | (mask3 << 16);
//     mask3 = mask3 | (mask3 << 32);

//     //count if thers is 1 in every 8 bits
//     x = ((x >> 1) & mask1) + (x & mask1);
//     x = ((x >> 2) & mask2) + (x & mask2);
//     x = ((x >> 4) & mask3) + (x & mask3);
//     //suppress every 8 bits to the right place and count each
//     x = (x & 0xFF) + ((x >> 8) & 0xFF) + ((x >> 16) & 0xFF) +((x >> 24) &
//     0xFF)+ ((x >> 32) & 0xFF) +((x >> 40) & 0xFF)+((x >> 48) & 0xFF)+((x >>
//     56) & 0xFF);

//     return x & 0xFF;

// }

long bitCount(long x) {
    // 01010101.....
    long mask1 = 0x55 | (0x55 << 8);
    mask1 = mask1 | (mask1 << 16);
    mask1 = mask1 | (mask1 << 32);
    // 00110011.....
    long mask2 = 0x33 | (0x33 << 8);
    mask2 = mask2 | (mask2 << 16);
    mask2 = mask2 | (mask2 << 32);
    // 00001111.....
    long mask3 = 0x0F | (0x0F << 8);
    mask3 = mask3 | (mask3 << 16);
    mask3 = mask3 | (mask3 << 32);
    // 0000000011111111....
    //  long mask4 = 0x00 | (0x00 << 8);
    //  mask4 = (mask4 << 16) | ~mask4;
    //  mask4 = mask4 | (mask4 << 32);

    // count if thers is 1 in every 16 bits
    x = ((x >> 1) & mask1) + (x & mask1);
    x = ((x >> 2) & mask2) + (x & mask2);
    x = ((x >> 4) & mask3) + (x & mask3);
    x = ((x >> 8) & mask3) + (x & mask3);
    // suppress every 16 bits to the right place and count each
    x = (x & 0xFF) + ((x >> 16) & 0xFF) + ((x >> 32) & 0xFF) +
        ((x >> 48) & 0xFF);
    return x & 0xFF;
}
/*
 * bitParity - returns 1 if x contains an odd number of 0's
 *   Examples: bitParity(5L) = 0L, bitParity(7L) = 1L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 22
 *   Rating: 4
 */
long bitParity(long x) {
    // equals to applying ^ to every bits in the x, like 1^0^1^1^1^0^0.....
    // if the 0^1 is in pairs, return 0; is there are extra 0/1, means odd 0
    long tmp = x ^ (x >> 1);
    tmp = tmp ^ (tmp >> 2);
    tmp = tmp ^ (tmp >> 4);
    tmp = tmp ^ (tmp >> 8);
    tmp = tmp ^ (tmp >> 16);
    tmp = tmp ^ (tmp >> 32);

    return tmp & 1L;
}
