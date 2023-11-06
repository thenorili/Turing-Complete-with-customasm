

#subruledef register
{
    {n:u3} => n`8
}
#subruledef imm
{
    {n:s8} => 0b1 @ n
}
#subruledef value
{
	; register
    r{a: register} => a`8
	; immediate
    {a: imm} => a`9
}
#subruledef ALU
{
    add => 0x00
    or => 0x01
}
#ruledef
{
    {op: ALU} {a: value} {b: value} {r: register} => (op | ((a >> 8) << 7) | ((b >> 8) << 6))`8 @ a`8 @ b`8 @ r
    {a: value} => a
    ; {a: value} {b: value} => a @ b

}


multiply3x4:
;    add r1 4 r0
    r1