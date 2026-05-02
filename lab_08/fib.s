.data
prompt: .asciiz "Please enter a number: "
newline: .asciiz "\n"
# n:    .word 13

.text
main:
	add  $t0, $zero, $zero
	addi $t1, $zero, 1
	# la  $t3, n
	# lw  $t3, 0($t3)

	li   $v0, 4
	la   $a0, prompt
	syscall

	li   $v0, 5
	syscall
	move $t3, $v0

fib:
	beq  $t3, $zero, finish
	add  $t2, $t1, $t0
	move $t0, $t1
	move $t1, $t2
	addi $t3, $t3, -1
	j    fib

finish:
	move $a0, $t0
	li   $v0, 1
	syscall

	li   $v0, 4
	la   $a0, newline
	syscall

	li   $v0, 10
	syscall
