# Lab 4
# Program 3 : Add two arrays and store results in 3rd array.

.data

msg1:	.asciiz	"Array 1 : "
msg2:	.asciiz	"Array 2 : "

bsp:	.asciiz " "
lf:	.asciiz "\n"

msg3:	.asciiz "Array 3 : "

array1:	.word	1, 2, 3, 4, 5
array2:	.word	5, 4, 3, 2, 1
array3:	.space	20

.text
main:	addi $t0, $zero, 1
	addi $t1, $zero, 5

# Print Array1
	la $a0, msg1
	jal pMsg

	la $s0, array1
	jal pArray

# Print Array2
	la $a0, msg2
	jal pMsg

	la $s0, array2
	jal pArray

# Add arrays
	la $s1, array1
	la $s2, array2
	la $s3, array3

loop1:	bgt $t0, $t1, break1
	lw $t2, ($s1)
	lw $t3, ($s2)
	add $t4, $t2, $t3
	sw $t4, ($s3)

	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $s3, $s3, 4

	addi $t0, $t0, 1

	j loop1

break1:	addi $t0, $zero, 1
	la $s0, array3
	jal pArray


# Exit Program
	li $v0, 10
	syscall

pArray:	lw $a0, ($s0)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	addi $s0, $s0, 4
	addi $t0, $t0, 1

	ble $t0, $t1, pArray

	addi $t0, $zero, 1
	addi $t1, $zero, 5

	li $v0, 4
	la $a0, lf
	syscall

	jr $ra

pMsg:	li $v0, 4
	syscall
	jr $ra

