# Program for fizzbuzz till 'N'

.data

msg1:	.asciiz	"Enter N : "
lf:	.asciiz "\n"
pFizz:	.asciiz	"Fizz"
pBuzz:	.asciiz	"Buzz"

.text

main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall

	move $t2, $v0

	addi $t3, $zero, 3
	addi $t5, $zero, 5
	move $t0, $zero

loop1:	li $v0, 4
	la $a0, lf
	syscall

	addi $t0, $t0, 1
	bgt $t0, $t2, exit

	div $t0, $t3
	mfhi $t1
	bne $t1, $zero, buzz

	li $v0, 4
	la $a0, pFizz
	syscall

buzz:	div $t0, $t5
	mfhi $t1
	bne $t1, $zero, none

	li $v0, 4
	la $a0, pBuzz
	syscall

	j loop1

none:	li $v0, 1
	move $a0, $t0
	syscall

	j loop1

exit:	li $v0, 10
	syscall
