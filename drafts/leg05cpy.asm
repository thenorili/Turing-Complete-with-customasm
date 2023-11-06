#subruledef register
{
    r{n:u4} => n`8
}
#subruledef imm
{
    #{n:s8} => 0b1 @ n
}
#subruledef value
{
	; register
    {a: register} => a`8
	; immediate
    {a: imm} => a`9
}
#subruledef ALU
{
    add => 0x00`8
    or => 0x01`8
}
#ruledef
{
    {op: ALU} {a: value} {b: value} {r: register} => 
    {
        (op | ((a >> 8) << 7) | ((b >> 8) << 6))`8 @ a`8 @ b`8 @ r`8
    }
    {a: value} => a`8
    {a: value} {b: value} => a`8 @ b`8

}


multiply3x4:
    add r1 r2 r3
    add r1 #4 r0
    r1
    r1 r5