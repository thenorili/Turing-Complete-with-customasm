; how to compile and copy into turing complete:
; customasm file.asm -o file.txt -f annotatedbin
; then with regex,
; this comments out the leading line numbers
; %s/^/#/g
; this comments out the annotations
; %s/| \([0|1][0|1| ]*\);/|\r\1\r#;/g
; this adds the binary specifier
; %s/\([0|1]\{8\}\)/0b\1/g
; update:
; customasm <file.asm> -o <file.txt> -f tcgame,base:2,group:8

#subruledef math
{
	; arithmetic
	add   => 0x0;`8
	sub   => 0x1;`8
	and   => 0x2;`8
	or    => 0x3;`8
	not   => 0x4;`8
	xor   => 0x5;`8
	shl   => 0x6;`8
	shr   => 0x7;`8
	mul   => 0x8;`8
	mulhi => 0x9;`8
}

#const(noemit) cond = 32
#subruledef cond
{
	je    => (cond + 0x0);`8
	jne   => (cond + 0x1);`8
	jlt   => (cond + 0x2);`8
	jle   => (cond + 0x3);`8
	jgt   => (cond + 0x4);`8
	jge   => (cond + 0x5);`8
}

#subruledef numbered_register
{
    r{n:u4} => {
        assert(n <= 9)
        n`8
    }
}

#subruledef special_register
{
    fp  => 0x9`8 ; frame pointer / r9
    pc  => 0xA`8 ; program counter
	sp  => 0xB`8 ; stack pointer
	rp  => 0xC`8 ; ram pointer
	ram => 0xD`8 ; ram
    lr  => 0xE`8 ; link register
	out => 0xF`8
	in  => 0xF`8
}

#subruledef register
{
    {r: numbered_register} => r`8
    {r: special_register} => r`8
}

#subruledef imm
{
    #{n:i8} => 0b1 @ n
}

#subruledef value
{
	; register
    {a: register} => a`8
	; immediate
    {a: imm} => a`9
}

#ruledef
{
    ; fundamental syntax
    {op: math} {r: register}, {a: value}, {b: value} => 
    {
        (op | ((a >> 8) << 7) | ((b >> 8) << 6))`8 @ a`8 @ b`8 @ r`8
    }
    ; fixme remember how immediates for condition results are handled
    {op: cond} {addr: value}, {a: value}, {b: value} => 
    {
        (op | ((a >> 8) << 7) | ((b >> 8) << 6))`8 @ a`8 @ b`8 @ addr`8
    }

    ; aliases
    mov  {r:register}, {a: value} => asm
    {
        add {r}, {a}, #0
    }
    not  {r: register}, {a: value} => asm
    {
        not {r}, {a}, #0
    }
    jmp {addr: value} => asm
    {
        je {addr}, #0, #0
    }
    inc {a: register} => asm
    {
        add {a}, {a}, #1
    }
    dec {a: register} => asm
    {
        sub {a}, {a}, #1
    }
    push {a: value} => asm
    {
        ; decrement the stack pointer (the stack grows down!)
        dec sp
        ; point to the head of the stack
        mov rp, sp
        ; copy to the stack
        mov ram, {a}
    }
;    push {a: value}, {b: value} => asm
;    {
;        push {b}
;        push {a}
;    }
    pop {a: register} => asm
    {
        ; point to the head of the stack
        mov rp, sp
        ; copy from the stack
        mov {a}, ram
        ; increment the stack pointer
        inc sp
    }
    jmpr {a: register} => asm
    {
        add pc, {a}, #0
    }
}

MAX = 0xFF
MIN = 0x00