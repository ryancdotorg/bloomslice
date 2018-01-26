/* Copyright (c) 2015 Ryan Castellucci, All Rights Reserved */
#include <time.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>

#include <arpa/inet.h> /* for ntohl/htonl */

#include <sys/stat.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sys/types.h>

#include "hex.h"
#include "bloomslice.h"
#include "mmapf.h"
#include "hash160.h"

int main(int argc, char **argv) {
  int ret;
  hash160_t hash;
  char *line = NULL;
  size_t line_sz = 0, bloom_size;
  unsigned char *bloom, *bloomfile;
  FILE *ifile = stdin, *ofile = stdout;
  mmapf_ctx bloom_mmapf;

  uint64_t mask = 0, hashes = 0;

  struct stat sb;

  if (argc != 2) {
    fprintf(stderr, "Usage: %s BLOOM_FILTER_FILE\n", argv[0]);
    return 1;
  }

  bloomfile = argv[1];

  if (stat(bloomfile, &sb) == 0) {
    if (!S_ISREG(sb.st_mode)) {
      fprintf(stderr, "Bloom filter file '%s' is not a regular file.\n", bloomfile);
      return 1;
    }
    // true if filesize isn't a power of two plus sizeof(uint64_t)*2
    if ( (sb.st_size - sizeof(uint64_t)*2) & ((sb.st_size - sizeof(uint64_t)*2)-1) ) {
      fprintf(stderr, "Bloom filter file '%s' is not a valid size.\n", bloomfile);
      return 1;
    }
    bloom_size = sb.st_size;
    fprintf(stderr, "Got size 0x%016zx\n", bloom_size);
    mask = (((sb.st_size - sizeof(uint64_t)*2)<<3ULL)-1);
  fprintf(stderr, "Got mask 0x%016zx\n", mask);
  } else {
    fprintf(stderr, "Failed to stat '%s': %s\n", bloomfile, strerror(errno));
    return 1;
  }

  if ((ret = mmapf(&bloom_mmapf, bloomfile, bloom_size, MMAPF_RNDRD)) != MMAPF_OKAY) {
    fprintf(stderr, "failed to open bloom filter '%s': %s\n", bloomfile, mmapf_strerror(ret));
    return 1;
  } else if (bloom_mmapf.mem == NULL) {
    fprintf(stderr, "got NULL pointer trying to set up bloom filter\n");
    return 1;
  }

  bloom = bloom_mmapf.mem;
  memcpy(&hashes, bloom+bloom_size-sizeof(uint64_t)*2, sizeof(uint64_t));
  fprintf(stderr, "Got hashes: %zu\n", hashes);

  while (getline(&line, &line_sz, ifile) > 0) {
    unhex(line, strlen(line), hash.uc, sizeof(hash.uc)); 
    if (bloom_h160_chk(bloom, hash.ul, hashes, mask)) {
      fprintf(ofile, "%s", line);
    }
  }

  return 0;
}

/* vim: set ts=2 sw=2 et ai si: */
