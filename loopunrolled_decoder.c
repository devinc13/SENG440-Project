#include <stdio.h>
#include <time.h>

#define MAXLEN 1024
#define EOF_VALUE -49
#define NEW_LINE_VALUE -38

#define ASCII_OFFSET 48

void decode(char decode_line[MAXLEN]);

// array of Look-up tables ordered from 0-4
char LUT_DIRECTORY[5][4][2] = {
	{
		"c2",
		"+1",
		"b2",
		"+2"
	},{
		"a1",
		"a1",
		"e2",
		"+3"
	},{
		"d1",
		"d1",
		"f2",
		"g2"
	},{
		"h1",
		"h1",
		"i2",
		"+4"
	},{
		"j1",
		"j1",
		"k2",
		"l2"
	}
};

int main(void) {
	//Open dataset file
	FILE *fp = fopen("./encodeddataset_full.dat","r");
	
	//Line which stores the encoded string
	char decode_line[MAXLEN];
	
	//Read in line of MAXLEN
	fgets(decode_line, MAXLEN, (FILE*)fp);

	// function call to encode
	decode(decode_line);
}

void decode(char decode_line[MAXLEN]){
	clock_t begin = clock();

	// Symbols
	int first_symbol_to_decode;
	int second_symbol_to_decode;
	int third_symbol_to_decode;
	int fourth_symbol_to_decode;
	
	// iterator
	int i;
	
	// Look-up table id & eof flag
	int lut_id = 0;

	// iterate over the string to decode
	for(i=0; i<MAXLEN; i += 4){
		// Decoded symbol
		char *lut_result;
		int lut_index;

		// Get first and second character
		first_symbol_to_decode = decode_line[i] - ASCII_OFFSET;
		second_symbol_to_decode = decode_line[i+1] - ASCII_OFFSET;
		

		// No more charactes to decode
		if(first_symbol_to_decode == NEW_LINE_VALUE || first_symbol_to_decode == EOF_VALUE){
			break;
		}

		// At the end of file, second symbol is functionally a 0
		if(second_symbol_to_decode == NEW_LINE_VALUE || second_symbol_to_decode == EOF_VALUE){
			second_symbol_to_decode = 0;
			// Set i to end for loop
			i = MAXLEN;
		}

		// Set index for look-up table
		lut_index = (first_symbol_to_decode << 1) + (second_symbol_to_decode);

		// depending on the look-up table
		lut_result = LUT_DIRECTORY[lut_id][lut_index];

		if(lut_result[0] == '+') {
			// Continue to next table, which is given in the second character of the result
			lut_id = lut_result[1] - 48;
		} else {
			// Reset the table id
			lut_id = 0;

			// check if we are adding one or two to the length, which is the second character
			// only add one to the length, back up one character so we don't skip one
			if(lut_result[1] == '1')
				i -= 1;
			
			//Print out table result
			printf("%c", lut_result[0]);
		}

		if(i != MAXLEN){
			// Get first and second character
			third_symbol_to_decode = decode_line[i+2] - ASCII_OFFSET;
			fourth_symbol_to_decode = decode_line[i+3] - ASCII_OFFSET;
			
			// No more charactes to decode
			if(third_symbol_to_decode == NEW_LINE_VALUE || third_symbol_to_decode == EOF_VALUE){
				break;
			}
	
			// At the end of file, second symbol is functionally a 0
			if(fourth_symbol_to_decode == NEW_LINE_VALUE || fourth_symbol_to_decode == EOF_VALUE){
				second_symbol_to_decode = 0;
				// Set i to end for loop
				i = MAXLEN;
			}

			// Set index for look-up table
			lut_index = (third_symbol_to_decode << 1) + (fourth_symbol_to_decode);

			// depending on the look-up table
			lut_result = LUT_DIRECTORY[lut_id][lut_index];

			if(lut_result[0] == '+') {
				// Continue to next table, which is given in the second character of the result
				lut_id = lut_result[1] - 48;
			} else {
				// Reset the table id
				lut_id = 0;

				// check if we are adding one or two to the length, which is the second character
				// only add one to the length, back up one character so we don't skip one
				if(lut_result[1] == '1')
					i -= 1;
				
				//Print out table result
				printf("%c", lut_result[0]);
			}
		}
	}

	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("\n\nSystem execution time %f\n", time_spent);
	printf("System execution cycles %f\n", (double)(end - begin));
}
