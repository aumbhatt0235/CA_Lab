# Lab 3
# Program 4: Write MIPS Assembly for the high level code " a = a * b / c % d + e; "

# Expression after precedence identification:
#                           a  = (((a * (b / c)) % d) + e);

.data

msga:   .asciiz "Enter a : "
msgb:   .asciiz "Enter b : "
msgc:   .asciiz "Enter c : "
msgd:   .asciiz "Enter d : "
msge:   .asciiz "Enter e : "