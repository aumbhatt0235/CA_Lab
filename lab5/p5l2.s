# Lab 5
# Program 2 : Sum the elements of a word array A having 5 elements and display the result to the user.

.data

msg1:	.asciiz	"Array : \n"
msg2:	.asciiz "\nSum of Array = "

bsp:	.asciiz	" "

A:	.word 	20, -1, 11, 98, 90

.text
main:	addi $s0, $zero, 0	# $s0 = sum = 0

	li $v0, 4
	la $a0, msg1
	syscall

	jal getSum

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	addi $a0, $s0, 0
	syscall

	li $v0, 10
	syscall

getSum:	la $a1, A

	addi $t0, $zero, 5

loop1:	slti $t1, $t0, 1
	bne $t1, $zero, exit

	lw $a0, ($a1)
	add $s0, $s0, $a0

	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	addi $a1, $a1, 4
	addi $t0, $t0, -1

	j loop1

exit:	jr $ra
