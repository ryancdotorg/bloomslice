/* Copyright (c) 2017 Ryan Castellucci, All Rights Reserved */

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "extern.h"
#include "hash160.h"
#include "bloomutl.h"

#define BLOOM_SET_BIT(N) (mem[(N)>>3] = mem[(N)>>3] | (1<<((N)&7)))

#define BH00(N) (N[0])
#define BH01(N) (N[1])
#define BH02(N) (N[2])
#define BH03(N) (N[3])
#define BH04(N) (N[4])

#define BH05(N) (N[0]<<16|N[1]>>16)
#define BH06(N) (N[1]<<16|N[2]>>16)
#define BH07(N) (N[2]<<16|N[3]>>16)
#define BH08(N) (N[3]<<16|N[4]>>16)
#define BH09(N) (N[4]<<16|N[0]>>16)

#define BH10(N) (N[0]<< 8|N[1]>>24)
#define BH11(N) (N[1]<< 8|N[2]>>24)
#define BH12(N) (N[2]<< 8|N[3]>>24)
#define BH13(N) (N[3]<< 8|N[4]>>24)
#define BH14(N) (N[4]<< 8|N[0]>>24)

#define BH15(N) (N[0]<<24|N[1]>> 8)
#define BH16(N) (N[1]<<24|N[2]>> 8)
#define BH17(N) (N[2]<<24|N[3]>> 8)
#define BH18(N) (N[3]<<24|N[4]>> 8)
#define BH19(N) (N[4]<<24|N[0]>> 8)

// This function pulls the needed information about which parts of the hash
// to use to pick bits from out of data structures embedded in the object
// file for the get function. It's could probably be made more efficient, but
// it's not super important to be able to *create* the bloom filter quickly.
int32_t bloom_h160_set(uint8_t *mem, const void *h160, uint8_t n, uint64_t mask) {
  const uint16_t *S = h160;
  const uint8_t  *B = h160;
  uint32_t t;
  uint64_t h;
  int i, k;

  if (n == BFS_TYPE_LEGACY) {
    t = BH00(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH01(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH02(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH03(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH04(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH05(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH06(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH07(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH08(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH09(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH10(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH11(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH12(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH13(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH14(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH15(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH16(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH17(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH18(((uint32_t*)h160)); BLOOM_SET_BIT(t);
    t = BH19(((uint32_t*)h160)); BLOOM_SET_BIT(t);
  } else if (n == BFS_TYPE_SINGLE) {
      memcpy(mem, h160, sizeof(hash160_t));
  } else if (n > BFS_TYPE_OFFSET + hash1sN + hash2bN + hash2sN && mask > 0xffffffff) {
    k = n - (hash1sN + hash2bN + hash2sN);
    for (i = 0; i < k; ++i) {
      // compute hash
      h = ((((uint64_t)S[data3sT[i*3+0]]) << 32)|
           (((uint64_t)S[data3sT[i*3+1]]) << 16)|
           (((uint64_t)S[data3sT[i*3+2]]))) & mask;
      // set bit h of mem
      mem[(h)>>3] = mem[(h)>>3] | (1 << ((h)&7));
    }
  } else if (n > BFS_TYPE_OFFSET + hash1sN + hash2bN && mask > 0xffff && mask <= 0xffffffff) {
    k = n - (hash1sN + hash2bN);
    for (i = 0; i < k; ++i) {
      // compute hash
      h = ((((uint64_t)S[data2sT[i*2+0]]) << 16)|
           (((uint64_t)S[data2sT[i*2+1]]))) & mask;
      // set bit h of mem
      mem[(h)>>3] = mem[(h)>>3] | (1 << ((h)&7));
    }
  } else if (n > BFS_TYPE_OFFSET + hash1sN && mask > 0xff && mask <= 0xffff) {
    k = n - (hash1sN);
    for (i = 0; i < k; ++i) {
      // compute hash
      h = ((((uint64_t)B[data2bT[i*2+0]]) << 8)|
           (((uint64_t)B[data2bT[i*2+1]]))) & mask;
      // set bit h of mem
      mem[(h)>>3] = mem[(h)>>3] | (1 << ((h)&7));
    }
  } else if (n > BFS_TYPE_OFFSET && mask >= 0xff && mask <= 0xffff) {
    k = n;
    for (i = 0; i < k; ++i) {
      // compute hash
      h = ((uint64_t)S[data1sT[i]]) & mask;
      // set bit h of mem
      mem[(h)>>3] = mem[(h)>>3] | (1 << ((h)&7));
    }
  } else {
      fprintf(stderr, "bloom_h160_set failed!\n");
      return -1;
  }

  return 0;
}
