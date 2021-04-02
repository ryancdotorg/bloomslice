#!/usr/bin/env python3
from __future__ import print_function

import sys
import itertools

import random
random.seed(31337)
#from random import SystemRandom
#random = SystemRandom()

MAX_HASHES = 96

def padcstr(s, length):
    n = len(s) + 1
    if n < length:
        s += '\\0' * (length - n)
    return '"%s"' % s

combos_b2 = list(itertools.combinations(range(20), 2))
random.shuffle(combos_b2)

cb2 = []
counts_b = [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0]

while len(cb2) < len(combos_b2):
    best_c = None
    best_s = 999999999
    for c in combos_b2:
        if c not in cb2:
            s = counts_b[c[0]] + counts_b[c[1]]
            if s < best_s:
                c = list(c)
                random.shuffle(c)
                c = tuple(c)
                best_s = s
                best_c = c

    counts_b[best_c[0]] += 1
    counts_b[best_c[1]] += 1

    cb2.append(best_c)

cs1 = list(itertools.combinations(range(10), 1))
random.shuffle(cs1)

combos_s2 = list(itertools.combinations(range(10), 2))
random.shuffle(combos_s2)

cs2 = []
counts_s = [0,0,0,0,0, 0,0,0,0,0]

while len(cs2) < len(combos_s2):
    best_c = None
    best_s = 999999999
    for c in combos_s2:
        if c not in cs2:
            s = counts_s[c[0]] + counts_s[c[1]]
            if s < best_s:
                best_s = s
                best_c = c

    counts_s[best_c[0]] += 1
    counts_s[best_c[1]] += 1

    cs2.append(best_c)

combos_s3 = list(itertools.combinations(range(10), 3))
random.shuffle(combos_s3)

combos_s = []

cs3 = []
cs3_sorted = []
counts_s = [0,0,0,0,0, 0,0,0,0,0]

for a in cs2:
    best_c = None
    best_s = 999999999
    x = list(range(10))
    random.shuffle(x)
    for n in x:
        if n not in a:
            c = (n, a[0], a[1])
            c_sorted = tuple(sorted(c))
            if c_sorted not in cs3_sorted:
                s = counts_s[n]
                if s < best_s:
                    best_s = s
                    best_c = c

    if best_c is None:
        print('fucked')
        sys.exit(0)

    counts_s[best_c[0]] += 1

    cs3.append(best_c)
    cs3_sorted.append(tuple(sorted(best_c)))

counts_s = [0,0,0,0,0, 0,0,0,0,0]
for c in cs3:
    counts_s[c[0]] += 1
    counts_s[c[1]] += 1
    counts_s[c[2]] += 1

while len(cs3) < len(combos_s3):
    best_c = None
    best_s = 999999999
    for c in combos_s3:
        if c not in cs3_sorted:
            s = counts_s[c[0]] + counts_s[c[1]] + counts_s[c[2]]
            if s < best_s:
                best_s = s
                best_c = c

    counts_s[best_c[0]] += 1
    counts_s[best_c[1]] += 1
    counts_s[best_c[2]] += 1

    cs3_sorted.append(best_c)
    best_c = list(best_c)
    random.shuffle(best_c)
    best_c = tuple(best_c)
    cs3.append(best_c)

with open('bloom_h160_chk.c', 'w') as f:
    f.write('#include <stdint.h>\n')
    f.write('#include <stdlib.h>\n')
    f.write('#include <string.h>\n')
    f.write('#include <unistd.h>\n')
    f.write('\n')
    f.write('#include "bloom_h160_chk.h"\n')
    f.write('#include "extern.h"\n')
    f.write('\n')

    n = min(MAX_HASHES, len(cs3))
    f.write('uint8_t hash3sN = %d;\n' % n)
    f.write('uint8_t data3sT[] = {\n')
    for i in range(n):
        c = cs3[i]
        f.write('  %d, %d, %d' % (c[0], c[1], c[2]))
        if i < n-1:
            f.write(',')
            if i % 8 == 7:
                f.write('\n')
        else:
            f.write('\n')
    f.write('};\n\n')

    n = min(MAX_HASHES, len(cs2))
    f.write('uint8_t hash2sN = %d;\n' % n)
    f.write('uint8_t data2sT[] = {\n')
    for i in range(n):
        c = cs3[i]
        f.write('  %d, %d' % (c[1], c[2]))
        if i < n-1:
            f.write(',')
            if i % 9 == 8:
                f.write('\n')
        else:
            f.write('\n')
    f.write('};\n\n')

    n = min(MAX_HASHES, len(cs1))
    f.write('uint8_t hash1sN = %d;\n' % n)
    f.write('uint8_t data1sT[] = {')
    for i in range(n):
        c = cs1[i]
        f.write(' %d' % (c[0]))
        if i < n-1:
            f.write(',')
    f.write('};\n\n')

    n = min(MAX_HASHES, len(cb2))
    f.write('uint8_t hash2bN = %d;\n' % n)
    f.write('uint8_t data2bT[] = {\n')
    for i in range(n):
        c = cb2[i]
        f.write('  %2d, %2d' % (c[0], c[1]))
        if i < n-1:
            f.write(',')
            if i % 8 == 7:
                f.write('\n')
        else:
            f.write('\n')
    f.write('};\n\n')

    desc = ['abort'] * 256
    desc[255] = 'error'
    desc[0] = 'legacy'
    desc[1] = 'single'

    f.write('int32_t __attribute__ ((noinline)) bloom_h160_chk(const uint8_t *mem, const void *h160, uint8_t n, uint64_t mask) {\n')
    f.write('  const uint32_t *hL = (uint32_t*)h160;\n')
    f.write('  const uint16_t *hS = (uint16_t*)h160;\n')
    f.write('  const uint8_t  *hC = (uint8_t*)h160;\n')
    f.write('  uint64_t t;\n\n')

    #if_miss = 'if (((mem[(t)>>3]>>((t)&7))&1) == 0) { goto bloom_miss; }'
    if_miss = 'if (((mem[(t)>>3]>>((t)&7))&1) == 0) { return 0; }'

    f.write('  asm volatile ("nop");\n')
    f.write('  switch (n) {\n')
    f.write('    case   0: // legacy\n')
    f.write('      t = (hL[0]);               %s\n' % if_miss)
    f.write('      t = (hL[1]);               %s\n' % if_miss)
    f.write('      t = (hL[2]);               %s\n' % if_miss)
    f.write('      t = (hL[3]);               %s\n' % if_miss)
    f.write('      t = (hL[4]);               %s\n' % if_miss)
    f.write('      t = (hL[0]<<16|hL[1]>>16); %s\n' % if_miss)
    f.write('      t = (hL[1]<<16|hL[2]>>16); %s\n' % if_miss)
    f.write('      t = (hL[2]<<16|hL[3]>>16); %s\n' % if_miss)
    f.write('      t = (hL[3]<<16|hL[4]>>16); %s\n' % if_miss)
    f.write('      t = (hL[4]<<16|hL[0]>>16); %s\n' % if_miss)
    f.write('      t = (hL[0]<< 8|hL[1]>>24); %s\n' % if_miss)
    f.write('      t = (hL[1]<< 8|hL[2]>>24); %s\n' % if_miss)
    f.write('      t = (hL[2]<< 8|hL[3]>>24); %s\n' % if_miss)
    f.write('      t = (hL[3]<< 8|hL[4]>>24); %s\n' % if_miss)
    f.write('      t = (hL[4]<< 8|hL[0]>>24); %s\n' % if_miss)
    f.write('      t = (hL[0]<<24|hL[1]>> 8); %s\n' % if_miss)
    f.write('      t = (hL[1]<<24|hL[2]>> 8); %s\n' % if_miss)
    f.write('      t = (hL[2]<<24|hL[3]>> 8); %s\n' % if_miss)
    f.write('      t = (hL[3]<<24|hL[4]>> 8); %s\n' % if_miss)
    f.write('      t = (hL[4]<<24|hL[0]>> 8); %s\n' % if_miss)
    f.write('      return 1;\n')
    f.write('    case   1: // single\n')
    f.write('      return memcmp(mem, h160, 20) == 0 ? 1 : 0;\n')

    caseOffset = 2
    n = min(MAX_HASHES, len(cs1))
    for i in range(1, n+1):
        nHash = 1 + (n - i)
        algId = (caseOffset + n) - i
        algName = 'h1s%d' % nHash
        desc[algId] = algName
        c = cs1[n-i]
        f.write('    case %3d: // %s\n' % (algId, algName))
        f.write('      t = ((uint64_t)hS[%d]) & mask;\n' % c[0])
        f.write('      %s\n' % if_miss)
        if i != n:
            f.write('      // fall through\n')
        else:
            f.write('      return 1;\n')

    caseOffset += n
    n = min(MAX_HASHES, len(cb2))
    for i in range(1, n+1):
        nHash = 1 + (n - i)
        algId = (caseOffset + n) - i
        algName = 'h2b%d' % nHash
        desc[algId] = algName
        c = cb2[n-i]
        f.write('    case %3d: // %s\n' % (algId, algName))
        f.write('      t = ((((uint64_t)hC[%2d]) << 8)\n' % c[0])
        f.write('        | ((uint64_t)hC[%2d])) & mask;\n' % c[1])
        f.write('      %s\n' % if_miss)
        if i != n:
            f.write('      // fall through\n')
        else:
            f.write('      return 1;\n')

    caseOffset += n
    n = min(MAX_HASHES, len(cs2))
    for i in range(1, n+1):
        nHash = 1 + (n - i)
        algId = (caseOffset + n) - i
        algName = 'h2s%d' % nHash
        desc[algId] = algName
        c = cs3[n-i]
        f.write('    case %3d: // %s\n' % (algId, algName))
        f.write('      t = ((((uint64_t)hS[%d]) << 16)\n' % c[1])
        f.write('        | ((uint64_t)hS[%d])) & mask;\n' % c[2])
        f.write('      %s\n' % if_miss)
        if i != n:
            f.write('      // fall through\n')
        else:
            f.write('      return 1;\n')

    caseOffset += n
    n = min(MAX_HASHES, len(cs3))
    for i in range(1, n+1):
        nHash = 1 + (n - i)
        algId = (caseOffset + n) - i
        algName = 'h3s%d' % nHash
        desc[algId] = algName
        c = cs3[n-i]
        f.write('    case %3d: // %s\n' % (algId, algName))
        f.write('      t = ((((uint64_t)hS[%d]) << 32)\n' % c[0])
        f.write('        | (((uint64_t)hS[%d]) << 16)\n' % c[1])
        f.write('        | ((uint64_t)hS[%d])) & mask;\n' % c[2])
        f.write('      %s\n' % if_miss)
        if i != n:
            f.write('      // fall through\n')
        else:
            f.write('      return 1;\n')

    f.write('    case 255: // error\n')
    f.write('      return -1;\n')
    f.write('    default:  // abort\n')
    f.write('#pragma GCC diagnostic ignored "-Wunused-result"\n')
    f.write('      write(2, "Bad hash id!\\n", 13);\n')
    f.write('#pragma GCC diagnostic pop\n')
    f.write('      exit(255);\n')
    f.write('  }\n\n')

    #f.write('bloom_miss:\n')
    f.write('  return 0;\n')
    f.write('}\n\n')

    f.write('char hashD[256][8] = {\n')
    for i in range(256):
        if i % 4 == 0:
            f.write('  ')
        f.write('%12s' % padcstr(desc[i], 8))
        if i < 255:
            f.write(',')
        if i % 4 < 3:
            f.write(' ')
        else:
            f.write('\n')
    f.write('};\n\n')

    f.write('uint64_t hashJ[256] = {\n')
    for i in range(16):
        f.write('  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0')
        if i < 15:
            f.write(',')
        f.write('\n')
    f.write('};\n\n')

    f.write('/*  vim: set ts=2 sw=2 et ai si: */\n')
