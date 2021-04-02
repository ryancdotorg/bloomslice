#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "bloom_h160_chk.h"
#include "extern.h"

uint8_t hash3sN = 96;
uint8_t data3sT[] = {
  1, 0, 7,  0, 2, 3,  3, 1, 8,  2, 4, 5,  4, 6, 9,  6, 7, 8,  5, 0, 3,  9, 1, 2,
  8, 5, 9,  7, 4, 6,  1, 3, 5,  7, 2, 8,  6, 7, 9,  8, 1, 6,  3, 0, 4,  2, 6, 8,
  4, 3, 7,  9, 2, 4,  5, 0, 1,  0, 2, 9,  4, 5, 7,  9, 4, 8,  1, 0, 6,  6, 1, 9,
  5, 3, 4,  7, 0, 5,  0, 2, 6,  2, 3, 8,  3, 1, 7,  8, 0, 9,  4, 5, 8,  0, 6, 7,
  9, 1, 3,  3, 2, 5,  7, 4, 9,  2, 4, 7,  6, 8, 9,  1, 5, 6,  5, 0, 2,  8, 1, 4,
  4, 3, 6,  9, 2, 7,  6, 0, 8,  8, 3, 9,  2, 1, 5,  1, 0, 3,  7, 9, 5,  3, 6, 0,
  5, 8, 2,  1, 7, 4,  8, 9, 7,  4, 1, 0,  5, 2, 6,  3, 5, 9,  7, 3, 6,  0, 4, 2,
  5, 1, 8,  0, 9, 1,  4, 3, 8,  6, 2, 7,  1, 9, 5,  7, 4, 0,  6, 3, 8,  0, 7, 2,
  9, 1, 4,  6, 5, 8,  3, 2, 9,  0, 5, 8,  1, 7, 6,  4, 3, 2,  0, 7, 9,  6, 2, 4,
  5, 3, 8,  8, 1, 7,  9, 5, 6,  0, 2, 1,  9, 3, 4,  3, 7, 2,  6, 1, 4,  8, 0, 3,
  4, 5, 1,  8, 9, 2,  5, 6, 0,  0, 7, 3,  9, 5, 2,  4, 8, 6,  1, 7, 5,  0, 4, 9,
  1, 8, 2,  3, 7, 9,  4, 0, 6,  7, 5, 3,  2, 6, 1,  0, 7, 8,  9, 6, 3,  1, 4, 2
};

uint8_t hash2sN = 45;
uint8_t data2sT[] = {
  0, 7,  2, 3,  1, 8,  4, 5,  6, 9,  7, 8,  0, 3,  1, 2,  5, 9,
  4, 6,  3, 5,  2, 8,  7, 9,  1, 6,  0, 4,  6, 8,  3, 7,  2, 4,
  0, 1,  2, 9,  5, 7,  4, 8,  0, 6,  1, 9,  3, 4,  0, 5,  2, 6,
  3, 8,  1, 7,  0, 9,  5, 8,  6, 7,  1, 3,  2, 5,  4, 9,  4, 7,
  8, 9,  5, 6,  0, 2,  1, 4,  3, 6,  2, 7,  0, 8,  3, 9,  1, 5
};

uint8_t hash1sN = 10;
uint8_t data1sT[] = { 3, 4, 5, 6, 1, 2, 0, 7, 9, 8};

uint8_t hash2bN = 96;
uint8_t data2bT[] = {
  18,  0,  10, 11,  15,  3,   6,  4,  13,  1,   9, 16,  12, 19,  17,  8,
  14,  5,   7,  2,  18,  0,  11,  3,   4,  6,  13,  1,   7, 10,   2, 19,
  12, 17,  14, 15,   9,  5,  16,  8,  18,  0,  11,  3,   1, 13,   2, 10,
   4, 14,  19,  9,   7,  6,   8, 17,  16, 12,  15,  5,   0, 18,   3, 11,
  13,  8,   9, 19,   6,  7,  12,  1,   2, 15,   4, 10,  17,  5,  14, 16,
   3, 15,  13, 18,  11, 14,   4,  8,   0,  9,   1, 12,  19,  6,  17,  5,
  16,  2,   7,  0,  10, 13,  14, 18,   8,  3,  11,  1,   4,  9,   6, 19,
  12, 16,  10, 15,   5, 17,   7,  2,   8, 13,   3, 18,  11,  1,   9, 15,
   0,  7,  19,  5,  14,  6,  10, 12,   4, 17,  16,  2,   8, 18,  13,  9,
   1, 11,   3,  4,  19,  5,   6, 14,   7, 17,  16,  2,   0, 10,  15, 12,
   8,  3,  13,  9,  16, 18,  11,  4,  19,  5,   7,  1,   2, 17,  15,  6,
  12,  0,  10, 14,   8,  3,   9, 13,  11,  4,  18, 15,  19,  5,   1, 16
};

int32_t __attribute__ ((noinline)) bloom_h160_chk(const uint8_t *mem, const void *h160, uint8_t n, uint64_t mask) {
  const uint32_t *hL = (uint32_t*)h160;
  const uint16_t *hS = (uint16_t*)h160;
  const uint8_t  *hC = (uint8_t*)h160;
  uint64_t t;

  asm volatile ("nop");
  switch (n) {
    case   0: // legacy
      t = (hL[0]);               if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[1]);               if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[2]);               if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[3]);               if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[4]);               if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[0]<<16|hL[1]>>16); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[1]<<16|hL[2]>>16); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[2]<<16|hL[3]>>16); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[3]<<16|hL[4]>>16); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[4]<<16|hL[0]>>16); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[0]<< 8|hL[1]>>24); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[1]<< 8|hL[2]>>24); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[2]<< 8|hL[3]>>24); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[3]<< 8|hL[4]>>24); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[4]<< 8|hL[0]>>24); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[0]<<24|hL[1]>> 8); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[1]<<24|hL[2]>> 8); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[2]<<24|hL[3]>> 8); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[3]<<24|hL[4]>> 8); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      t = (hL[4]<<24|hL[0]>> 8); if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      return 1;
    case   1: // single
      return memcmp(mem, h160, 20) == 0 ? 1 : 0;
    case  11: // h1s10
      t = ((uint64_t)hS[8]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  10: // h1s9
      t = ((uint64_t)hS[9]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   9: // h1s8
      t = ((uint64_t)hS[7]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   8: // h1s7
      t = ((uint64_t)hS[0]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   7: // h1s6
      t = ((uint64_t)hS[2]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   6: // h1s5
      t = ((uint64_t)hS[1]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   5: // h1s4
      t = ((uint64_t)hS[6]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   4: // h1s3
      t = ((uint64_t)hS[5]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   3: // h1s2
      t = ((uint64_t)hS[4]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case   2: // h1s1
      t = ((uint64_t)hS[3]) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      return 1;
    case 107: // h2b96
      t = ((((uint64_t)hC[ 1]) << 8)
        | ((uint64_t)hC[16])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 106: // h2b95
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 105: // h2b94
      t = ((((uint64_t)hC[18]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 104: // h2b93
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 103: // h2b92
      t = ((((uint64_t)hC[ 9]) << 8)
        | ((uint64_t)hC[13])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 102: // h2b91
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 101: // h2b90
      t = ((((uint64_t)hC[10]) << 8)
        | ((uint64_t)hC[14])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 100: // h2b89
      t = ((((uint64_t)hC[12]) << 8)
        | ((uint64_t)hC[ 0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  99: // h2b88
      t = ((((uint64_t)hC[15]) << 8)
        | ((uint64_t)hC[ 6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  98: // h2b87
      t = ((((uint64_t)hC[ 2]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  97: // h2b86
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  96: // h2b85
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  95: // h2b84
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  94: // h2b83
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  93: // h2b82
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[ 9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  92: // h2b81
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  91: // h2b80
      t = ((((uint64_t)hC[15]) << 8)
        | ((uint64_t)hC[12])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  90: // h2b79
      t = ((((uint64_t)hC[ 0]) << 8)
        | ((uint64_t)hC[10])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  89: // h2b78
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[ 2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  88: // h2b77
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  87: // h2b76
      t = ((((uint64_t)hC[ 6]) << 8)
        | ((uint64_t)hC[14])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  86: // h2b75
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  85: // h2b74
      t = ((((uint64_t)hC[ 3]) << 8)
        | ((uint64_t)hC[ 4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  84: // h2b73
      t = ((((uint64_t)hC[ 1]) << 8)
        | ((uint64_t)hC[11])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  83: // h2b72
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[ 9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  82: // h2b71
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  81: // h2b70
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[ 2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  80: // h2b69
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  79: // h2b68
      t = ((((uint64_t)hC[10]) << 8)
        | ((uint64_t)hC[12])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  78: // h2b67
      t = ((((uint64_t)hC[14]) << 8)
        | ((uint64_t)hC[ 6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  77: // h2b66
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  76: // h2b65
      t = ((((uint64_t)hC[ 0]) << 8)
        | ((uint64_t)hC[ 7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  75: // h2b64
      t = ((((uint64_t)hC[ 9]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  74: // h2b63
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  73: // h2b62
      t = ((((uint64_t)hC[ 3]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  72: // h2b61
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[13])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  71: // h2b60
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[ 2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  70: // h2b59
      t = ((((uint64_t)hC[ 5]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  69: // h2b58
      t = ((((uint64_t)hC[10]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  68: // h2b57
      t = ((((uint64_t)hC[12]) << 8)
        | ((uint64_t)hC[16])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  67: // h2b56
      t = ((((uint64_t)hC[ 6]) << 8)
        | ((uint64_t)hC[19])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  66: // h2b55
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[ 9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  65: // h2b54
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  64: // h2b53
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  63: // h2b52
      t = ((((uint64_t)hC[14]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  62: // h2b51
      t = ((((uint64_t)hC[10]) << 8)
        | ((uint64_t)hC[13])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  61: // h2b50
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[ 0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  60: // h2b49
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[ 2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  59: // h2b48
      t = ((((uint64_t)hC[17]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  58: // h2b47
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  57: // h2b46
      t = ((((uint64_t)hC[ 1]) << 8)
        | ((uint64_t)hC[12])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  56: // h2b45
      t = ((((uint64_t)hC[ 0]) << 8)
        | ((uint64_t)hC[ 9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  55: // h2b44
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[ 8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  54: // h2b43
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[14])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  53: // h2b42
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  52: // h2b41
      t = ((((uint64_t)hC[ 3]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  51: // h2b40
      t = ((((uint64_t)hC[14]) << 8)
        | ((uint64_t)hC[16])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  50: // h2b39
      t = ((((uint64_t)hC[17]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  49: // h2b38
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[10])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  48: // h2b37
      t = ((((uint64_t)hC[ 2]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  47: // h2b36
      t = ((((uint64_t)hC[12]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  46: // h2b35
      t = ((((uint64_t)hC[ 6]) << 8)
        | ((uint64_t)hC[ 7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  45: // h2b34
      t = ((((uint64_t)hC[ 9]) << 8)
        | ((uint64_t)hC[19])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  44: // h2b33
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[ 8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  43: // h2b32
      t = ((((uint64_t)hC[ 3]) << 8)
        | ((uint64_t)hC[11])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  42: // h2b31
      t = ((((uint64_t)hC[ 0]) << 8)
        | ((uint64_t)hC[18])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  41: // h2b30
      t = ((((uint64_t)hC[15]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  40: // h2b29
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[12])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  39: // h2b28
      t = ((((uint64_t)hC[ 8]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  38: // h2b27
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[ 6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  37: // h2b26
      t = ((((uint64_t)hC[19]) << 8)
        | ((uint64_t)hC[ 9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  36: // h2b25
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[14])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  35: // h2b24
      t = ((((uint64_t)hC[ 2]) << 8)
        | ((uint64_t)hC[10])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  34: // h2b23
      t = ((((uint64_t)hC[ 1]) << 8)
        | ((uint64_t)hC[13])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  33: // h2b22
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  32: // h2b21
      t = ((((uint64_t)hC[18]) << 8)
        | ((uint64_t)hC[ 0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  31: // h2b20
      t = ((((uint64_t)hC[16]) << 8)
        | ((uint64_t)hC[ 8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  30: // h2b19
      t = ((((uint64_t)hC[ 9]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  29: // h2b18
      t = ((((uint64_t)hC[14]) << 8)
        | ((uint64_t)hC[15])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  28: // h2b17
      t = ((((uint64_t)hC[12]) << 8)
        | ((uint64_t)hC[17])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  27: // h2b16
      t = ((((uint64_t)hC[ 2]) << 8)
        | ((uint64_t)hC[19])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  26: // h2b15
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[10])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  25: // h2b14
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  24: // h2b13
      t = ((((uint64_t)hC[ 4]) << 8)
        | ((uint64_t)hC[ 6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  23: // h2b12
      t = ((((uint64_t)hC[11]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  22: // h2b11
      t = ((((uint64_t)hC[18]) << 8)
        | ((uint64_t)hC[ 0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  21: // h2b10
      t = ((((uint64_t)hC[ 7]) << 8)
        | ((uint64_t)hC[ 2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  20: // h2b9
      t = ((((uint64_t)hC[14]) << 8)
        | ((uint64_t)hC[ 5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  19: // h2b8
      t = ((((uint64_t)hC[17]) << 8)
        | ((uint64_t)hC[ 8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  18: // h2b7
      t = ((((uint64_t)hC[12]) << 8)
        | ((uint64_t)hC[19])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  17: // h2b6
      t = ((((uint64_t)hC[ 9]) << 8)
        | ((uint64_t)hC[16])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  16: // h2b5
      t = ((((uint64_t)hC[13]) << 8)
        | ((uint64_t)hC[ 1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  15: // h2b4
      t = ((((uint64_t)hC[ 6]) << 8)
        | ((uint64_t)hC[ 4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  14: // h2b3
      t = ((((uint64_t)hC[15]) << 8)
        | ((uint64_t)hC[ 3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  13: // h2b2
      t = ((((uint64_t)hC[10]) << 8)
        | ((uint64_t)hC[11])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case  12: // h2b1
      t = ((((uint64_t)hC[18]) << 8)
        | ((uint64_t)hC[ 0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      return 1;
    case 152: // h2s45
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 151: // h2s44
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 150: // h2s43
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 149: // h2s42
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 148: // h2s41
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 147: // h2s40
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 146: // h2s39
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 145: // h2s38
      t = ((((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 144: // h2s37
      t = ((((uint64_t)hS[8]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 143: // h2s36
      t = ((((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 142: // h2s35
      t = ((((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 141: // h2s34
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 140: // h2s33
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 139: // h2s32
      t = ((((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 138: // h2s31
      t = ((((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 137: // h2s30
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 136: // h2s29
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 135: // h2s28
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 134: // h2s27
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 133: // h2s26
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 132: // h2s25
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 131: // h2s24
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 130: // h2s23
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 129: // h2s22
      t = ((((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 128: // h2s21
      t = ((((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 127: // h2s20
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 126: // h2s19
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 125: // h2s18
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 124: // h2s17
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 123: // h2s16
      t = ((((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 122: // h2s15
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 121: // h2s14
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 120: // h2s13
      t = ((((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 119: // h2s12
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 118: // h2s11
      t = ((((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 117: // h2s10
      t = ((((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 116: // h2s9
      t = ((((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 115: // h2s8
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 114: // h2s7
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 113: // h2s6
      t = ((((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 112: // h2s5
      t = ((((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 111: // h2s4
      t = ((((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 110: // h2s3
      t = ((((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 109: // h2s2
      t = ((((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 108: // h2s1
      t = ((((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      return 1;
    case 248: // h3s96
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 247: // h3s95
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 246: // h3s94
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 245: // h3s93
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 244: // h3s92
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 243: // h3s91
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 242: // h3s90
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 241: // h3s89
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[8]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 240: // h3s88
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 239: // h3s87
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 238: // h3s86
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[8]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 237: // h3s85
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 236: // h3s84
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 235: // h3s83
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 234: // h3s82
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[9]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 233: // h3s81
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 232: // h3s80
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 231: // h3s79
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 230: // h3s78
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 229: // h3s77
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 228: // h3s76
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 227: // h3s75
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 226: // h3s74
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 225: // h3s73
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 224: // h3s72
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 223: // h3s71
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 222: // h3s70
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 221: // h3s69
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 220: // h3s68
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 219: // h3s67
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 218: // h3s66
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 217: // h3s65
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 216: // h3s64
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 215: // h3s63
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 214: // h3s62
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 213: // h3s61
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[9]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 212: // h3s60
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 211: // h3s59
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 210: // h3s58
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[9]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 209: // h3s57
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 208: // h3s56
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 207: // h3s55
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 206: // h3s54
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 205: // h3s53
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 204: // h3s52
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 203: // h3s51
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[9]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 202: // h3s50
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 201: // h3s49
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[8]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 200: // h3s48
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[0])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 199: // h3s47
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[9]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 198: // h3s46
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 197: // h3s45
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 196: // h3s44
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 195: // h3s43
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 194: // h3s42
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 193: // h3s41
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 192: // h3s40
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 191: // h3s39
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 190: // h3s38
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 189: // h3s37
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[8]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 188: // h3s36
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 187: // h3s35
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 186: // h3s34
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 185: // h3s33
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 184: // h3s32
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 183: // h3s31
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 182: // h3s30
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 181: // h3s29
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 180: // h3s28
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 179: // h3s27
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 178: // h3s26
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 177: // h3s25
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 176: // h3s24
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 175: // h3s23
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 174: // h3s22
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 173: // h3s21
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 172: // h3s20
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 171: // h3s19
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[1])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 170: // h3s18
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 169: // h3s17
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 168: // h3s16
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 167: // h3s15
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[4])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 166: // h3s14
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 165: // h3s13
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 164: // h3s12
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 163: // h3s11
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[3]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 162: // h3s10
      t = ((((uint64_t)hS[7]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[6])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 161: // h3s9
      t = ((((uint64_t)hS[8]) << 32)
        | (((uint64_t)hS[5]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 160: // h3s8
      t = ((((uint64_t)hS[9]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[2])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 159: // h3s7
      t = ((((uint64_t)hS[5]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 158: // h3s6
      t = ((((uint64_t)hS[6]) << 32)
        | (((uint64_t)hS[7]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 157: // h3s5
      t = ((((uint64_t)hS[4]) << 32)
        | (((uint64_t)hS[6]) << 16)
        | ((uint64_t)hS[9])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 156: // h3s4
      t = ((((uint64_t)hS[2]) << 32)
        | (((uint64_t)hS[4]) << 16)
        | ((uint64_t)hS[5])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 155: // h3s3
      t = ((((uint64_t)hS[3]) << 32)
        | (((uint64_t)hS[1]) << 16)
        | ((uint64_t)hS[8])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 154: // h3s2
      t = ((((uint64_t)hS[0]) << 32)
        | (((uint64_t)hS[2]) << 16)
        | ((uint64_t)hS[3])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      // fall through
    case 153: // h3s1
      t = ((((uint64_t)hS[1]) << 32)
        | (((uint64_t)hS[0]) << 16)
        | ((uint64_t)hS[7])) & mask;
      if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }
      return 1;
    case 255: // error
      return -1;
    default:  // abort
#pragma GCC diagnostic ignored "-Wunused-result"
      write(2, "Bad hash id!\n", 13);
#pragma GCC diagnostic pop
      exit(255);
  }

  return 0;
}

char hashD[256][8] = {
    "legacy\0",   "single\0", "h1s1\0\0\0", "h1s2\0\0\0",
  "h1s3\0\0\0", "h1s4\0\0\0", "h1s5\0\0\0", "h1s6\0\0\0",
  "h1s7\0\0\0", "h1s8\0\0\0", "h1s9\0\0\0",  "h1s10\0\0",
  "h2b1\0\0\0", "h2b2\0\0\0", "h2b3\0\0\0", "h2b4\0\0\0",
  "h2b5\0\0\0", "h2b6\0\0\0", "h2b7\0\0\0", "h2b8\0\0\0",
  "h2b9\0\0\0",  "h2b10\0\0",  "h2b11\0\0",  "h2b12\0\0",
   "h2b13\0\0",  "h2b14\0\0",  "h2b15\0\0",  "h2b16\0\0",
   "h2b17\0\0",  "h2b18\0\0",  "h2b19\0\0",  "h2b20\0\0",
   "h2b21\0\0",  "h2b22\0\0",  "h2b23\0\0",  "h2b24\0\0",
   "h2b25\0\0",  "h2b26\0\0",  "h2b27\0\0",  "h2b28\0\0",
   "h2b29\0\0",  "h2b30\0\0",  "h2b31\0\0",  "h2b32\0\0",
   "h2b33\0\0",  "h2b34\0\0",  "h2b35\0\0",  "h2b36\0\0",
   "h2b37\0\0",  "h2b38\0\0",  "h2b39\0\0",  "h2b40\0\0",
   "h2b41\0\0",  "h2b42\0\0",  "h2b43\0\0",  "h2b44\0\0",
   "h2b45\0\0",  "h2b46\0\0",  "h2b47\0\0",  "h2b48\0\0",
   "h2b49\0\0",  "h2b50\0\0",  "h2b51\0\0",  "h2b52\0\0",
   "h2b53\0\0",  "h2b54\0\0",  "h2b55\0\0",  "h2b56\0\0",
   "h2b57\0\0",  "h2b58\0\0",  "h2b59\0\0",  "h2b60\0\0",
   "h2b61\0\0",  "h2b62\0\0",  "h2b63\0\0",  "h2b64\0\0",
   "h2b65\0\0",  "h2b66\0\0",  "h2b67\0\0",  "h2b68\0\0",
   "h2b69\0\0",  "h2b70\0\0",  "h2b71\0\0",  "h2b72\0\0",
   "h2b73\0\0",  "h2b74\0\0",  "h2b75\0\0",  "h2b76\0\0",
   "h2b77\0\0",  "h2b78\0\0",  "h2b79\0\0",  "h2b80\0\0",
   "h2b81\0\0",  "h2b82\0\0",  "h2b83\0\0",  "h2b84\0\0",
   "h2b85\0\0",  "h2b86\0\0",  "h2b87\0\0",  "h2b88\0\0",
   "h2b89\0\0",  "h2b90\0\0",  "h2b91\0\0",  "h2b92\0\0",
   "h2b93\0\0",  "h2b94\0\0",  "h2b95\0\0",  "h2b96\0\0",
  "h2s1\0\0\0", "h2s2\0\0\0", "h2s3\0\0\0", "h2s4\0\0\0",
  "h2s5\0\0\0", "h2s6\0\0\0", "h2s7\0\0\0", "h2s8\0\0\0",
  "h2s9\0\0\0",  "h2s10\0\0",  "h2s11\0\0",  "h2s12\0\0",
   "h2s13\0\0",  "h2s14\0\0",  "h2s15\0\0",  "h2s16\0\0",
   "h2s17\0\0",  "h2s18\0\0",  "h2s19\0\0",  "h2s20\0\0",
   "h2s21\0\0",  "h2s22\0\0",  "h2s23\0\0",  "h2s24\0\0",
   "h2s25\0\0",  "h2s26\0\0",  "h2s27\0\0",  "h2s28\0\0",
   "h2s29\0\0",  "h2s30\0\0",  "h2s31\0\0",  "h2s32\0\0",
   "h2s33\0\0",  "h2s34\0\0",  "h2s35\0\0",  "h2s36\0\0",
   "h2s37\0\0",  "h2s38\0\0",  "h2s39\0\0",  "h2s40\0\0",
   "h2s41\0\0",  "h2s42\0\0",  "h2s43\0\0",  "h2s44\0\0",
   "h2s45\0\0", "h3s1\0\0\0", "h3s2\0\0\0", "h3s3\0\0\0",
  "h3s4\0\0\0", "h3s5\0\0\0", "h3s6\0\0\0", "h3s7\0\0\0",
  "h3s8\0\0\0", "h3s9\0\0\0",  "h3s10\0\0",  "h3s11\0\0",
   "h3s12\0\0",  "h3s13\0\0",  "h3s14\0\0",  "h3s15\0\0",
   "h3s16\0\0",  "h3s17\0\0",  "h3s18\0\0",  "h3s19\0\0",
   "h3s20\0\0",  "h3s21\0\0",  "h3s22\0\0",  "h3s23\0\0",
   "h3s24\0\0",  "h3s25\0\0",  "h3s26\0\0",  "h3s27\0\0",
   "h3s28\0\0",  "h3s29\0\0",  "h3s30\0\0",  "h3s31\0\0",
   "h3s32\0\0",  "h3s33\0\0",  "h3s34\0\0",  "h3s35\0\0",
   "h3s36\0\0",  "h3s37\0\0",  "h3s38\0\0",  "h3s39\0\0",
   "h3s40\0\0",  "h3s41\0\0",  "h3s42\0\0",  "h3s43\0\0",
   "h3s44\0\0",  "h3s45\0\0",  "h3s46\0\0",  "h3s47\0\0",
   "h3s48\0\0",  "h3s49\0\0",  "h3s50\0\0",  "h3s51\0\0",
   "h3s52\0\0",  "h3s53\0\0",  "h3s54\0\0",  "h3s55\0\0",
   "h3s56\0\0",  "h3s57\0\0",  "h3s58\0\0",  "h3s59\0\0",
   "h3s60\0\0",  "h3s61\0\0",  "h3s62\0\0",  "h3s63\0\0",
   "h3s64\0\0",  "h3s65\0\0",  "h3s66\0\0",  "h3s67\0\0",
   "h3s68\0\0",  "h3s69\0\0",  "h3s70\0\0",  "h3s71\0\0",
   "h3s72\0\0",  "h3s73\0\0",  "h3s74\0\0",  "h3s75\0\0",
   "h3s76\0\0",  "h3s77\0\0",  "h3s78\0\0",  "h3s79\0\0",
   "h3s80\0\0",  "h3s81\0\0",  "h3s82\0\0",  "h3s83\0\0",
   "h3s84\0\0",  "h3s85\0\0",  "h3s86\0\0",  "h3s87\0\0",
   "h3s88\0\0",  "h3s89\0\0",  "h3s90\0\0",  "h3s91\0\0",
   "h3s92\0\0",  "h3s93\0\0",  "h3s94\0\0",  "h3s95\0\0",
   "h3s96\0\0",  "abort\0\0",  "abort\0\0",  "abort\0\0",
   "abort\0\0",  "abort\0\0",  "abort\0\0",  "error\0\0"
};

uint64_t hashJ[256] = {
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,
  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0
};

/*  vim: set ts=2 sw=2 et ai si: */
