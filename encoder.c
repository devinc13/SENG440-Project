#include <stdio.h>

char *HE_LUT[12] = {
	"0",
	"10",
	"110",
	"1110",
	"11110",
	"111110",
	"1111110",
	"11111110",
	"111111110",
	"1111111110",
	"11111111110",
	"11111111111"
};

int main(void) {
	int symbol_to_encode;

	FILE *fp = fopen("./dataset.dat","r");

	while(1){
		symbol_to_encode = fgetc(fp);
		if((feof(fp)) || (symbol_to_encode <= 0x60) || (symbol_to_encode >= 0x6D)){
			break;
		}

		printf("%s", HE_LUT[symbol_to_encode - 97]);
	}
	printf("\n");
}
