#include <stdio.h>

#define MAXLEN 1024

void encode(char* encode_string);

char *HE_LUT[12] = {
	"010",
	"10",
	"00",
	"110",
	"0110",
	"1110",
	"1111",
	"01110",
	"011110",
	"0111110",
	"01111110",
	"01111111"
};

int main(void) {
	//Open dataset file
	FILE *fp = fopen("./dataset.dat","r");
	
	//Line which stores the encoded string
	char encode_line[MAXLEN];
	
	//Read in line of MAXLEN
	fgets(encode_line, MAXLEN, (FILE*)fp);

	// function call to encode
	encode(encode_line);
}

void encode(char encode_line[MAXLEN]){
	int 	i, symbol_to_encode;
	char*	encoded_symbol;

	for (i = 0; i < MAXLEN; i++){

		// Get symbol from encoded line
		symbol_to_encode = encode_line[i]; 

		// Check if symbol is out of range, break if so
		if((symbol_to_encode <= 0x60) || (symbol_to_encode >= 0x6D)){
			break;
		}

		// Print out encoded symbol
		encoded_symbol = HE_LUT[symbol_to_encode - 97];
		printf("%s\n", encoded_symbol);
	}
}
