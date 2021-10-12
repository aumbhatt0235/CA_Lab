.data

msg1:   .asciiz "\nEnter A : "
msg2:   .asciiz "\nEnter B : "
msg3:   .asciiz "\nA + B   : "

.text

main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall

        move $t0, $v0

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 5
        syscall

        add $t1, $t0, $v0

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 10
        syscall