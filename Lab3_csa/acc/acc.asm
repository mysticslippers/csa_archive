.data
i_addr:				.word 0x80
o_addr: 			.word 0x84
n: 				.word 0x0
i: 				.word 0x2
a: 				.word 0x0
b: 				.word 0x1
one: 				.word 0x1
minus_one: 			.word -1 
zero:       			.word 0x0
tmp: 				.word 0x0
overflow_const:   		.word 0xcccccccc
alignment:          		.byte '_'

.text
_start:
	load_ind 		i_addr
	store  			n
	beqz			return_zero
	ble 			return_minus_one
	sub 			one
	beqz			return_one
	
loop:
	load			i
	sub			n
	bgt			return_b
	load			a
	store			tmp
	load			b
	store			a
	add 			tmp
    	ble             	return_overflow
	store			b
	load			i
	add			one
	store 			i
	jmp			loop
	
return_zero:
	load			zero
	store			b
	jmp			return_b
	
return_minus_one:
	load			minus_one
	store			b
	jmp			return_b
	

return_one:
	load			one
	store			b
	jmp			return_b

return_overflow:
    	load            	overflow_const
    	store           	b

return_b:
	load			b
	store_ind		o_addr
	halt
