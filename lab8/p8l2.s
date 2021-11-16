# Lab 8 - Power by Recursion -  2019A7PS0235U

.data

x:      .word   2
n:      .word   3

sym:    .asciiz "^"
eql:    .asciiz " = "

.text
main:       lw $a0, x
            lw $a1, n

            jal power

            li $v0, 1
            syscall

            li $v0, 4
            la $a0, sym
            syscall

            li $v0, 1
            lw $a0, n
            syscall

            li $v0, 4
            la $a0, eql
            syscall

            li $v0, 1
            move $a0, $v1
            syscall

            li $v0, 10
            syscall

power:      addi $sp, $sp, -4
            sw $ra, 0($sp)


            li $t0, 1
            beq $a1, $t0, return

            addi $a1, $a1, -1
            jal power

            mul $v1, $v1, $a0
            lw $ra, 0($sp)
            add $sp, $sp, 4

            jr $ra


return:     move $v1, $a0
            addi $sp, $sp, 4
            jr $ra