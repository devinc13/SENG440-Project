	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"decoder.c"
	.global	LUT_DIRECTORY
	.data
	.align	2
	.type	LUT_DIRECTORY, %object
	.size	LUT_DIRECTORY, 40
LUT_DIRECTORY:
	.ascii	"c2"
	.ascii	"+1"
	.ascii	"b2"
	.ascii	"+2"
	.ascii	"a1"
	.ascii	"a1"
	.ascii	"e2"
	.ascii	"+3"
	.ascii	"d1"
	.ascii	"d1"
	.ascii	"f2"
	.ascii	"g2"
	.ascii	"h1"
	.ascii	"h1"
	.ascii	"i2"
	.ascii	"+4"
	.ascii	"j1"
	.ascii	"j1"
	.ascii	"k2"
	.ascii	"l2"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"./encodeddataset_full.dat\000"
	.align	2
.LC1:
	.ascii	"r\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1032
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1024
	sub	sp, sp, #8
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, .L3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	ldr	r0, .L3+4
	ldr	r1, .L3+8
	bl	fopen
	str	r0, [fp, #-1036]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, #1024
	ldr	r2, [fp, #-1036]
	bl	fgets
	sub	r3, fp, #1024
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r0, r3
	bl	decode
	mov	r0, r3
	ldr	r3, .L3
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L2
	bl	__stack_chk_fail
.L2:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L4:
	.align	2
.L3:
	.word	__stack_chk_guard
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L6
.L13:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmn	r3, #38
	beq	.L7
	ldr	r3, [fp, #-16]
	cmn	r3, #49
	beq	.L7
	ldr	r3, [fp, #-28]
	cmn	r3, #38
	beq	.L8
	ldr	r3, [fp, #-28]
	cmn	r3, #49
	bne	.L9
.L8:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1024
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, r3, asl #1
	ldr	r3, .L14
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #43
	bne	.L10
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L11
.L10:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #49
	bne	.L12
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
.L11:
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
.L6:
	ldr	r2, [fp, #-24]
	ldr	r3, .L14+4
	cmp	r2, r3
	ble	.L13
.L7:
	mov	r0, #10
	bl	putchar
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L15:
	.align	2
.L14:
	.word	LUT_DIRECTORY
	.word	1023
	.size	decode, .-decode
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
