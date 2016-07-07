	.file	"decoder.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"./encodeddataset.dat"
.LC2:
	.string	"ERROR"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	fopen
	movq	%rax, %r12
.L2:
	movq	%r12, %rdi
	call	fgetc
	leal	-48(%rax), %ebx
	movq	%r12, %rdi
	call	fgetc
	cmpl	$-49, %ebx
	leal	-48(%rax), %edx
	je	.L3
	cmpl	$-38, %ebx
	je	.L3
	cmpl	$-49, %edx
	je	.L15
	cmpl	$-38, %edx
	.p2align 4,,2
	jne	.L4
.L15:
	movl	$1, %r13d
	xorl	%edx, %edx
.L4:
	cmpl	$4, %ebp
	leal	(%rdx,%rbx,2), %eax
	ja	.L5
	cltq
	jmp	*.L7(,%rbp,8)
	.section	.rodata
	.align 8
	.align 4
.L7:
	.quad	.L6
	.quad	.L8
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.section	.text.startup
.L10:
	movq	HD_LUT3(,%rax,8), %rbx
.L12:
	movsbl	(%rbx), %edi
	cmpb	$43, %dil
	jne	.L13
	movsbl	1(%rbx), %ebp
	subl	$48, %ebp
	jmp	.L2
.L9:
	movq	HD_LUT2(,%rax,8), %rbx
	jmp	.L12
.L8:
	movq	HD_LUT1(,%rax,8), %rbx
	jmp	.L12
.L6:
	movq	HD_LUT0(,%rax,8), %rbx
	jmp	.L12
.L11:
	movq	HD_LUT4(,%rax,8), %rbx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L13:
	call	putchar
	testl	%r13d, %r13d
	jne	.L3
	xorl	%ebp, %ebp
	cmpb	$49, 1(%rbx)
	jne	.L2
	movl	$1, %edx
	orq	$-1, %rsi
	movq	%r12, %rdi
	call	fseek
	movl	%r13d, %ebp
	jmp	.L2
.L5:
	movl	$.LC2, %edi
	call	puts
	popq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	popq	%rcx
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	movl	$10, %edi
	jmp	putchar
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	HD_LUT4
	.section	.rodata.str1.1
.LC3:
	.string	"j1"
.LC4:
	.string	"k2"
.LC5:
	.string	"l2"
	.data
	.align 32
	.type	HD_LUT4, @object
	.size	HD_LUT4, 32
HD_LUT4:
	.quad	.LC3
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.globl	HD_LUT3
	.section	.rodata.str1.1
.LC6:
	.string	"h1"
.LC7:
	.string	"i2"
.LC8:
	.string	"+4"
	.data
	.align 32
	.type	HD_LUT3, @object
	.size	HD_LUT3, 32
HD_LUT3:
	.quad	.LC6
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.globl	HD_LUT2
	.section	.rodata.str1.1
.LC9:
	.string	"d1"
.LC10:
	.string	"f2"
.LC11:
	.string	"g2"
	.data
	.align 32
	.type	HD_LUT2, @object
	.size	HD_LUT2, 32
HD_LUT2:
	.quad	.LC9
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.globl	HD_LUT1
	.section	.rodata.str1.1
.LC12:
	.string	"a1"
.LC13:
	.string	"e2"
.LC14:
	.string	"+3"
	.data
	.align 32
	.type	HD_LUT1, @object
	.size	HD_LUT1, 32
HD_LUT1:
	.quad	.LC12
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.globl	HD_LUT0
	.section	.rodata.str1.1
.LC15:
	.string	"c2"
.LC16:
	.string	"+1"
.LC17:
	.string	"b2"
.LC18:
	.string	"+2"
	.data
	.align 32
	.type	HD_LUT0, @object
	.size	HD_LUT0, 32
HD_LUT0:
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
