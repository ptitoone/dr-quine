;c
section .data
	fmt:	db	";c%1$csection .data%1$c%2$cfmt:%2$cdb%2$c%4$c%3$s%4$c,0%1$csection .bss%1$csection .text%1$c%2$cextern printf%1$c%2$cglobal main%1$cprint:%1$c%2$center%2$c0, 0%1$c%2$cmov%2$crdi, fmt%1$c%2$cmov%2$crsi, 10%1$c%2$cmov%2$crdx, 9%1$c%2$cmov%2$crcx, fmt%1$c%2$cmov%2$cr8, 34%1$c%2$cxor%2$crax, rax%1$c%2$ccall%2$cprintf%1$c%2$cleave%1$c%2$cret%1$cmain:%1$c%2$c;c%1$c%2$center%2$c0, 0%1$c%2$ccall%2$cprint%1$c%2$cxor%2$crax, rax%1$c%2$cleave%1$c%2$cret%1$c%1$c",0
section .bss
section .text
	extern printf
	global main
print:
	enter	0, 0
	mov	rdi, fmt
	mov	rsi, 10
	mov	rdx, 9
	mov	rcx, fmt
	mov	r8, 34
	xor	rax, rax
	call	printf
	leave
	ret
main:
	;c
	enter	0, 0
	call	print
	xor	rax, rax
	leave
	ret

