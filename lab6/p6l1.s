# Lab 6	- 2019A7PS0235U
# Program 1 : Find the length of a string stored in memory.

.data

msg0:	.asciiz	"\nEnter String : "
msg1:	.asciiz	"String : "

msg2:	.asciiz "\nLength : "
str:	.space 100

.text
main:	li $v0, 4
	la $a0, msg0
	syscall

	li $v0, 8
	la $a0, str
	li $a1, 100
	syscall

	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 4
	la $a0, str
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	la $a1, str
	addi $s1, $zero, 0
	addi $t1, $zero, 10

	jal length

	li $v0, 1
	add $a0, $zero, $s1
	syscall

	li $v0, 10
	syscall

length:	lb $s0, ($a1)
#	beq $s0, $zero, exit1
	beq $s0, $t1, exit1


	addi $s1, $s1, 1
	addi $a1, $a1, 1

	j length

exit1:	jr $ra
