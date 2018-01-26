#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "bloomslice.h"

int main() {
    uint8_t *mem = malloc(1<<21);
    uint8_t *h160 = malloc(20);
    //register uint64_t mask asm ("rcx") = 0x00000000000fff;
    uint64_t mask = 0x0000001ffffffff;

    int i;

    for (i = 0; i < 20; ++i) {
        h160[i] = 0x80 + i;
    }

    //if (mask >= 0x100000000) {
    //if (mask <= 0xffffffff) {
    //    return 1;
    //}

    printf("running...\n");
    printf("mem: %p\n", mem);
    printf("h160: %p\n", h160);
    bloom_h160_chk(mem, h160, 4, mask);
    bloom_h160_set(mem, h160, 16, mask);

    return 0;
}
