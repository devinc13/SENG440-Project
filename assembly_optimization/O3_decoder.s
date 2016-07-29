	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
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
	mov	r1, #0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r7, .L13
	ldr	r6, .L13+4
	mov	r5, r0
	mov	r4, r1
	b	.L7
.L4:
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #49
	subeq	r4, r4, #1
	add	r4, r4, #2
	bl	putchar
	cmp	r4, r6
	mov	r1, #0
	bgt	.L12
.L7:
	mov	r3, r5
	ldrb	r2, [r3, r4]!	@ zero_extendqisi2
	sub	r2, r2, #48
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmn	r2, #38
	sub	r3, r3, #48
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	cmn	r3, #38
	moveq	r3, #0
	add	r3, r3, r2, asl #1
	add	r3, r3, r1, asl #2
	ldrb	r0, [r7, r3, asl #1]	@ zero_extendqisi2
	ldreq	r4, .L13+8
	cmp	r0, #43
	add	r3, r7, r3, asl #1
	bne	.L4
	ldrb	r1, [r3, #1]	@ zero_extendqisi2
	add	r4, r4, #2
	cmp	r4, r6
	sub	r1, r1, #48
	ble	.L7
.L12:
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	29167
	.word	29168
	.size	decode, .-decode
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 29176
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L18
	sub	sp, sp, #28928
	sub	sp, sp, #248
	ldr	r3, [r6, #0]
	add	r2, sp, #32768
	ldr	r1, .L18+4
	ldr	r0, .L18+8
	str	r3, [r2, #-3596]
	bl	fopen
	ldr	r1, .L18+12
	mov	r2, r0
	add	r0, sp, #4
	bl	fgets
	bl	clock
	mov	r4, r0
	add	r0, sp, #4
	bl	decode
	bl	clock
	rsb	r0, r4, r0
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L18+16
	mov	r4, r0
	mov	r5, r1
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, #1
	ldr	r1, .L18+20
	bl	__printf_chk
	mov	r2, r4
	mov	r3, r5
	mov	r0, #1
	ldr	r1, .L18+24
	bl	__printf_chk
	add	r3, sp, #32768
	ldr	r2, [r3, #-3596]
	ldr	r3, [r6, #0]
	cmp	r2, r3
	bne	.L17
	add	sp, sp, #504
	add	sp, sp, #28672
	ldmfd	sp!, {r4, r5, r6, pc}
.L17:
	bl	__stack_chk_fail
.L19:
	.align	2
.L18:
	.word	__stack_chk_guard
	.word	.LC1
	.word	.LC0
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
