# Lab 6
# Porgram 3 : Find if a given string is palindrome or not and print the result to the user.

.data

msg1:	.asciiz	"\nString : "

msg2:	.asciiz "\nPalindrome"
msg3:	.asciiz "\nNot Palindrome"

str:	.asciiz "nayan"

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 4
	la $a0, str
	syscall

	la $a0, str
	la $a1, str

loop1:	lb $s0, ($a1)
	beq $s0, $zero, palin
	addi $a1, $a1, 1
	j loop1

palin:	addi $a1, $a1, -1

loop2:	lb $s0, ($a0)
	lb $s1, ($a1)

	bne $s0, $s1, no

	slt $t0, $a0, $a1
	beq $t0, $zero, yes
	addi $a0, $a0, 1
	addi $a1, $a1, -1

	j loop2

yes:	li $v0, 4
	la $a0, msg2
	syscall

	j exit

no:	li $v0, 4
	la $a0, msg3
	syscall

exit:	li $v0, 10
	syscall
