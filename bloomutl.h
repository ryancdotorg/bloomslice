#pragma once
#define BFS_TYPE_LEGACY 0
#define BFS_TYPE_SINGLE 1
// Should be equal to the last static type
#define BFS_TYPE_OFFSET 1

char * bloom_deschash(uint8_t);

uint64_t bloom_width_to_size(uint8_t);
uint64_t bloom_width_to_mask(uint8_t);
uint64_t bloom_size_to_mask(size_t);

int bloom_chk_size(size_t);

double bloom_saturation(uint32_t, uint64_t, uint64_t);

uint8_t bloom_get_hash(unsigned char *, size_t);
void    bloom_set_hash(unsigned char *, size_t, uint8_t);

uint64_t bloom_get_items(unsigned char *, size_t);
void     bloom_set_items(unsigned char *, size_t, uint64_t);

uint8_t bloom_pick_hash_wk(uint8_t, uint8_t);
uint8_t bloom_pick_hash_wi(uint8_t, uint64_t, uint8_t *);
uint8_t bloom_pick_hash_es(double, double, uint64_t, uint8_t *, uint8_t *);

int32_t bloom_h160_set(uint8_t *mem, const void *h160, uint8_t n, uint64_t mask);

int32_t bloom_h160_chk(const uint8_t *mem, const void *h160, uint8_t n, uint64_t mask);
