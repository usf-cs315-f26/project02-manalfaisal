.global swap_s

swap_s:
	# get address of arr[i] 
	slli t0, a1, 2
	add t0, a0, t0

	# get address of arr[j]
	slli t1, a2, 2
	add t1, a0, t1

	# load values at i and j
	lw t2, 0(t0)
	lw t3, 0(t1)

	# swap values 
	sw t3, 0(t0)
	sw t2, 0(t1)

	ret
