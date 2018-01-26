#!/usr/bin/env python
import sys
import itertools

import random
random.seed(31337)
#from random import SystemRandom
#random = SystemRandom()

MAX_HASHES = 96

combos_b2 = list(itertools.combinations(xrange(20), 2))
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

cs1 = list(itertools.combinations(xrange(10), 1))
random.shuffle(cs1)

combos_s2 = list(itertools.combinations(xrange(10), 2))
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

combos_s3 = list(itertools.combinations(xrange(10), 3))
random.shuffle(combos_s3)

combos_s = []

cs3 = []
cs3_sorted = []
counts_s = [0,0,0,0,0, 0,0,0,0,0]

for a in cs2:
    best_c = None
    best_s = 999999999
    x = list(xrange(10))
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
        print 'fucked'
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

with open('hash3s.inc', 'w') as f:
    n = min(MAX_HASHES, len(cs3))
    f.write('  %%assign hash3s_n %d\n' % n)
    for i in xrange(1, n+1):
        c = cs3[n-i]
        f.write('  hashns %3d, %2d, %2d, %2d\n  check_bit\n' % (1+(n-i), c[0]*2, c[1]*2, c[2]*2))
    f.write('hash3s0:\n')
    f.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('hash2s.inc', 'w') as f:
    n = min(MAX_HASHES, len(cs2))
    f.write('  %%assign hash2s_n %d\n' % n)
    for i in xrange(1, n+1):
        c = cs3[n-i]
        f.write('  hashns %3d, %2d, %2d\n  check_bit\n' % (1+(n-i), c[1]*2, c[2]*2))
    f.write('hash2s0:\n')
    f.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('hash1s.inc', 'w') as f:
    n = min(MAX_HASHES, len(cs1))
    f.write('  %%assign hash1s_n %d\n' % n)
    for i in xrange(1, n+1):
        c = cs1[n-i]
        f.write('  hashns %3d, %2d\n  check_bit\n' % (1+(n-i), c[0]*2))
    f.write('hash1s0:\n')
    f.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('data3s.inc', 'w') as d:
    for i in xrange(min(MAX_HASHES, len(cs3))):
        c = cs3[i]
        d.write('  db %2d, %2d, %2d\n' % (c[0], c[1], c[2]))
    d.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('data2s.inc', 'w') as d:
    for i in xrange(min(MAX_HASHES, len(cs2))):
        c = cs3[i]
        d.write('  db %2d, %2d\n' % (c[1], c[2]))
    d.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('data1s.inc', 'w') as d:
    for i in xrange(min(MAX_HASHES, len(cs1))):
        c = cs1[i]
        d.write('  db %2d\n' % (c[0]))
    d.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')


with open('hash2b.inc', 'w') as f:
    n = min(MAX_HASHES, len(cb2))
    f.write('  %%assign hash2b_n %d\n' % n)
    for i in xrange(1, n+1):
        c = cb2[n-i]
        f.write('  hashnb %3d, %2d, %2d\n  check_bit\n' % (1+(n-i), c[0], c[1]))
    f.write('hash2b0:\n')
    f.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')

with open('data2b.inc', 'w') as d:
    for i in xrange(min(MAX_HASHES, len(cb2))):
        c = cb2[i]
        d.write('  db %2d, %2d\n' % (c[0], c[1]))
    d.write('\n; vi'+'m:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm\n')
