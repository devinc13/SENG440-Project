#include <stdio.h>

char *HD_LUT0[4] = {
	"c2",
	"+1",
	"b2",
	"+2"
};

char *HD_LUT1[4] = {
	"a1",
	"a1",
	"e2",
	"+3"
};

char *HD_LUT2[4] = {
	"d1",
	"d1",
	"f2",
	"g2"
};

char *HD_LUT3[4] = {
	"h1",
	"h1",
	"i2",
	"+4"
};

char *HD_LUT4[4] = {
	"j1",
	"j1",
	"k2",
	"l2"
};

char *getLutResult(int lut_number, int first_symbol, int second_symbol) {

}


int main(void) {
	int first_symbol_to_decode;
	int second_symbol_to_decode;
	int lut_number = 0;
	int end_of_file_flag = 0; 

	FILE *fp = fopen("./encodeddataset.dat","r");
	while(1) {
		first_symbol_to_decode = fgetc(fp) - 48;
		if(first_symbol_to_decode == 0 || first_symbol_to_decode == 1) {
			// get second character
			second_symbol_to_decode = fgetc(fp) - 48;

			if(second_symbol_to_decode != 0 && second_symbol_to_decode != 1) {
				// if second symbol doesn't exist, we're at the end of the file, so
				// it doesn't matter what it is, since we'll 
				// have a result based on the first symbol
				second_symbol_to_decode = 0;
				end_of_file_flag = 1;
			}

			char *lut_result;

			int lut_value = 0;
			if (first_symbol_to_decode == 0 && second_symbol_to_decode == 1) {
				lut_value = 1;
			} else if (first_symbol_to_decode == 1 && second_symbol_to_decode == 0) {
				lut_value = 2;
			} else if (first_symbol_to_decode == 1 && second_symbol_to_decode == 1) {
				lut_value = 3;
			}

			switch(lut_number) {
				case 0:
					lut_result = HD_LUT0[lut_value];
					break;
				case 1:
					lut_result = HD_LUT1[lut_value];
					break;
				case 2:
					lut_result = HD_LUT2[lut_value];
					break;
				case 3:
					lut_result = HD_LUT3[lut_value];
					break;
				case 4:
					lut_result = HD_LUT4[lut_value];
					break;
				default:
					// something went wrong
					printf("ERROR\n");
					return 1;
			}

			if (lut_result[0] == '+') {
				// continue to next table, which is given in the second character of the result
				lut_number = lut_result[1] - 48;
			} else {
				lut_number = 0;
				printf("%c", lut_result[0]);

				// check if we are adding one or two to the length, which is the second character
				// in the result. If we're at the end of the file, skip this
				if (lut_result[1] == '1' && end_of_file_flag == 0) {
					// only add one to the length, back up one character so we don't skip one
					fseek(fp, -1, SEEK_CUR);
				}
			}
		} else {
			// we got no characters, end of file
			break;
		}
	}
	printf("\n");
}
