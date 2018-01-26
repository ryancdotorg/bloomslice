#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

// v must be a power of two
uint8_t log2i(uint64_t v) {
    static const uint64_t b[] = {
        0xaaaaaaaaaaaaaaaa,
        0xcccccccccccccccc,
        0xf0f0f0f0f0f0f0f0,
        0xff00ff00ff00ff00,
        0xffff0000ffff0000,
        0xffffffff00000000
    };
    register uint64_t r = (v & b[0]) != 0;
    r |= ((v & b[5]) != 0) << 5;
    r |= ((v & b[4]) != 0) << 4;
    r |= ((v & b[3]) != 0) << 3;
    r |= ((v & b[2]) != 0) << 2;
    r |= ((v & b[1]) != 0) << 1;
    return r;
}

uint32_t k_opt(uint64_t m, uint64_t n) {
    return 0.5 + M_LN2 * (double)m / (double)n;
}

double saturation(uint32_t k, uint64_t m, uint64_t n) {
    return 1 - pow(1 - (1 / (double)m), (double)k * (double)n);
}

double fp_rate(uint32_t k, uint64_t m, uint64_t n) {
    return pow(saturation(k, m, n), (double)k);
}

const double MAX_FP_RATE = 1e-6;
const double MAX_SATURATION = 0.6;

int main() {
    int i;
    unsigned char *h;

    uint8_t log2m;
    uint32_t k, inc;
    uint64_t m, n;
    double fp, st;

    uint8_t max_k_by_log2m[49];
    for (i = 0; i <= 48; ++i) {
        if (i < 9) {
            max_k_by_log2m[i] =  10;
        } else if (i < 17) {
            max_k_by_log2m[i] = 190;
        } else if (i < 33) {
            max_k_by_log2m[i] =  45;
        } else {
            max_k_by_log2m[i] = 120;
        }
    }

    n = 0;
    log2m = 8; m = 1<<log2m;
    k = 1;
    inc = 1;

    st = fp = 0;

    for (;;) {
        if (k <= 10 && log2m <= 16) {
            h = "hash1s";
        } else if (k <= 190 && log2m >  8 && log2m <= 16) {
            h = "hash2b";
        } else if (k <=  45 && log2m > 16 && log2m <= 32) {
            h = "hash2s";
        } else if (k <= 120 && log2m > 32 && log2m <= 48) {
            h = "hash3s";
        } else {
            h = "NOHASH";
        }


        if (n > inc<<26) inc <<= 1;

        while (fp <= MAX_FP_RATE && st <= MAX_SATURATION) {
            n += inc;
            st = saturation(k, m, n);
            fp = pow(st, (double)k);
        }

        while (fp > MAX_FP_RATE || st > MAX_SATURATION) {
            if (k >= max_k_by_log2m[log2m]) {
                m <<= 1; ++log2m;
                k = 0;
            }
            ++k;
            st = saturation(k, m, n);
            fp = pow(st, (double)k);
        }

        if ((n > 9999*1000000ULL) || (log2m > 40)) {
            break;
        } else {
            printf("%10zu   %2u   %s   %3u   %4.1f%%   1 in %.2e\n", n, log2m, h, k, st*100, 1/fp);
        }
    }

    return 0;
}
