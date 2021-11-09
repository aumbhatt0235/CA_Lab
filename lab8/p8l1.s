# Lab 8 - 2019A7PS0235U
# Binary Search

.data

arr:    .word   23, 44, 80, 100, 120
data1:  .word   100
len:    .word   5

.text
main:   la $s0, data1
        la $s2, len

        la $a0, arr
        lw $a1, ($s0)   # data
        li $a2, 0       # low
        lw $a3, ($s2)   # high
        li $t0, 4
        mul $a3, $a3, $t0
        addi $a3, $a3, -4

        jal binary

        move $a0, $v0
        li $v0, 1
        syscall

binary: addi $sp, $sp, -4
        sw $ra, 0($sp)

        blt $a2, $a3, next

        li $v0, -1
        addi $sp, $sp, 4
        jr $ra

next:   add $s0, $a2, $a3
        li $t0, 2
        div $s0, $t0
        mflo $s0

        addi $t3, $0, 4
        mul $s0, $s0, $t3
        add $s1, $s0, $a0
        move $t1, $s1
        lw $t2, 0($t1)
        bne $a1, $t1, neql

        add $v0, $0, $s0
        jr $ra

neql:   bge $a1, $t1, ngrt
        addi $a3, $s0, -4
        jal binary

ngrt:   addi $a2, $a2, 4
        jal binary
