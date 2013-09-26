	.file	"lab1_1EH.c"
	.text
.globl powerI
	.type	powerI, @function
powerI:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$1, -8(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	imull	12(%ebp), %eax
	movl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L3
	movl	-8(%ebp), %eax
	leave
	ret
	.size	powerI, .-powerI
	.ident	"GCC: (Debian 4.4.6-11) 4.4.6"
	.section	.note.GNU-stack,"",@progbits
