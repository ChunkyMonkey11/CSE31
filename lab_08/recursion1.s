# jal does two things:
# Saves the return address(next instructions) into $ra.
# Jumpts to label recursion. (In our case but this would typically be the function we are calling)



#we load these in advance
.data
prompt: .asciiz "Please enter a number: "
newline: .asciiz "\n"

.text
main:
# displays the prompt and we use 4  as the system code for string print
	li   $v0, 4
	la   $a0, prompt
	syscall

#  Same principle 

	li   $v0, 5
	syscall

# for future reference remeber we move $v0 value into $a0

# "a0" becomes the argument for recursion 

	move $a0, $v0 
	

	jal  recursion


	move $t0, $v0  # Save function return value (from recursion->$t0)
	li   $v0, 1    # PrintInt = 1
	move $a0, $t0  
	syscall

	#prints newline
	li   $v0, 4
	la   $a0, newline
	syscall

	# terminate execution
	li   $v0, 10
	syscall


recursion:
	addi $sp, $sp, -16
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)

	# if (m == -1) return 3;
	addi $t0, $a0, 1
	beq  $t0, $zero, ret_three

	# else if (m <= -2) { if (m < -2) return 2; else return 1; }
	slti $t0, $a0, -2
	bne  $t0, $zero, ret_two 
	addi $t0, $a0, 2
	beq  $t0, $zero, ret_one

	# return recursion(m - 3) + m + recursion(m - 2);
	
	addi $a0, $a0, -3
	jal  recursion
	sw   $v0, 8($sp) #second recursive call will overwrite $v0; so we must preserve the first return value

	#reload here to get the orginal m not modified m. 
	lw   $t1, 4($sp)
	
	# Subtract m by 2 here and then pass it on to recursion. 
	addi $a0, $t1, -2
	jal  recursion

	#We are able to compute the final result after the second call because we are loading lw our (firstresult) & (secondresult)
	lw   $t0, 8($sp)
	lw   $t1, 4($sp)
	add  $t0, $t0, $t1
	add  $v0, $t0, $v0
	j    end_recur

ret_three:
	li   $v0, 3
	j    end_recur

ret_two:
	li   $v0, 2
	j    end_recur

ret_one:
	li   $v0, 1

# Restore $ra, deallocate stack frame, return with jr $ra.
end_recur:
	lw   $ra, 0($sp)
	addi $sp, $sp, 16
	jr   $ra
