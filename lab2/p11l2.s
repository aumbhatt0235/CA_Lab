# Lab 1 - Practice Program 1 : Read and Print an integer in MIPS assembly
# 2019A7PS0235U

.data
msg1:   .asciiz "Enter Integer: "
msg2:   .asciiz "\nInteger: "
value:  .word   10

.text
main:   li $v0, 4
        la $a0, msg1    # Print msg1
        syscall

        li $v0, 5       # Read integer and store in v0
        syscall

        move $t0, $v0   # Move content of v0 into temp. reg. t0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1       # Call code for printing integer
        move $a0, $t0   # Move content of t0 to a0 for printing
        syscall

        li $v0, 10
        syscall
.end main
