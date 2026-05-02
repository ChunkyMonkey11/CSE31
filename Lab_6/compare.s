# CSE31 Lab 06 - TPS Activity 2
# compare.s
#
# Reads one integer and demonstrates both comparison pairs from the handout:
# 1) < and >=
# 2) > and <=

.data
n:      .word 25
str1:   .asciiz "Less than\n"
str2:   .asciiz "Less than or equal to\n"
str3:   .asciiz "Greater than\n"
str4:   .asciiz "Greater than or equal to\n"
prompt: .asciiz "Please enter an integer: "

.text
.globl main

main:
    # Prompt user.
    li      $v0, 4
    la      $a0, prompt
    syscall

    # Read integer (result in $v0), move to $t0.
    li      $v0, 5
    syscall
    move    $t0, $v0

    # Load n into $t1.
    la      $t9, n
    lw      $t1, 0($t9)

    # ----- Pair 1: (<) and (>=) -----
    slt     $t2, $t0, $t1        # $t2 = 1 when input < n
    beq     $t2, $zero, print_ge

    li      $v0, 4
    la      $a0, str1            # "Less than"
    syscall
    j       pair2

print_ge:
    li      $v0, 4
    la      $a0, str4            # "Greater than or equal to"
    syscall

pair2:
    # ----- Pair 2: (>) and (<=) -----
    slt     $t2, $t1, $t0        # $t2 = 1 when n < input (input > n)
    beq     $t2, $zero, print_le

    li      $v0, 4
    la      $a0, str3            # "Greater than"
    syscall
    j       done

print_le:
    li      $v0, 4
    la      $a0, str2            # "Less than or equal to"
    syscall

done:
    li      $v0, 10
    syscall
