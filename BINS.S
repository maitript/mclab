	area binarysearch, code

	ldr r0,=array
	ldr r1,=key
	ldr r2, [r1]; key
	
	mov r1, #0; low
	mov r3, #4; high-1
	
next_itr
	cmp r1, r3; low vs high
	movgt r4,#-1
	bgt over
	
	add r4, r1, r3; low+high
	asr r4, #1; mid= low+high /2
	
	mov r5, #0
	add r5, r4, lsl #2
	
	add r5, r5, r0
	ldr r6, [r5]; r6-array[mid]
	
	cmp r2, r6; key vs a[mid]
	beq ove
	
	sublt r3, r4, #1; high=mid-1
	addgt r1, r4, #1; low=mid+1
	b next_itr
	
ove add r4, r4, #1; position 

over b over

array dcd 0x11, 0x22, 0x33,0x44, 0x55
key dcd 0x44
	end
