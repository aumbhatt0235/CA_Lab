# Lab 5
# Program 3 : Sum the even numbers and odd numbers in a word array A and display the result to the user.

.data

msg1:	.asciiz	"Array : \n"
msg2:	.asciiz	"\nSum of Even's = "
msg3:	.asciiz	"\nSum of Odd's = "

bsp:	.asciiz	" "

A:	.word	1, 2, 3, 4, 5, 6, 7

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	addi $s0, $zero, 0	# Sum of Even's
	addi $s1, $zero, 0	# Sum of Odd's
	addi $s2, $zero, 2

	jal getSum

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

getSum:	addi $t0, $zero, 7

	la $a1, A

loop1:	slti $t1, $t0, 1
	bne $t1, $zero, exit1

	lw $a0, ($a1)

	div $a0, $s2
	mfhi $t1
	beq $t1, $zero, even

	add $s1, $s1, $a0
	j cont

even:	add $s0, $s0, $a0

cont:	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	addi $a1, $a1, 4
	addi $t0, $t0, -1
	j loop1

exit1:	jr $ra
