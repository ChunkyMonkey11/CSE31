.data
msg_pq:	.asciiz "p + q: "
nl:	.asciiz "\n"

.text
MAIN:	li $s0, 2			# x = 2
	li $s1, 4			# y = 4
	li $s2, 6			# z = 6

	# Call foo(x, y, z)
	addu $a0, $zero, $s0
	addu $a1, $zero, $s1
	addu $a2, $zero, $s2
	jal FOO

	# z = x + y + z + foo(x, y, z)
	addu $t0, $s0, $s1
	addu $t0, $t0, $s2
	addu $s2, $t0, $v0

	# printf("%d\n", z);
	addu $a0, $zero, $s2
	li $v0, 1
	syscall
	la $a0, nl
	li $v0, 4
	syscall

	li $v0, 10
	syscall

# foo(m = $a0, n = $a1, o = $a2)
# local p -> $s0, q -> $s1
FOO:	addiu $sp, $sp, -24
	sw $a0, 0($sp)		# save m
	sw $a1, 4($sp)		# save n
	sw $a2, 8($sp)		# save o
	sw $s1, 12($sp)		# save caller's s1
	sw $s0, 16($sp)		# save caller's s0
	sw $ra, 20($sp)		# save return address

	# p = bar(m + o, n + o, m + n)
	lw $t0, 0($sp)		# m
	lw $t1, 4($sp)		# n
	lw $t2, 8($sp)		# o
	addu $a0, $t0, $t2
	addu $a1, $t1, $t2
	addu $a2, $t0, $t1
	jal BAR
	addu $s0, $zero, $v0	# p

	# q = bar(m - o, n - m, n + n)
	lw $t0, 0($sp)		# m
	lw $t1, 4($sp)		# n
	lw $t2, 8($sp)		# o
	subu $a0, $t0, $t2
	subu $a1, $t1, $t0
	addu $a2, $t1, $t1
	jal BAR
	addu $s1, $zero, $v0	# q

	# printf("p + q: %d\n", p + q)
	addu $t0, $s0, $s1
	la $a0, msg_pq
	li $v0, 4
	syscall
	addu $a0, $zero, $t0
	li $v0, 1
	syscall
	la $a0, nl
	li $v0, 4
	syscall

	# return p + q
	addu $v0, $s0, $s1

	#Foo function epilogue
	lw $ra, 20($sp)
	lw $s0, 16($sp)
	lw $s1, 12($sp)
	addiu $sp, $sp, 24
	jr $ra

# bar(a = $a0, b = $a1, c = $a2)
BAR:	subu $t0, $a1, $a0	# (b - a)
	sllv $v0, $t0, $a2	# (b - a) << c
	jr $ra
