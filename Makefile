CC=gcc
CFLAGS=-ggdb -O2 -Wall -Wextra -Wno-unused-function -Wno-pointer-sign \
	-pedantic -std=gnu99 -flto -flto-partition=none

LDFLAGS=$(CFLAGS)
LDLIBS=-lm

# https://stackoverflow.com/a/41710495/370695
bloom_h160_chk.c: bloomslice_hashes.py.intermediate
	@# Empty recipe to propagate "newness" from the intermediate to final targets

hex.o: hex.c hex.h
	$(CC) $(CFLAGS) -o hex.o -c hex.c

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.INTERMEDIATE: bloomslice_hashes.py.intermediate
bloomslice_hashes.py.intermediate: bloomslice_hashes.py
	python3 bloomslice_hashes.py || python2 bloomslice_hashes.py || python bloomslice_hashes.py

bloom_h160_chk.o: bloom_h160_chk.c
	$(CC) $(CFLAGS) -o $@ -c $<

bfstool: bfstool.c bloom_h160_chk.o bloom_h160_set.o bloomutl.o hex.o mmapf.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

pcalc: pcalc.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

clean:
	rm -f $(ASMGEN) *.o pcalc bfstool || /bin/true
