# Lab 4 - 2019A7PS0235U
# Program 2 : Linear Search in an array.

.data

msg0:	.asciiz	"Enter N : "
msg1:	.asciiz	"Array : \n"
msg2:	.asciiz	"\nSearching for : "

msg3:	.asciiz	"\nElement found at position : "
msg4:	.asciiz "\nElement not found."

bsp:	.asciiz " "
lf:	.asciiz "\n"

array:	.word	1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
key:	.word	78

.text
main:	li $v0, 4
	la $a0, msg0
	syscall

	li $v0, 5
	syscall

	la $a0, key
	sw $v0, ($a0)

	li $v0, 4
	la $a0, msg1
	syscall

	addi $t0, $zero, 10
	addi $t1, $zero, 1

	la $a1, array

loop1:	bgt $t1, $t0, exit1

	lw $a0, ($a1)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	addi $a1, $a1, 4
	addi $t1, $t1, 1

	j loop1

exit1:	li $v0, 4
	la $a0, msg2
	syscall

	la $a1, key

	li $v0, 1
	lw $a0, ($a1)
	syscall

	move $t2, $a0
	addi $t1, $zero, 1

	la $a1, array

loop2:	bge $t1, $t0, exit2

	lw $a0, ($a1)
	beq $a0, $t2, exit3

	addi $a1, $a1, 4
	addi $t1, $t1, 1

	j loop2

exit2:	li $v0, 4
	la $a0, msg4
	syscall

	j exit

exit3:	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

exit:	li $v0, 10
	syscall
