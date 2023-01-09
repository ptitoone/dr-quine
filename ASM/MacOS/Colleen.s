;c
section .data
	fmt:	db	";c%1$csection .data%1$c%2$cfmt:%2$cdb%2$c%4$c%3$s%4$c,0%1$csection .bss%1$csection .text%1$c%2$cdefault rel%1$c%2$cextern _printf%1$c%2$cglobal _main%1$c_print:%1$c%2$center%2$c0, 0%1$c%2$clea%2$crdi, [fmt]%1$c%2$cmov%2$crsi, 10%1$c%2$cmov%2$crdx, 9%1$c%2$clea%2$crcx, [fmt]%1$c%2$cmov%2$cr8, 34%1$c%2$cxor%2$crax, rax%1$c%2$ccall%2$c_printf%1$c%2$cleave%1$c%2$cret%1$c_main:%1$c%2$c;c%1$c%2$center%2$c0, 0%1$c%2$ccall%2$c_print%1$c%2$cxor%2$crax, rax%1$c%2$cleave%1$c%2$cret%1$c%1$c",0
section .bss
section .text
	default rel
	extern _printf
	global _main
_print:
	enter	0, 0
	lea	rdi, [fmt]
	mov	rsi, 10
	mov	rdx, 9
	lea	rcx, [fmt]
	mov	r8, 34
	xor	rax, rax
	call	_printf
	leave
	ret
_main:
	;c
	enter	0, 0
	call	_print
	xor	rax, rax
	leave
	ret

