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
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
.LC2:
	.ascii	"\012\012System execution time %f\012\000"
	.align	2
.LC3:
	.ascii	"System execution cycles %f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 29200
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #29184
	sub	sp, sp, #16
	ldr	r3, .L3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r4, .L3+4
	ldr	r0, .L3+8
	ldr	r1, .L3+12
	bl	fopen
	sub	r1, fp, #12
	str	r0, [r1, r4]
	sub	r3, fp, #28928
	sub	r3, r3, #12
	sub	r3, r3, #244
	ldr	r2, .L3+4
	mov	r0, r3
	ldr	r1, .L3+16
	sub	r3, fp, #12
	ldr	r2, [r3, r2]
	bl	fgets
	ldr	r4, .L3+20
	bl	clock
	sub	r1, fp, #12
	str	r0, [r1, r4]
	sub	r3, fp, #28928
	sub	r3, r3, #12
	sub	r3, r3, #244
	mov	r0, r3
	bl	decode
	ldr	r4, .L3+24
	bl	clock
	sub	r2, fp, #12
	str	r0, [r2, r4]
	ldr	r2, .L3+24
	ldr	r3, .L3+20
	sub	r1, fp, #12
	ldr	r2, [r1, r2]
	sub	r1, fp, #12
	ldr	r3, [r1, r3]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	ldr	r2, .L3+28
	sub	r1, fp, #12
	add	r5, r1, r2
	mov	r0, r3
	mov	r1, r4
	mov	r2, #0
	ldr	r3, .L3+32
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	stmia	r5, {r3-r4}
	ldr	r3, .L3+28
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r0, .L3+36
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r2, .L3+24
	ldr	r3, .L3+20
	sub	r1, fp, #12
	ldr	r2, [r1, r2]
	sub	r1, fp, #12
	ldr	r3, [r1, r3]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L3+40
	mov	r2, r3
	mov	r3, r4
	bl	printf
	mov	r0, r3
	ldr	r3, .L3
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L2
	bl	__stack_chk_fail
.L2:
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L4:
	.align	2
.L3:
	.word	__stack_chk_guard
	.word	-29196
	.word	.LC0
	.word	.LC1
	.word	29168
	.word	-29192
	.word	-29188
	.word	-29184
	.word	1093567616
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	str	r3, [fp, #-24]
	b	.L6
.L13:
	ldr	r3, [fp, #-24]
	ldr	r4, [fp, #-32]
	add	r3, r4, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmn	r3, #38
	beq	.L5
	cmn	r3, #49
	beq	.L5
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	add	r3, r4, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-28]
	cmn	r3, #38
	beq	.L8
	cmn	r3, #49
	bne	.L9
.L8:
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, .L14
	str	r3, [fp, #-24]
.L9:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-28]
	add	r4, r2, r3
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	add	r3, r2, r4
	mov	r2, r3, asl #1
	ldr	r3, .L14+4
	add	r3, r2, r3
	str	r3, [fp, #-8]
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
	ldr	r3, .L14+8
	cmp	r2, r3
	ble	.L13
.L5:
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp, pc}
.L15:
	.align	2
.L14:
	.word	29168
	.word	LUT_DIRECTORY
	.word	29167
	.size	decode, .-decode
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
