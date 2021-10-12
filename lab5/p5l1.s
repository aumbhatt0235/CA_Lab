# Lab 5
# Program 1 : Find largest and smallest element of a word array A which has 10 elements.

.data

msg1:	.asciiz	"\nArray    : "
msg2:	.asciiz "\nLargest  : "
msg3:	.asciiz	"\nSmallest : "

bsp:	.asciiz " "

array:	.word	2, 3, 1, 50, -1, 12, 10, 4, 7, 600

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	jal find

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	addi $a0, $s0, 0
	syscall

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	addi $a0, $s1, 0
	syscall

	li $v0, 10
	syscall


find:	la $a1, array		# Base Addr. of array

	lw $s0, 0($a1)		# $s0 = Largest
	lw $s1, 0($a1)		# $s1 = Smallest

	addi $t0, $zero, 1	# Outer Count = 1
	addi $s5, $a1, 0


outer:	slti $t2, $t0, 1
	bne $t2, $zero, exOuter

	addi $t1, $zero, 10	# Inner Count = 1

	lw $a0, ($s5)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	add $s4, $zero, $a1

inner:	slti $t2, $t1, 1
	bne $t2, $zero, exInner

	lw $s3, 0($s4)

	slt $t2, $s0, $s3
	bne $t2, $zero, large

	slt $t2, $s3, $s1
	bne $t2, $zero, small

	j equal

	large:	addi $s0, $s3, 0
		j equal

	small:	addi $s1, $s3, 0

	equal:	addi $t1, $t1, -1
		addi $s4, $s4, 4
		j inner

	exInner:addi $t0, $t0, -1
		addi $s5, $s5, 4
		j outer

exOuter:jr $ra
