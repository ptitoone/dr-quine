section .data
	s5name: db	"Sully_5.s",0
	fname: db	"Sully_X.s",0
	count: dd	5
	mode: db	"w",0
	sysfmt0: db	"nasm %1$s -f macho64 -o %2$s.o && gcc %2$s.o -o %2$s && rm -f %2$s.o && ./%2$s",0
	sysfmt1: db	"nasm %1$s -f macho64 -o %2$s.o && gcc %2$s.o -o %2$s && rm -f %2$s.o",0
	buff: times 100 db 0
	output: times 8 db 0
	str: db		"section .data%1$c%5$cs5name: db%5$c%2$cSully_5.s%2$c,0%1$c%5$cfname: db%5$c%2$cSully_X.s%2$c,0%1$c%5$ccount: dd%5$c%4$d%1$c%5$cmode: db%5$c%2$cw%2$c,0%1$c%5$csysfmt0: db%5$c%2$cnasm %6$c1$s -f macho64 -o %6$c2$s.o && gcc %6$c2$s.o -o %6$c2$s && rm -f %6$c2$s.o && ./%6$c2$s%2$c,0%1$c%5$csysfmt1: db%5$c%2$cnasm %6$c1$s -f macho64 -o %6$c2$s.o && gcc %6$c2$s.o -o %6$c2$s && rm -f %6$c2$s.o%2$c,0%1$c%5$cbuff: times 100 db 0%1$c%5$coutput: times 8 db 0%1$c%5$cstr: db%5$c%5$c%2$c%3$s%2$c,0%1$csection .bss%1$csection .text%1$c%5$cdefault rel%1$c%5$cextern _fprintf%1$c%5$cextern _printf%1$c%5$cextern _fopen%1$c%5$cextern _fclose%1$c%5$cextern _strncpy%1$c%5$cextern _sprintf%1$c%5$cextern _system%1$c%5$cextern _access%1$c%5$cglobal _main%1$c_main:%1$c%5$center%5$c16, 0%1$c%5$c; check and decrement count%1$c%5$ccmp%5$c%5$cDWORD [count], 0%1$c%5$cjle%5$c%5$c_return%1$c%5$clea%5$c%5$crdi, [s5name]%1$c%5$cxor%5$c%5$crsi, rsi%1$c%5$ccall%5$c_access%1$c%5$ccmp%5$c%5$crax,0%1$c%5$cjne%5$c%5$c_no_dec%1$c%5$cdec%5$c%5$cDWORD [count]%1$c_no_dec:%1$c%5$c; change X in fname%1$c%5$cxor%5$c%5$crax, rax%1$c%5$cmov%5$c%5$cal, BYTE [count]%1$c%5$cadd%5$c%5$cal, BYTE 48%1$c%5$cmov%5$c%5$cBYTE [fname + 6], al%1$c%5$c; open file%1$c%5$clea%5$c%5$crdi, [fname]%1$c%5$clea%5$c%5$crsi, [mode]%1$c%5$ccall%5$c_fopen%1$c%5$ccmp%5$c%5$crax, 0%1$c%5$cjle%5$c%5$c_return_error%1$c%5$cmov%5$c%5$c[rsp + 16], rax%1$c%5$c; fprintf%1$c%5$cmov%5$c%5$crdi, rax%1$c%5$clea%5$c%5$crsi, [str]%1$c%5$cmov%5$c%5$crdx, 10%1$c%5$cmov%5$c%5$crcx, 34%1$c%5$clea%5$c%5$cr8, [str]%1$c%5$cxor%5$c%5$cr9, r9%1$c%5$cmov%5$c%5$cr9b, BYTE [count]%1$c%5$cmov%5$c%5$cQWORD [rsp + 8], QWORD 37%1$c%5$cmov%5$c%5$cQWORD [rsp], QWORD 9%1$c%5$cxor%5$c%5$crax, rax%1$c%5$ccall%5$c_fprintf%1$c%5$cmov%5$c%5$crdi, [rsp + 16]%1$c%5$ccall%5$c_fclose%1$c%5$c; strncpy%1$c%5$clea%5$c%5$crdi, [output]%1$c%5$clea%5$c%5$crsi, [fname]%1$c%5$cmov%5$c%5$crdx, 7%1$c%5$ccall%5$c_strncpy%1$c%5$c; sprintf%1$c%5$clea%5$c%5$crdi, [buff]%1$c%5$ccmp%5$c%5$cDWORD [count + 1], 0%1$c%5$cjne%5$c%5$c_fmt0%1$c_fmt1:%1$c%5$clea%5$c%5$crsi, [sysfmt1]%1$c%5$cjmp%5$c%5$c_next%1$c_fmt0:%1$c%5$clea%5$c%5$crsi, [sysfmt0]%1$c_next:%1$c%5$clea%5$c%5$crdx, [fname]%1$c%5$clea%5$c%5$crcx, [output]%1$c%5$cxor%5$c%5$crax, rax%1$c%5$ccall %5$c_sprintf%1$c%5$c; system%1$c%5$clea%5$c%5$crdi, [buff]%1$c%5$ccall%5$c_system%1$c_return:%1$c%5$cxor rax, rax%1$c%5$cleave%1$c%5$cret%1$c_return_error:%1$c%5$cmov rax, 1%1$c%5$cleave%1$c%5$cret%1$c%1$c",0
section .bss
section .text
	default rel
	extern _fprintf
	extern _printf
	extern _fopen
	extern _fclose
	extern _strncpy
	extern _sprintf
	extern _system
	extern _access
	global _main
_main:
	enter	16, 0
	; check and decrement count
	cmp		DWORD [count], 0
	jle		_return
	lea		rdi, [s5name]
	xor		rsi, rsi
	call	_access
	cmp		rax,0
	jne		_no_dec
	dec		DWORD [count]
_no_dec:
	; change X in fname
	xor		rax, rax
	mov		al, BYTE [count]
	add		al, BYTE 48
	mov		BYTE [fname + 6], al
	; open file
	lea		rdi, [fname]
	lea		rsi, [mode]
	call	_fopen
	cmp		rax, 0
	jle		_return_error
	mov		[rsp + 16], rax
	; fprintf
	mov		rdi, rax
	lea		rsi, [str]
	mov		rdx, 10
	mov		rcx, 34
	lea		r8, [str]
	xor		r9, r9
	mov		r9b, BYTE [count]
	mov		QWORD [rsp + 8], QWORD 37
	mov		QWORD [rsp], QWORD 9
	xor		rax, rax
	call	_fprintf
	mov		rdi, [rsp + 16]
	call	_fclose
	; strncpy
	lea		rdi, [output]
	lea		rsi, [fname]
	mov		rdx, 7
	call	_strncpy
	; sprintf
	lea		rdi, [buff]
	cmp		DWORD [count + 1], 0
	jne		_fmt0
_fmt1:
	lea		rsi, [sysfmt1]
	jmp		_next
_fmt0:
	lea		rsi, [sysfmt0]
_next:
	lea		rdx, [fname]
	lea		rcx, [output]
	xor		rax, rax
	call 	_sprintf
	; system
	lea		rdi, [buff]
	call	_system
_return:
	xor rax, rax
	leave
	ret
_return_error:
	mov rax, 1
	leave
	ret

