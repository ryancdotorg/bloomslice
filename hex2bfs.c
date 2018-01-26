/* Copyright (c) 2017 Ryan Castellucci, All Rights Reserved */
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include <fcntl.h>

#include <sys/stat.h>
#include <sys/types.h>

#include <arpa/inet.h> /*  for ntohl/htonl */

#include <math.h> /* pow/exp */

#include "hex.h"
#include "hash160.h"
#include "bloomslice.h"

int main(int argc, char **argv) {
  hash160_t hash;
  int i;
  double pct;
  struct stat sb;
  unsigned char *bloom, *hashfile, *bloomfile;
  FILE *f, *b;
  size_t line_sz = 1024, line_ct = 0;
  char *line;

  uint64_t bloom_size;
  uint64_t mask;
  uint64_t hashes;
  uint8_t h;

  int32_t width;

  double k_hashes, m_bits, err_rate;

  if (argc != 5) {
    fprintf(stderr, "[!] Usage: %s width hashes hashfile.hex bloomfile.bfs\n", argv[0]);
    exit(1);
  }

  width = atoi(argv[1]);
  if (width > 48 || width < 8) {
    fprintf(stderr, "[!] Valid width range is 8 to 48 bits.\n");
    exit(1);
  }

  hashes = atoi(argv[2]);
  if (hashes > 99 || hashes < 1) {
    fprintf(stderr, "[!] Valid hashes range is 1 to 99.\n");
    exit(1);
  }

  hashfile = argv[3];

  bloomfile = argv[4];

  mask = (1ULL<<width) - 1;

  if ((h = pickhash_wk(width, hashes)) == 255) {
    fprintf(stderr, "[!] No hash available for given parameters!\n");
    exit(1);
  }

  fprintf(stderr, "[*] Selected hash %s (0x%02x) with mask 0x%zx\n", deschash(h), h, mask);

  // Layout: [bloom bits][addresses][hash]
  bloom_size = ((1ULL<<width)>>3) + sizeof(uint64_t) + sizeof(uint8_t);

  fprintf(stderr, "[*] Will malloc %zu bytes\n", bloom_size);

  m_bits = (uint64_t)(1ULL<<((int64_t)width));
  k_hashes = hashes;

  if ((f = fopen(hashfile, "r")) == NULL) {
    fprintf(stderr, "[!] Failed to open hash160 file '%s'\n", hashfile);
    exit(1);
  }

  if ((bloom = malloc(bloom_size)) == NULL) {
    fprintf(stderr, "[!] malloc failed (bloom filter)\n");
    exit(1);
  }

  if (stat(bloomfile, &sb) == 0) {
    fprintf(stderr, "[!] Bloom filter file '%s' already exists\n", bloomfile);
    exit(1);
  } else {
    /*  Assume the file didn't exist - yes there is a race condition */
    if ((b = fopen(bloomfile, "w+")) == NULL) {
      fprintf(stderr, "[!] Failed to create bloom filter file '%s'\n", bloomfile);
      exit(1);
    }
    // start it empty
    fprintf(stderr, "[*] Zeroing memory...\n");
    memset(bloom, 0, bloom_size);
  }

  if ((line = malloc(line_sz+1)) == NULL) {
    fprintf(stderr, "[!] malloc failed (line buffer)\n");
    exit(1);
  }
  
  i = 0;
  stat(hashfile, &sb);
  fprintf(stderr, "[*] Loading hash160s from '%s'   0.0%%", hashfile);
  while (getline(&line, &line_sz, f) > 0) {
    ++line_ct;
    unhex(line, strlen(line), hash.uc, sizeof(hash.uc));
    bloom_h160_set(bloom, hash.ul, h, mask);

    if ((++i & 0x3ffff) == 0) {
      pct = 100.0 * ftell(f) / sb.st_size;
      fprintf(stderr, "\033[7D %5.1f%%", pct);
      fflush(stderr);
    }
  }
  fprintf(stderr, "\033[7D 100.0%%\n");

  err_rate = pow(1 - exp(-k_hashes * line_ct / m_bits), k_hashes);
  fprintf(stderr, "[*] Loaded %zu hashes, false positive rate: ~%.3e (1 in ~%.3e)\n", line_ct, err_rate, 1/err_rate);

  bloom_set_hash(bloom, bloom_size, h);
  bloom_set_items(bloom, bloom_size, line_ct);

  fprintf(stderr, "[*] Writing bloom filter to '%s'...\n", bloomfile);
  if ((fwrite(bloom, bloom_size, 1, b)) != 1) {
    fprintf(stderr, "[!] Failed to write bloom filter file '%s'\n", bloomfile);
    exit(1);
  }
  
  fprintf(stderr, "[+] Success!\n");
  return 0;
}

/*  vim: set ts=2 sw=2 et ai si: */
