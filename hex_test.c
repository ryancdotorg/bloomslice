#include <stdio.h>
#include <string.h>

#include "hex.h"

int main(int argc, char **argv) {
    int i;

    unsigned char c;

    unsigned char buf0[256];
    unsigned char buf1[256];
    memset(buf0, 0xaa, 256);
    memset(buf1, 0xbb, 256);

    printf("%s\n", argv[1]);
    unhex(argv[1], 40, buf0, 256);
    hex(buf0, 20, buf1, 256);
    printf("%s\n", buf1);

    return 0;
}
