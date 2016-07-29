SENG 440 Project - Devin Corrigall and Luke Mclaren

The root of the project contains our testbench data (dataset_full.dat), and the encoded versin of the testbench data (encodeddataset_full.dat). It also includes our encoder and decoder C code files, and two versions of our timescript to run either executable or assembly outputs 1000 times and calculate the average runtime.

To compile and run the encoder or decoder (testbench file names are hardcoded into C files):

arm-linux-gnueabi-gcc -static -march=armv5 decoder.c -o decoder.exe
qemu-arm decoder.exe

Optionally you can pipe the output into a file:
qemu-arm decoder.exe > output.dat

The output from running the decoder.c file should match the dataset_full.dat (other than our timing output that is added to the end).



To get the time 