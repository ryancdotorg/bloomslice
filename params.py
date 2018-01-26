#!/usr/bin/env python
import sys
import itertools

import random
random.seed(31337)
#from random import SystemRandom
#random = SystemRandom()

combos2 = list(itertools.combinations(xrange(10), 2))
random.shuffle(combos2)

c2 = []
counts = [0,0,0,0,0, 0,0,0,0,0]

while len(c2) < len(combos2):
    best_c = None
    best_s = 999999999
    #print c2
    #print counts
    for c in combos2:
        if c not in c2:
            s = counts[c[0]] + counts[c[1]]
            if s < best_s:
                best_s = s
                best_c = c
                #print 'best: %d %s' % (s, str(c))
        
    counts[best_c[0]] += 1
    counts[best_c[1]] += 1

    c2.append(best_c)

#combos3 = [random.choice(list(itertools.permutations(x))) for x in list(itertools.combinations(xrange(10), 3))]
combos3 = list(itertools.combinations(xrange(10), 3))
random.shuffle(combos3)

combos = []

c3 = []
c3_sorted = []
counts = [0,0,0,0,0, 0,0,0,0,0]

for a in c2:
    best_c = None
    best_s = 999999999
    x = list(xrange(10))
    random.shuffle(x)
    for n in x:
        if n not in a:
            c = (n, a[0], a[1])
            c_sorted = tuple(sorted(c))
            if c_sorted not in c3_sorted:
                s = counts[n]
                if s < best_s:
                    best_s = s
                    best_c = c
    
    if best_c is None:
        print 'fucked'
        sys.exit(0)

    counts[best_c[0]] += 1

    c3.append(best_c)
    c3_sorted.append(tuple(sorted(best_c)))
    print 'best: %d %s' % (best_s, str(best_c))

counts = [0,0,0,0,0, 0,0,0,0,0]
for c in c3:
    counts[c[0]] += 1
    counts[c[1]] += 1
    counts[c[2]] += 1

while len(c3) < len(combos3):
    best_c = None
    best_s = 999999999
    for c in combos3:
        if c not in c3_sorted:
            s = counts[c[0]] + counts[c[1]] + counts[c[2]]
            if s < best_s:
                best_s = s
                best_c = c
        
    counts[best_c[0]] += 1
    counts[best_c[1]] += 1
    counts[best_c[2]] += 1

    c3_sorted.append(best_c)
    best_c = list(best_c)
    random.shuffle(best_c)
    best_c = tuple(best_c)
    c3.append(best_c)
    print 'best: %d %s' % (best_s, str(best_c))

print c3
