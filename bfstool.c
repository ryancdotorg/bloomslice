/*  Copyright (c) 2017 Ryan Castellucci, All Rights Reserved */
#define _LARGEFILE_SOURCE
#define _LARGEFILE64_SOURCE

#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <signal.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>

#include <sys/stat.h>
#include <sys/types.h>

#include <arpa/inet.h> /*   for ntohl/htonl */

#include <math.h> /*  pow/exp */

#include "hex.h"
#include "mmapf.h"
#include "hash160.h"
#include "bloomslice.h"

#define bail(code, ...) \
do { \
  fprintf(stderr, __VA_ARGS__); \
  exit(code); \
} while (0)

#define chkmalloc(S) _chkmalloc(S, __FILE__, __LINE__)
static void * _chkmalloc(size_t size, unsigned char *file, unsigned int line) {
  void *ptr = malloc(size);
  if (ptr == NULL) {
    bail(1, "[!] malloc(%zu) failed at %s:%u: %s\n", size, file, line, strerror(errno));
  }
  return ptr; 
}

char hash_file_type(FILE *stream) {
  int u, c = fgetc(stream);
  if (c < 0) return -1;
  u = ungetc(c, stream);
  if (u != c) return -1;
  if (c == '0') {
    return 'H'; // type is hex
  } else if (c == 0) {
    return 'B'; // type is binary
  } else {
    return 0; // cannot determine type
  }
}

/* NOTES
Modes:
  -W - create bloom filter
  -R - check data against bloom filter
  -D - produce bloom filter diff (later)
  -P - patch bloom filter (later)
Options:
  -b: - bloom file
  -x: - hash file
  -d: - diff file (later)
  -f: - filter file
  -i: - input for check mode
  -o: - output for check mode
  -w: - bloom filter width (create mode)
  -k: - bloom filter hashes (create mode)
  -e: - bloom filter error rate (create mode)
  -s: - bloom filter saturation (create mode)
  -H  - force hash/input file to be treated as hex
  -B  - force hash/input file to be treated as binary (raw) 
*/
void usage(unsigned char *name) {
  printf("Usage: %s OPTIONS...\n\n\
\n", name);
  exit(1);
}

int main(int argc, char **argv) {
  hash160_t hash;
  FILE *ifile = stdin, *ofile = stdout;
  FILE *dfile = NULL, *hfile = NULL, *bfile = NULL, *ffile = NULL;

  mmapf_ctx bloom_mmapf;
  struct stat sb;

  // Default constraints on bloom filter parameters:
  // Maximum size: 4GiB
  // Maximum error rate 1 in 10,000,000
  // Maximum saturation: 51%
  // Lower saturation tends to be faster, the point of diminishing
  // returns seems to be somewhere between 0.125 and 0.250
  uint8_t wopt = 35, kopt = 0;
  double eopt = 1e-7, sopt = 0.51; // defaults chosen for size

  unsigned char *bopt = NULL, *xopt = NULL, *fopt = NULL;
  unsigned char *dopt = NULL, *iopt = NULL, *oopt = NULL;

  char mode = 0;
  char hfmt = 0;

  unsigned char *bloom;

  char *line = NULL;
  size_t line_sz = 0;

  unsigned char buf[41];

  double pct, err_rate, sat;
  uint64_t mask = 0, bloom_size = 0, i, items;
  uint8_t h = 254;

  int c, r;

  while ((c = getopt(argc, argv, "BHWRb:x:f:i:o:w:k:e:s:")) != -1) {
    switch (c) {
      case 'W':
      case 'R':
        if (mode) bail(1, "[!] Mode '%c' already selected, can't also specify '%c'\n", mode, c);
        mode = c; break;
      case 'H':
      case 'B':
        if (hfmt) bail(1, "[!] Format '%c' already selected, can't also specify '%c'\n", hfmt, c);
        hfmt = c; break;
      case 'b':
        bopt = optarg; break;
      case 'x':
        xopt = optarg; break;
      case 'f':
        fopt = optarg; break;
      case 'i':
        iopt = optarg; break;
      case 'o':
        oopt = optarg; break;
      case 'w':
        wopt = atoi(optarg); break;
      case 'k':
        kopt = atoi(optarg); break;
      case 'e':
        eopt = atof(optarg); break;
      case 's':
        sopt = atof(optarg); break;
    }
  }

  if (mode == 'W') {
    // #####################
    // ##                 ##
    // ##   CREATE MODE   ##
    // ##                 ##
    // #####################
    if (!(bopt && xopt) || dopt || fopt || iopt || oopt) {
      bail(1, "[!] Invalid combination of file options for create mode\n");
    }

    // manually specified number of hashes
    if (kopt) {
      if ((h = pickhash_wk(wopt, kopt)) == 255) {
        bail(1, "[!] No hash routine found for specified parameters\n");
      }
    }

    // open input hash file
    if ((hfile = fopen(xopt, "r")) == NULL) {
      bail(1, "[!] Failed to open hash file '%s': %s\n", xopt, strerror(errno));
    }
    if ((r = fstat(fileno(hfile), &sb)) != 0) {
      bail(1, "[!] Failed to stat hash file '%s': %s\n", xopt, strerror(errno));
    }
    if ((sb.st_size % 20) && (sb.st_size % 41)) {
      bail(1, "[!] Hash file '%s' is not a valid size\n", xopt);
    }
    if (hfmt == 0) {
      if (!(sb.st_size % 20) != !(sb.st_size % 41)) {
        hfmt = !(sb.st_size % 20) ? 'B' : 'H';
        fprintf(stderr, "[*] Auto-detected hash format %c by size\n", hfmt);
      } else {
        if ((hfmt = hash_file_type(hfile)) < 0) {
          bail(1, "[!] fgetc/ungetc failed on hash file\n");
        }
        if (hfmt == 0) {
          bail(1, "[!] Unable to determine type of hash file, please specify -B or -H\n");
        }
        fprintf(stderr, "[*] Auto-detected hash format %c by content\n", hfmt);
      }
    }

    items = sb.st_size / (hfmt == 'H' ? 41 : 20);

      fprintf(stderr, "derp? h:%u w:%u\n", h, wopt);
    // if a hash routine still hasn't been chosen, pick one now
    if (items == 0) {
      bail(1, "[!] No hashes to load\n");
    } else if (items == 1) {
      bloom_size = bloom_width_to_size(BFS_TYPE_SINGLE);
      h = BFS_TYPE_SINGLE;
    } else if (h >= 254) {
      fprintf(stderr, "derp? h:%u\n", h);
      if ((h = pickhash_es(eopt, sopt, items, &wopt, &kopt)) >= 254) {
        bail(1, "[!] No hash routine found for specified parameters\n");
      }
    }

    if (bloom_size == 0 && (bloom_size = bloom_width_to_size(wopt)) == 0) {
      bail(1, "[!] Failed to compute bloom filter file size (bug?)\n");
    }

    if (stat(bopt, &sb) == 0) {
      bail(1, "[!] Bloom filter file '%s' already exists\n", bopt);
    } else {
      if ((r = open64(bopt, O_RDWR|O_CREAT|O_EXCL, 0644)) < 0) {
        bail(1, "[!] Failed to create bloom filter file '%s': %s\n", bopt, strerror(errno));
      } else if ((bfile = fdopen(r, "w+")) == NULL) {
        bail(1, "[!] Failed fdopen on bloom filter file descriptor\n");
      }
    }

    mask = bloom_width_to_mask(wopt); //(1ULL<<wopt) - 1;
    sat = bloom_saturation(kopt, 1ULL<<wopt, items);
    err_rate = pow(sat, kopt);

    fprintf(stderr, "[*] Selected function %s (0x%02x) with mask 0x%zx\n", deschash(h), h, mask);
    fprintf(stderr, "[*] Have %zu hashes to load into %zu byte filter\n", items, bloom_size);
    if (items > 0) {
      fprintf(stderr, "[*] Saturation: ~%.3f\n", sat);
      fprintf(stderr, "[*] False positive rate: ~%.3e (1 in ~%.3e)\n", err_rate, 1/err_rate);
    }

    bloom = chkmalloc(bloom_size);
    fprintf(stderr, "[*] Zeroing memory...\n");
    memset(bloom, 0, bloom_size);

    fprintf(stderr, "[*] Loading hash160s from '%s'   0.0%%", xopt);
    for (i = 0; i < items; ++i) {
      if (hfmt == 'H') {
        if ((r = fread(buf, 41, 1, hfile)) != 1) {
          bail(1, "[!] Error reading hex hashes\n");
        }
        unhex(buf, 40, hash.uc, sizeof(hash.uc));
      } else { // hfmt == 'B'
        if ((r = fread(hash.uc, 20, 1, hfile)) != 1) {
          bail(1, "[!] Error reading binary hashes\n");
        }
      }

      bloom_h160_set(bloom, hash.uc, h, mask);

      if ((i & 0x7ffff) == 0) {
        pct = 100.0 * i / items;
        fprintf(stderr, "\033[7D %5.1f%%", pct);
        fflush(stderr);
      }
    }

    fprintf(stderr, "\033[7D 100.0%%\n");

    bloom_set_hash(bloom, bloom_size, h);
    bloom_set_items(bloom, bloom_size, items);

    fprintf(stderr, "[*] Writing bloom filter to '%s'...\n", bopt);
    if (fwrite(bloom, bloom_size, 1, bfile) != 1) {
      bail(1, "[!] Failed to write bloom filter file '%s'\n", bopt);
    }
    fprintf(stderr, "[+] Success!\n");

    return 0;
  } else if (mode == 'R') {
    // ####################
    // ##                ##
    // ##   CHECK MODE   ##
    // ##                ##
    // ####################
    if (!bopt) {
      bail(1, "[!] Bloom filter file must be specified with '-b'\n");
    }
    if (dopt || xopt) {
      bail(1, "[!] Invalid combination of file options for check mode\n");
    }

    if (stat(bopt, &sb) == 0) {
      if (!S_ISREG(sb.st_mode)) {
        bail(1, "[!] Bloom filter file '%s' is not a regular file\n", bopt);
      }
      bloom_size = sb.st_size;
      if (!bloom_chk_size(bloom_size)) {
        bail(1, "[!] Bloom filter file '%s' is not a valid size\n", bopt);
      }
    } else {
      bail(1, "[!] Failed to stat '%s': %s\n", bopt, strerror(errno));
    }
    
    if ((r = mmapf(&bloom_mmapf, bopt, bloom_size, MMAPF_RNDRD)) != MMAPF_OKAY) {
      bail(1, "[!] Failed to open bloom filter '%s': %s\n", bopt, mmapf_strerror(r));
    } else if (bloom_mmapf.mem == NULL) {
      bail(1, "[!] Got NULL pointer trying to set up bloom filter\n");
    }

    bloom = bloom_mmapf.mem;
    h = bloom_get_hash(bloom, bloom_size);

    mask = bloom_size_to_mask(sb.st_size); // h == BFS_TYPE_SINGLE ? 0 : ((sb.st_size<<3ULL) & 0xffffffffff00)-1;
    //items = bloom_get_items(bloom, bloom_size);

    fprintf(stderr, "[*] Using function %s (0x%02x) with mask 0x%zx\n", deschash(h), h, mask);

    while ((r = getline(&line, &line_sz, ifile)) > 0) {
      if (r > 40) {
        unhex(line, 40, hash.uc, sizeof(hash.uc));
        if (bloom_h160_chk(bloom, hash.ul, h, mask)) {
          fprintf(ofile, "%s", line);
        }
      }
    }

  } else {
    bail(1, "[!] No valid mode selected\n");
  }
}

/*  vim: set ts=2 sw=2 et ai si: */
