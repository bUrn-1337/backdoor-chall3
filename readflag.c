#include <stdio.h>
#include <stdlib.h>

int main(void) {
    FILE *file;
    int ch;

    file = fopen("C:\\flag.txt", "r");
    if (file == NULL) {
        perror("Unable to open C:\\flag.txt");
        return 1;
    }

    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    fclose(file);
    return 0;
}
