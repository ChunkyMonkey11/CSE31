.data
prompt: .asciiz "Please enter an integer: "
newline: .asciiz "\n"

.text
main:
	addi $sp, $sp, -4

	li   $v0, 4
	la   $a0, prompt
	syscall

	li   $v0, 5
	syscall
	move $a0, $v0

	jal recursion

	move $t0, $v0
	li   $v0, 1
	move $a0, $t0
	syscall

	li   $v0, 4
	la   $a0, newline
	syscall

	j end


# Implementing recursion
recursion:
	addi $sp, $sp, -12
	sw   $ra, 0($sp)

	addi $t0, $a0, 1
	bne  $t0, $zero, not_minus_one

	li   $v0, 1
	j    end_recur

not_minus_one:
	bne  $a0, $zero, not_zero
	li   $v0, 3
	j    end_recur

not_zero:
	sw   $a0, 4($sp)
	addi $a0, $a0, -2
	jal  recursion

	sw   $v0, 8($sp)
	lw   $a0, 4($sp)
	addi $a0, $a0, -1
	jal  recursion

	lw   $t0, 8($sp)
	add  $v0, $t0, $v0
	j    end_recur


# End of recursion function
end_recur:
	lw   $ra, 0($sp)
	addi $sp, $sp, 12
	jr   $ra

# Terminating the program
end:
	addi $sp, $sp, 4
	li   $v0, 10
	syscall
