	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"decoder.c"
	.text
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r6, r0
	ldrb	r2, [r0, #0]	@ zero_extendqisi2
	sub	r2, r2, #48
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmn	r2, #49
	cmnne	r2, #38
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
	mov	r0, #0
	mov	r4, r0
	ldr	r8, .L10
	ldr	r5, .L10+4
	mov	sl, r0
	ldr	r7, .L10+8
	b	.L3
.L8:
	mov	r1, r6
	ldrb	r2, [r1, r4]!	@ zero_extendqisi2
	sub	r2, r2, #48
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmn	r2, #49
	cmnne	r2, #38
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
.L3:
	cmn	r3, #49
	cmnne	r3, #38
	moveq	r4, r8
	moveq	r3, #0
	add	r3, r3, r2, asl #1
	add	r3, r3, r0, asl #2
	add	r2, r5, r3, asl #1
	ldrb	r0, [r5, r3, asl #1]	@ zero_extendqisi2
	cmp	r0, #43
	ldreqb	r0, [r2, #1]	@ zero_extendqisi2
	subeq	r0, r0, #48
	beq	.L6
.L5:
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	cmp	r3, #49
	subeq	r4, r4, #1
	bl	putchar
	mov	r0, sl
.L6:
	add	r4, r4, #2
	cmp	r4, r7
	ble	.L8
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
.L11:
	.align	2
.L10:
	.word	29168
	.word	.LANCHOR0
	.word	29167
	.size	decode, .-decode
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 29176
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #28928
	sub	sp, sp, #248
	ldr	r6, .L14
	ldr	r3, [r6, #0]
	add	r2, sp, #32768
	str	r3, [r2, #-3596]
	ldr	r0, .L14+4
	ldr	r1, .L14+8
	bl	fopen
	mov	r2, r0
	add	r0, sp, #4
	ldr	r1, .L14+12
	bl	fgets
	bl	clock
	mov	r4, r0
	add	r0, sp, #4
	bl	decode
	bl	clock
	rsb	r0, r4, r0
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	mov	r2, #0
	ldr	r3, .L14+16
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, #1
	ldr	r1, .L14+20
	bl	__printf_chk
	mov	r0, #1
	ldr	r1, .L14+24
	mov	r2, r4
	mov	r3, r5
	bl	__printf_chk
	add	r3, sp, #32768
	ldr	r2, [r3, #-3596]
	ldr	r3, [r6, #0]
	cmp	r2, r3
	beq	.L13
	bl	__stack_chk_fail
.L13:
	add	sp, sp, #504
	add	sp, sp, #28672
	ldmfd	sp!, {r4, r5, r6, pc}
.L15:
	.align	2
.L14:
	.word	__stack_chk_guard
	.word	.LC0
	.word	.LC1
	.word	29168
	.word	1093567616
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.global	LUT_DIRECTORY
	.data
	.align	2
.LANCHOR0 = . + 0
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"./encodeddataset_full.dat\000"
	.space	2
.LC1:
	.ascii	"r\000"
	.space	2
.LC2:
	.ascii	"\012\012System execution time %f\012\000"
.LC3:
	.ascii	"System execution cycles %f\012\000"
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
