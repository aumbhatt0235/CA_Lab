# Lab 6 - 2019A7PS0235U
# Program 2 : Reverse a string stored in memory. Store the reversed string in memory. Also display the reversed string to the user.

.data

msg1:	.asciiz	"\nOriginal String : "
msg2:	.asciiz	"\nReversed String : "

str:	.asciiz "Aum Bhatt"
rstr:	.space	100

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 4
	la $a0, str
	syscall

	jal rev

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 4
	la $a0, rstr
	syscall

	li $v0, 10
	syscall

rev:	la $a0, str
	add $s0, $zero, $a0

loop1:	lb $t0, ($s0)
	beq $t0, $zero, exit1
	addi $s0, $s0, 1

	j loop1

exit1:	addi $s0, $s0, -1

	la $a1, rstr
	add $s1, $zero, $a1
	addi $a0, $a0, -1

loop2:	beq $s0, $a0, exit2

	lb $t0, ($s0)
	sb $t0, ($s1)

	addi $s0, $s0, -1
	addi $s1, $s1, 1

	j loop2

exit2:	jr $ra
