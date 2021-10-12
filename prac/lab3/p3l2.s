.data

msg1:   .asciiz "Enter N : "
msg2:   .asciiz "\nSum of digits = "

.text

main:   li $v0, 4
        la $a0, msg1            # Prompt user to enter N.
        syscall

        li $v0, 5               # Capture input for N.
        syscall

        move $t0, $v0           # $t0 = N
        addi $t1, $zero, 10     # initialize $t1=10; as 'div' doesn't support immediate dividend.
        addi $t3, $zero, 0      # initialize $t3=0 for storing the sum of digits.
    
LOOP1:  div $t0, $t1            # divide quotient by 10.
        mflo $t0                # store quotient back in $t0.
        mfhi $t2                # store remainder in $t2.

        add $t3, $t3, $t2       # add remainder to sum.

        bgt $t0, $zero, LOOP1   # loop if quotient > 0.


exitloop1:  li $v0, 4
            la $a0, msg2
            syscall
            
            li $v0, 1
            move $a0, $t3
            syscall

            li $v0, 10
            syscall