#include <stdio.h>

char *HE_LUT[12] = {"0", "10", "110", "1110", "11110", "111110", "1111110", "11111110", "111111110", "1111111110", "11111111110", "11111111111"};

int main(void) {
char symbol_to_encode = 0;
    do {
        scanf("%i", &symbol_to_encode);
	printf("%s\n", HE_LUT[symbol_to_encode - 0x40]);
    } while ((symbol_to_encode > 0x40) & (symbol_to_encode < 0x46));
    printf("%s\n", "Not a valid symbol.");
}

