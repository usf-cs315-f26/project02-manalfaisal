.global to_upper_s

to_upper_s:

loop:
	# load current char
	lb t0, 0(a0)

	# if reached end of string --> return
	beq t0, zero, done

	# check if char is below 'a'
	li t1, 97 
	blt t0, t1, next # branch if less than

	# check if char is above 'z', skip it
	li t1, 122
	bgt t0, t1, next # branch if greater than

	# convert lowercase to uppercase
	addi t0, t0, -32

	# save changed char back to string 
	sb t0, 0(a0) 

next:
	# move to next char
	addi a0, a0, 1 # adding 1 to address
	j loop

done: 
	ret
	

	

	
