# Program 1 - Lab 2 - 2019A7PS0235U
# Write a MIPS program to take two values from the user, add these values and print the output

.data
msg1:   .asciiz "Enter A: "
msg2:   .asciiz "Enter B: "
msg3:   .asciiz "A + B = "

sum:    .word 10

.text
main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5   # Read 1st Integer
        syscall

        move $t0, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 5   # Read 2nd Integer
        syscall

        move $t1, $v0

        add $t2, $t0, $t1

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li $v0, 10
        syscall
.end main
