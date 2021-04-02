CC=gcc
CFLAGS=-ggdb -O2 -Wall -Wextra -Wno-unused-function -Wno-pointer-sign \
	-pedantic -std=gnu99 -flto -flto-partition=none

LDFLAGS=$(CFLAGS)
LDLIBS=-lm
ASMGEN=hash2b.inc hash1s.inc hash2s.inc hash3s.inc \
	data2b.inc data1s.inc data2s.inc data3s.inc
ASMINCS=$(ASMGEN) legacy.inc

#OBJS=ffrngbtc.o rmd160256.o sha256.o

# https://stackoverflow.com/a/41710495/370695
bloom_h160_chk.c $(ASMGEN): bloomslice_hashes.py.intermediate
	@# Empty recipe to propagate "newness" from the intermediate to final targets

hex.o: hex.c hex.h
	$(CC) $(CFLAGS) -o hex.o -c hex.c

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.INTERMEDIATE: bloomslice_hashes.py.intermediate
bloomslice_hashes.py.intermediate: bloomslice_hashes.py
	python3 bloomslice_hashes.py || python2 bloomslice_hashes.py || python bloomslice_hashes.py

bloom_h160_chk_asm.o: bloom_h160_chk.asm art.asm hash.mac $(ASMINCS)
	nasm -w+all -f elf64 -Ox -o $@ $<

bloom_h160_chk.o: bloom_h160_chk.c
	$(CC) $(CFLAGS) -o $@ -c $<

bfstool-asm: bfstool.c bloom_h160_chk_asm.o bloom_h160_set.o bloomutl.o hex.o mmapf.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

bfstool: bfstool.c bloom_h160_chk.o bloom_h160_set.o bloomutl.o hex.o mmapf.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

#asmwrap: asmwrap.c bloom_h160_chk.o bloom_h160_set.o
#	$(CC) $(CFLAGS) -o $@ $^

pcalc: pcalc.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

clean:
	rm -f $(ASMGEN) *.o pcalc bfstool || /bin/true

#install: all
#	cp --remove-destination -p ffrngbtc /usr/local/bin/
#
#clean:
#	rm -f ffrngbtc *.o
#
#ffrngbtc: $(OBJS)
#
#$(OBJS): Makefile *.h secp256k1/src/libsecp256k1-config.h secp256k1/src/ecmult_static_context.h
