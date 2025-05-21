.data
input_addr:    .word 0x80
output_addr:   .word 0x84
total:		   .word 0

	.text
_start:
	@p input_addr b!
	@b
	
	lit 31 >r
loop:
	dup
	lit 1 and
    lit -1 +
	if continue
    inc_total	
continue:
	2/
	next loop
	write_output ;

inc_total:
	@p	total
	lit 1 +
	!p total
	;
	
	
write_output:
	@p output_addr b!
	@p total 
	!b
	
end:
    halt
