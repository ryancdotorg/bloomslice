#pragma once
static const unsigned char unhexH[256] = {
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0, 16, 32, 48, 64, 80, 96,112,128,144,  0,  0,  0,  0,  0,  0,
  0,160,176,192,208,224,240,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,160,176,192,208,224,240,  0,  0,  0,  0,  0,  0,  0,  0,  0
}; // the compiler should zero-fill the other 144 bytes

static const unsigned char unhexL[256] = {
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  0,  0,  0,  0,  0,  0,
  0, 10, 11, 12, 13, 14, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0, 10, 11, 12, 13, 14, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0
}; // the compiler should zero-fill the other 144 bytes

static inline unsigned char *
unhex(unsigned char *str, size_t str_sz,
        unsigned char *unhexed, size_t unhexed_sz) {
  size_t i;
  str_sz /= 2;
  if (unhexed_sz < str_sz) str_sz = unhexed_sz;
  for (i = 0; i < str_sz; ++i) unhexed[i] = unhexH[str[i*2]] | unhexL[str[i*2+1]];
  return unhexed;
}

unsigned char * hex(unsigned char *, size_t, unsigned char *, size_t);
