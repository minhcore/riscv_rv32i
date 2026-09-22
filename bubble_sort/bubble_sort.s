	.file	"bubble_sort.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	swap
	.type	swap, @function
swap:
	lw	a5,0(a0)
	lw	a4,0(a1)
	sw	a4,0(a0)
	sw	a5,0(a1)
	ret
	.size	swap, .-swap
	.align	2
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	addi	a7,a1,-1
	ble	a7,zero,.L2
	mv	a2,a0
	mv	a6,a7
	slli	a5,a7,2
	add	a0,a0,a5
	li	a1,0
	j	.L4
.L11:
	sw	a3,0(a5)
	sw	a4,-4(a5)
.L5:
	addi	a5,a5,-4
	beq	a5,a2,.L7
.L6:
	lw	a4,0(a5)
	lw	a3,-4(a5)
	bge	a4,a3,.L5
	j	.L11
.L7:
	addi	a1,a1,1
	addi	a2,a2,4
	beq	a1,a6,.L2
.L4:
	mv	a5,a0
	bgt	a7,a1,.L6
	j	.L7
.L2:
	ret
	.size	bubble_sort, .-bubble_sort
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	li	a5,10
	sw	a5,12(sp)
	li	a5,2
	sw	a5,16(sp)
	li	a5,7
	sw	a5,20(sp)
	li	a5,4
	sw	a5,24(sp)
	li	s0,1
	sw	s0,28(sp)
	li	a1,5
	addi	a0,sp,12
	call	bubble_sort
	mv	a0,s0
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
