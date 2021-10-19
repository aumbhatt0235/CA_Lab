# Lab 6
# Program 4 : Concatenate two strings into a single string.

.data

msg1:	.asciiz	"\nString 1 : "
msg2:	.asciiz	"\nString 2 : "
msg3:	.asciiz	"\nFinal    : "

str1:	.asciiz	"Aum"
str2:	.asciiz	"Bhatt"
con:	.space	200

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 4
	la $a0, str2
	syscall

	jal concat

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 4
	la $a0, con
	syscall

	li $v0, 10
	syscall


concat:	la $s0, str1
	la $s1, str2
	la $a0, con

loop1:	lb $t0, ($s0)
	beq $t0, $zero, loop2

	sb $t0, ($a0)

	addi $s0, $s0, 1
	addi $a0, $a0, 1

	j loop1

loop2:	lb $t0, ($s1)
	beq $t0, $zero, exit1

	sb $t0, ($a0)

	addi $s1, $s1, 1
	addi $a0, $a0, 1

	j loop2

exit1:	jr $ra
