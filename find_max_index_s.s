.global find_max_index_s

find_max_index_s:
	# start max index and i at 0
	li t0, 0
	li t1, 0

loop:
	# if i reaches len, we are done
	bge t1, a1, done

	# get address of arr[i]
	slli t2, t1, 2
	add t2, a0, t2

	# load arr[i] 
	lw t3, 0(t2)

	# get address of arr[idx]
	slli t2, t0, 2
	add t2, a0, t2

	# load arr[idx]
	lw t4, 0(t2)

	# if arr[i] is not bigger, keep current idx
	ble t3, t4, next

	# new max found, save its index
	mv t0, t1

next:
	# move to next index
	addi t1, t1, 1
	j loop

done:
	# return max index
	mv a0, t0
	ret

	
	
