# MALP to print a string
	.data
msg1:	.asciiz "Hello World\n"
msg2:	.ascii "This is message is"
msg3:	.asciiz "\nmultiple lines."
var_a:	.word	20

	.text
main:	li $v0, 4	# syscall 4 (print_str)
	la $a0, msg1	# argument: string
	syscall		# print the string

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 4
	la $a0, var_a
	syscall

	li $v0, 10	# system code for exiting
	syscall 	# execute exit code