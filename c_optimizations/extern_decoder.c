#include <stdio.h>
#include <time.h>

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

void decode(char decode_line[29168]){

	// Symbols
	int first_symbol_to_decode;
	int second_symbol_to_decode;

	// iterator
	int i;
	
	// Look-up table id & eof flag
	int lut_id = 0;

	// iterate over the string to decode
	for(i=0; i<29168; i += 2){
		// Decoded symbol
		char *lut_result;
		int lut_index;

		// Get first and second character
		first_symbol_to_decode = decode_line[i] - 48;
		second_symbol_to_decode = decode_line[i+1] - 48;

		// No more charactes to decode
		if(first_symbol_to_decode == -38 || first_symbol_to_decode == -49){
			break;
		}

		// At the end of file, second symbol is functionally a 0
		if(second_symbol_to_decode == -38 || second_symbol_to_decode == -49){
			second_symbol_to_decode = 0;
			// Set i to end for loop
			i = 29168;
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
	}

}

int main(void) {
	//Open dataset file
	FILE *fp = fopen("./encodeddataset_full.dat","r");
	
	//Line which stores the encoded string
	char decode_line[29168];
	
	//Read in line of 29168
	fgets(decode_line, 29168, (FILE*)fp);

	clock_t begin = clock();

	// function call to encode
	decode(decode_line);

	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("\n\nSystem execution time %f\n", time_spent);
	printf("System execution cycles %f\n", (double)(end - begin));
}
