SENG 440 Project - Devin Corrigall and Luke Mclaren

The root of the project contains our testbench data (dataset_full.dat), and the encoded versin of the testbench data (encodeddataset_full.dat). It also includes our encoder and decoder C code files, and two versions of our timescript to run either executable or assembly outputs 1000 times and calculate the average runtime.

To compile and run the encoder or decoder (testbench file names are hardcoded into C files) run:
	arm-linux-gnueabi-gcc -static -march=armv5 decoder.c -o decoder.exe
	qemu-arm decoder.exe

The output from running the decoder.exe file should match the dataset_full.dat (other than our timing output that is added to the end). To get the average time and cycles elapsed over 1000 runs of decoder.exe, after compiling, simply run (and wait for the executions to finish):
	python timescript.py


The 5 files in the c_optimizations are the changes we made to implement or attempt to implement various optimizations to the c code. These can be run by running a similar command to the decoder C file (other than dec_decoder, which wasn't possible to finish implementing):
	arm-linux-gnueabi-gcc -static -march=armv5 ./c_optimizations/loopunrolled_decoder.c -o decoder.exe
	qemu-arm decoder.exe


The assembly files in the assembly_optimization folder can be compiled and run with the following commands:
	arm-linux-gnueabi-gcc -static -march=armv5 -g ./assembly_optimization/O1_decoder_manually_optimized.s
	qemu-arm -L /usr/arm-linux-gnueabi/ ./a.out


Finally, to get the average time and cycles elapsed over 1000 runs of the assembly files, after compiling, simply run (and wait for the executions to finish):
	python timescript_assembly.py
