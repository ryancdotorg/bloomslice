/* Copyright (c) 2017 Ryan Castellucci, All Rights Reserved */

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#include "extern.h"
#include "hash160.h"
#include "bloomslice.h"

#define FOOTER_BYTES (sizeof(uint64_t) + sizeof(uint8_t))
#define LEGACY_BYTES 536870912
#define SINGLE_BYTES (sizeof(hash160_t) + FOOTER_BYTES)

double bloom_saturation(uint32_t k, uint64_t m, uint64_t n) {
  return 1 - pow(1 - (1 / (double)m), (double)k * (double)n);
}

//char * deschash(uint8_t h) { return (&hashD)+h*8; }
char * deschash(uint8_t h) { return hashD[h]; }
void * jumphash(uint8_t h) { return (void *)(hashJ[h]); }

size_t bloom_width_to_size(uint8_t width) {
  if (width == BFS_TYPE_LEGACY) {
    return LEGACY_BYTES;
  } else if (width == BFS_TYPE_SINGLE) {
    return SINGLE_BYTES;
  } else if (width < 8 || width > 48) {
    return 0;
  } else {
    return ((1ULL<<width)>>3) + FOOTER_BYTES;
  }
}

uint64_t bloom_width_to_mask(uint8_t width) {
  if (width == BFS_TYPE_LEGACY) {
      return 1;
  } else if (width == BFS_TYPE_SINGLE) {
      return 1;
  } else if (width < 8 || width > 48) {
      return 0;
  } else {
      return (1ULL<<width) - 1;
  }
}

uint64_t bloom_size_to_mask(size_t sz) {
  size_t bz = sz - FOOTER_BYTES;
  if (sz == LEGACY_BYTES) {
    return 1;
  } else if (sz == SINGLE_BYTES) {
    return 1;
  } else if (bz & (bz - 1)) {
    return 0;
  } else {
    return (bz<<3) - 1;
  }  
}

int bloom_chk_size(size_t sz) {
  size_t bz = sz - FOOTER_BYTES;
  if (sz == LEGACY_BYTES) {
    return 2;
  } else if (sz == SINGLE_BYTES) {
    return 3;
  } else if (bz & (bz - 1)) {
    return 0;
  } else {
    return 1;
  }
}

uint8_t bloom_get_hash(unsigned char *bloom, size_t sz) {
  uint8_t ret;
  if (sz == 1<<29) return 0;
  memcpy(&ret, (bloom+sz)-(sizeof(uint8_t)), sizeof(uint8_t));
  return ret;
}

void bloom_set_hash(unsigned char *bloom, size_t sz, uint8_t h) {
  memcpy((bloom+sz)-(sizeof(uint8_t)), &h, sizeof(uint8_t));
}

uint64_t bloom_get_items(unsigned char *bloom, size_t sz) {
  uint64_t ret;
  if (sz == 1<<29) return 0;
  memcpy(&ret, (bloom+sz)-FOOTER_BYTES, sizeof(uint64_t));
  return ret;
}

void bloom_set_items(unsigned char *bloom, size_t sz, uint64_t n) {
  memcpy((bloom+sz)-FOOTER_BYTES, &n, sizeof(uint64_t));
}

uint8_t pickhash_wk(uint8_t width, uint8_t hashes) {
  if (hashes < 1 || width < 8 || width > 48) { // invalid parameters
    return 255;
  } else if (hashes <= hash1sN && width >= 8 && width <= 16) { // hash1s
    return BFS_TYPE_OFFSET + hashes;
  } else if (hashes <= hash2bN && width >  8 && width <= 16) { // hash2b
    return BFS_TYPE_OFFSET + hash1sN + hashes;
  } else if (hashes <= hash2sN && width > 16 && width <= 32) { // hash2s
    return BFS_TYPE_OFFSET + hash1sN + hash2bN + hashes;
  } else if (hashes <= hash3sN && width > 32 && width <= 48) { // hash3s
    return BFS_TYPE_OFFSET + hash1sN + hash2bN + hash2sN + hashes;
  } else { // no suitable hash found
    return 255;
  }
}

uint8_t pickhash_wi(uint8_t width, uint64_t items, uint8_t *k) {
  double bits = 1ULL<<width;
  unsigned int opt = round((log(2.0) * bits) / (double)items);
  uint8_t kOpt = opt < 256 ? (opt > 0 ? opt : 1) : 255;

  if (width < 8 || width > 48) { // invalid parameters
    return 255;
  } else if (kOpt <= hash1sN && width >= 8 && width <= 16) { // hash1s
    *k = kOpt;
    return pickhash_wk(width, kOpt);
  } else if (width == 8) {
    *k = hash1sN;
    return pickhash_wk(width, hash1sN);
  } else if (kOpt <= hash2bN && width >  8 && width <= 16) { // hash2b
    *k = kOpt;
    return pickhash_wk(width, kOpt);
  } else if (width <= 16) {
    *k = hash2bN;
    return pickhash_wk(width, hash2bN);
  } else if (kOpt <= hash2sN && width > 16 && width <= 32) { // hash2s
    *k = kOpt;
    return pickhash_wk(width, kOpt);
  } else if (width <= 32) {
    *k = hash2sN;
    return pickhash_wk(width, hash2sN);
  } else if (kOpt <= hash3sN && width > 32 && width <= 48) { // hash3s
    *k = kOpt;
    return pickhash_wk(width, kOpt);
  } else if (width <= 48) {
    *k = hash3sN;
    return pickhash_wk(width, hash3sN);
  } else { // no suitable hash found
    return 255;
  }
}

uint8_t pickhash_es(double max_error, double max_bloom_saturation, uint64_t n, uint8_t *max_w, uint8_t *new_k) {
  if (max_error < 0 || max_bloom_saturation < 0) return 255;

  int i;

  uint8_t w, k;
  uint64_t m;

  double e, s;

  uint8_t max_k_by_w[49];
  for (i = 0; i <= 48; ++i) {
    if (i < 9) {
      max_k_by_w[i] = hash1sN;
    } else if (i < 17) {
      max_k_by_w[i] = hash2bN;
    } else if (i < 33) {
      max_k_by_w[i] = hash2sN;
    } else {
      max_k_by_w[i] = hash3sN;
    }
  }

  w = 8; m = 1<<w; k = 1;

  s = bloom_saturation(k, m, n);
  e = pow(s, k);

  while (e > max_error || s > max_bloom_saturation) {
    if (k >= max_k_by_w[w]) {
      m <<= 1; ++w; k = 0;
      if (w > *max_w) return 255;
    }
    ++k;
    s = bloom_saturation(k, m, n);
    e = pow(s, (double)k);
  }

  *max_w = w;

  if (new_k) *new_k = k;

  return pickhash_wk(w, k);
}

/*  vim: set ts=2 sw=2 et ai si: */
