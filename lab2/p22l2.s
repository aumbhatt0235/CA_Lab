# Lab 2 - Practice Program 2 : Read and Print an string in MIPS assembly
# 2019A7PS0235U

.data
msg1:   .asciiz "Enter message: "
msg2:   .asciiz "\n----------------\nMessage: "
msg3:	.space 50

.text
main:	li $v0, 4	# Print string system call
	la $a0, msg1
	syscall

	li $v0, 8	# Read string system call
	la $a0, msg3
	li $a1, 50
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 10
	syscall
.end main
