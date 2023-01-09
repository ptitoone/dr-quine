%define start _main
%define filename "Grace_kid.s"
%define string "%5$cdefine start _main%2$c%5$cdefine filename %3$cGrace_kid.s%3$c%2$c%5$cdefine string %3$c%1$s%3$c%2$c.data:%2$c%4$cfname:%4$cdb filename,0%2$c%4$cstr:%4$cdb string,0%2$c%4$cmode:%4$cdb %3$cw%3$c,0%2$c.bss:%2$c.text:%2$c%4$cdefault rel%2$c%4$cextern _fprintf%2$c%4$cextern _fopen%2$c%4$cextern _fclose%2$c%4$cglobal _main%2$cstart:%2$c;c%2$c%4$center%4$c0, 0%2$c%4$clea%4$crdi, [fname]%2$c%4$clea%4$crsi, [mode]%2$c%4$ccall%4$c_fopen%2$c%4$ccmp%4$crax, 0%2$c%4$cje%4$c_return_error%2$c%4$cpush rax%2$c%4$cmov%4$crdi, rax%2$c%4$clea%4$crsi, [str]%2$c%4$clea%4$crdx, [str]%2$c%4$cmov%4$crcx, 10%2$c%4$cmov%4$cr8, 34%2$c%4$cmov%4$cr9, 9%2$c%4$cpush 37%2$c%4$cxor%4$crax, rax%2$c%4$ccall%4$c_fprintf%2$c%4$cpop%4$crdi%2$c%4$cpop%4$crdi%2$c%4$ccall%4$c_fclose%2$c%4$cxor%4$crax, rax%2$c%4$cleave%2$c%4$cret%2$c_return_error:%2$c%4$cmov%4$crax, 1%2$c%4$cleave%2$c%4$cret%2$c%2$c"
.data:
	fname:	db filename,0
	str:	db string,0
	mode:	db "w",0
.bss:
.text:
	default rel
	extern _fprintf
	extern _fopen
	extern _fclose
	global _main
start:
;c
	enter	0, 0
	lea	rdi, [fname]
	lea	rsi, [mode]
	call	_fopen
	cmp	rax, 0
	je	_return_error
	push rax
	mov	rdi, rax
	lea	rsi, [str]
	lea	rdx, [str]
	mov	rcx, 10
	mov	r8, 34
	mov	r9, 9
	push 37
	xor	rax, rax
	call	_fprintf
	pop	rdi
	pop	rdi
	call	_fclose
	xor	rax, rax
	leave
	ret
_return_error:
	mov	rax, 1
	leave
	ret

