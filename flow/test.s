	.file	"test.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	add
	.type	add, @function
add:
	add	a0,a0,a1
	ret
	.size	add, .-add
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,100
	sw	a5,12(sp)
	li	a5,76
	sw	a5,8(sp)
	lw	a5,12(sp)
	lw	a4,8(sp)
	add	a5,a5,a4
	sw	a5,4(sp)
	lw	a0,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
