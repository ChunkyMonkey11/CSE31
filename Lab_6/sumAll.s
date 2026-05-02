# CSE31 Lab 06 - Individual Assignment 1
# sumAll.s
#
# Repeatedly reads integers until 0 is entered.
# Maintains:
#   even_sum = sum of all even inputs
#   odd_sum  = sum of all odd inputs
#
# Forbidden instructions respected: div, and, or, andi, ori

#.data section(static data stored in memory) & .asciiz means "store this as a null-terminated ASCII string taht ends with 0 byte. 
.data
prompt:         .asciiz "Please enter a number: "
evenLabel:      .asciiz "Sum of even numbers is: "
oddLabel:       .asciiz "Sum of odd numbers is: "
newline:        .asciiz "\n"

.text
.globl main

main:
    add     $s0, $zero, $zero    # even_sum
    add     $s1, $zero, $zero    # odd_sum

loop:
    # Print prompt.
    li      $v0, 4
    la      $a0, prompt
    syscall

    # Read integer into $t0.
    li      $v0, 5
    syscall
    move    $t0, $v0

    # Stop when user enters 0.
    beq     $t0, $zero, done

    # Extract low bit;
    # odd -> 1, even -> 0
    sll     $t1, $t0, 31 
    srl     $t1, $t1, 31
    # sll - srl: is a pattern that isolates the lowest bit,

    beq     $t1, $zero, add_even

add_odd:
    add     $s1, $s1, $t0
    j       loop

add_even:
    add     $s0, $s0, $t0
    j       loop

done:
    # Print even sum.
    li      $v0, 4
    la      $a0, evenLabel
    syscall

    li      $v0, 1
    add     $a0, $s0, $zero
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    # Print odd sum.
    li      $v0, 4
    la      $a0, oddLabel
    syscall

    li      $v0, 1
    add     $a0, $s1, $zero
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10
    syscall
