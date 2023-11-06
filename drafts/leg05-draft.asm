#subruledef register
{
	r0  => 0x0`8
	r1  => 0x1`8
	r2  => 0x2`8
	r3  => 0x3`8 
	r4  => 0x4`8
	r5  => 0x5`8
	r6  => 0x6`8
	r7  => 0x7`8
	r8  => 0x8`8
	r9  => 0x9`8
	r10 => 0xA`8
	sp  => 0xB`8
	rp  => 0xC`8
	ram => 0xD`8
;   na  => 0xE`8
	out => 0xF`8
	in  => 0xF`8
}

cond = 32
#subruledef math
{
	; arithmetic
	add   => 0x0`8
	sub   => 0x1`8
	and   => 0x2`8
	or    => 0x3`8
	not   => 0x4`8
	xor   => 0x5`8
	shl   => 0x6`8
	shr   => 0x7`8
	mul   => 0x8`8
	mulhi => 0x9`8
}

#subruledef cond
{
	je    => (cond + 0x0)`8
	jne   => (cond + 0x1)`8
	jlt   => (cond + 0x2)`8
	jle   => (cond + 0x3)`8
	jgt   => (cond + 0x4)`8
	jge   => (cond + 0x5)`8
}


; todo ram ergonomics
; arithmetic instructions
#ruledef
{
	; imm1 r2
	{opcode: math} {result: register}, #{source1: u8}, {source2: register} =>
	{
		opcode|64 @ result @ source1 @ source2
	}
	; r1 imm2
	{opcode: math} {result: register}, {source1: register}, #{source2: u8} =>
	{
		opcode|128 @ result @ source1 @ source2
	}
	; imm1 imm2
	{opcode: math} {result: register}, #{source1: u8}, #{source2: u8} =>
	{
		opcode|64|128 @ result @ source1 @ source2
	}
	; r1 r2
	{opcode: math} {result: register}, {source1: register}, {source2: register} =>
	{
		opcode @ result @ source1 @ source2
	}
}

; conditional instructions
#ruledef
{
	; imm1 r2
	{opcode: cond} {jmp_addr: u8}, #{source1: u8}, {source2: register} =>
	{
		opcode|64 @ jmp_addr @ source1 @ source2
	}
	; r1 imm2
	{opcode: cond} {jmp_addr: u8}, {source1: register}, #{source2: u8} =>
	{
		opcode|128 @ jmp_addr @ source1 @ source2
	}
	; imm1 imm2
	{opcode: cond} {jmp_addr: u8}, #{source1: u8}, #{source2: u8} =>
	{
		opcode|128|64 @ jmp_addr @ source1 @ source2
	}
	; r1 r2
	{opcode: cond} {jmp_addr: u8}, {source1: register}, {source2: register} =>
	{
		opcode @ jmp_addr @ source1 @ source2
	}
}

; aliases
#ruledef
{
	jmp {label: u8} =>
	{
		je @ label @ 0 @ 0
	}
	mov {result: register}, {source: register} =>
	{
		add|64 @ result @ source @ 0
	}
	mov {result: register}, #{source: u8} =>
	{
		add|128|64 @ result @ source @ 0
	}

	push {register: register} =>
	{
		
	}
	push #{value: u8} =>
	{
		
	}

}

; opcode result, source1, source2
; if opcode & 128 then 

; opcode result #source1 #source2
; #source1 => opcode = opcode & 128
; #source2 => opcode = opcode & 64
