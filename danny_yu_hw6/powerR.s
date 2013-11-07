	.file	"powerR.c"
	.text
.globl powerR
	.type	powerR, @function
powerR:
.LFB0:
	.cfi_startproc
	pushq	%rbp		# push frame pointer
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp	# set current frame
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp	# allocate 16 bytes to stack
	movl	%edi, -4(%rbp)	# get argument for 'pow' parameter
	movl	%esi, -8(%rbp)	# get argument for 'base' parameter
	cmpl	$0, -4(%rbp)	# compare 0 with pow
	jne	.L2		# jump to .L2 if not equal
	movl	$1, %eax	# else return 1
	jmp	.L3		# jump to .L# (quit)
.L2:
	movl	-4(%rbp), %eax	# move 'pow' into eax
	leal	-1(%rax), %edx	# loads address into edx (pow-1)
	movl	-8(%rbp), %eax	# move 'base' into eax
	movl	%eax, %esi	# moving arguments to stack for recursive call
	movl	%edx, %edi	# moving arguments to stack for recursive call
	call	powerR		# recursively calls powerR
	imull	-8(%rbp), %eax	# multiplies recursive call return value with 'base'
.L3:
	leave			# exit prog
	ret
	.cfi_endproc
.LFE0:
	.size	powerR, .-powerR
	.ident	"GCC: (Debian 4.4.6-11) 4.4.6"
	.section	.note.GNU-stack,"",@progbits
