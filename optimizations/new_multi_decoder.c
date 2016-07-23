#include <stdio.h>
#include <time.h>

#define EOF_VALUE -49
#define NEW_LINE_VALUE -38

#define ASCII_OFFSET 48

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
	int first_symbol_to_decode;
	int second_symbol_to_decode;
	int lut_id = 0;
	int end_of_file_flag = 0; 

	FILE *fp = fopen("./encodeddataset_full.dat","r");

	clock_t begin = clock();
	while(1) {
		// get second character
		first_symbol_to_decode = fgetc(fp) - ASCII_OFFSET;
		second_symbol_to_decode = fgetc(fp) - ASCII_OFFSET;

		if(first_symbol_to_decode == NEW_LINE_VALUE || first_symbol_to_decode == EOF_VALUE){
			break;
		}

		if(second_symbol_to_decode == NEW_LINE_VALUE || second_symbol_to_decode == EOF_VALUE){
			second_symbol_to_decode = 0;
			end_of_file_flag = 1;
		}

		char *lut_result;

		int lut_index = (first_symbol_to_decode << 1) + (second_symbol_to_decode);

		// depending on the look-up table
		lut_result = LUT_DIRECTORY[lut_id][lut_index];

		if(lut_result[0] == '+') {
			// continue to next table, which is given in the second character of the result
			lut_id = lut_result[1] - 48;
		} else {
			lut_id = 0;
			printf("%c", lut_result[0]);

			if(end_of_file_flag){
				break;
			} 

			// check if we are adding one or two to the length, which is the second character
			// in the result. If we're at the end of the file, skip this
			if(lut_result[1] == '1') {
				// only add one to the length, back up one character so we don't skip one
				fseek(fp, -1, SEEK_CUR);
			}
		}
	}
	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("\n\nSystem execution time %f\n", time_spent);
	printf("System execution cycles %f\n", (double)(end - begin));
	printf("\n");
}