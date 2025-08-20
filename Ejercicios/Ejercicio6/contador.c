#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int is_ascii_letter(unsigned char c) {
    return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

int main(int argc, char **argv) {
    const char *fname = (argc > 1) ? argv[1] : NULL;
    FILE *f = fname ? fopen(fname, "rb") : stdin;
    if (!f) {
        perror("fopen");
        return 1;
    }

    const size_t BUFSZ = 1 << 16; /* 64 KiB */
    unsigned char *buf = (unsigned char*)malloc(BUFSZ);
    if (!buf) {
        fprintf(stderr, "malloc failed\n");
        if (f != stdin) fclose(f);
        return 2;
    }

    long lines = 0;
    long words = 0;
    long chars = 0;      /* total bytes */
    int in_word = 0;     /* dentro de una secuencia [A-Za-z]+ */

    size_t r;
    while ((r = fread(buf, 1, BUFSZ, f)) > 0) {
        chars += (long)r; /* cada byte cuenta como char (como en el .l) */
        for (size_t i = 0; i < r; ++i) {
            unsigned char c = buf[i];
            if (c == '\n') {
                lines++;
            }
            if (is_ascii_letter(c)) {
                if (!in_word) {
                    words++;
                    in_word = 1;
                }
            } else {
                in_word = 0;
            }
        }
    }

    if (f != stdin) fclose(f);
    free(buf);

    /* mismo formato que el flex original */
    printf("%8ld%8ld%8ld\n", lines, words, chars);
    return 0;
}
