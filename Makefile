CC=gcc
CFLAGS=-ggdb -O2 -Wall -Wextra -Wno-unused-function -Wno-pointer-sign \
	-pedantic -std=gnu11 -flto -flto-partition=none

LDFLAGS=$(CFLAGS)
LDLIBS=-lm

ifeq ($(MAKECMDGOALS),clean)
clean:
	rm -f *.o bloom_h160_chk.c pcalc bfstool bloomslice.a || /bin/true
else ifeq ($(words $(filter clean,$(MAKECMDGOALS))),1)
.NOT_PARALLEL:
$(filter-out clean,$(MAKECMDGOALS)):
	@true

clean:
	@$(MAKE) clean
	@$(MAKE) $(filter-out clean,$(MAKECMDGOALS))

else

all: bfstool pcalc bloomslice.a

# https://stackoverflow.com/a/41710495/370695
bloom_h160_chk.c: bloomslice_hashes.py.intermediate
	@# Empty recipe to propagate "newness" from the intermediate to final targets

%.o: %.c %.h
	$(CC) $(CFLAGS) -o $@ -c $<

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.INTERMEDIATE: bloomslice_hashes.py.intermediate
bloomslice_hashes.py.intermediate: bloomslice_hashes.py
	./bloomslice_hashes.py bloom_h160_chk.c

bfstool: bfstool.o bloom_h160_chk.o bloom_h160_set.o bloomutl.o hex.o mmapf.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

pcalc: pcalc.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

bloomslice.a: bloom_h160_chk.o bloom_h160_set.o bloomutl.o
	ar rcs $@ $^
endif
