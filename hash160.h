#pragma once
#define RIPEMD160_DIGEST_LENGTH 20

typedef union hash160_u {
  unsigned char uc[RIPEMD160_DIGEST_LENGTH];
  uint32_t      ul[RIPEMD160_DIGEST_LENGTH>>2];
} hash160_t;
