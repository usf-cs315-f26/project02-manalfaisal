.global sort_s

sort_s:
	# save registers we need
	addi sp, sp, -32
	sd ra, 24(sp)
	sd s0, 16(sp)
	sd s1, 8(sp)
	sd s2, 0(sp)

	# save arr and len
	mv s0, a0
	mv s1, a1

	# i = 0
	li s2, 0

loop:
	# if i reaches len then we are done
	bge s2, s1, done

	# get address of arr[i]
	slli t0, s2, 2
	add a0, s0, t0

	# get remaining length
	sub a1, s1, s2

	# find max index in remaining array
	call find_max_index_s

	# change index back to original array
	add t0, a0, s2

	# get address of arr[idx]
	slli t1, t0, 2
	add t1, s0, t1

	# get address of arr[i]
	slli t2, s2, 2
	add t2, s0, t2

	# load arr[idx] and arr[i]
	lw t3, 0(t1)
	lw t4, 0(t2)

	# if arr[idx] is not bigger then skip swap
	ble t3, t4, next

	# swap arr[idx] and arr[i]
	sw t3, 0(t2)
	sw t4, 0(t1)

next:
	# move to next index
	addi s2, s2, 1
	j loop

done: 
	# restore saved registers
	ld s2, 0(sp)
	ld s1, 8(sp) 
	ld s0, 16(sp)
	ld ra, 24(sp)
	addi sp, sp, 32
	ret
