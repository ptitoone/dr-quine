section .data
	s5name: db	"Sully_5.s",0
	fname: db	"Sully_X.s",0
	count: dd	5
	mode: db	"w",0
	sysfmt0: db	"nasm %1$s -f elf64 -o %2$s.o && gcc %2$s.o -o %2$s && rm -f %2$s.o && ./%2$s",0
	sysfmt1: db	"nasm %1$s -f elf64 -o %2$s.o && gcc %2$s.o -o %2$s && rm -f %2$s.o",0
	buff: times 100 db 0
	output: times 8 db 0
	str: db		"section .data%1$c%5$cs5name: db%5$c%2$cSully_5.s%2$c,0%1$c%5$cfname: db%5$c%2$cSully_X.s%2$c,0%1$c%5$ccount: dd%5$c%4$d%1$c%5$cmode: db%5$c%2$cw%2$c,0%1$c%5$csysfmt0: db%5$c%2$cnasm %6$c1$s -f elf64 -o %6$c2$s.o && gcc %6$c2$s.o -o %6$c2$s && rm -f %6$c2$s.o && ./%6$c2$s%2$c,0%1$c%5$csysfmt1: db%5$c%2$cnasm %6$c1$s -f elf64 -o %6$c2$s.o && gcc %6$c2$s.o -o %6$c2$s && rm -f %6$c2$s.o%2$c,0%1$c%5$cbuff: times 100 db 0%1$c%5$coutput: times 8 db 0%1$c%5$cstr: db%5$c%5$c%2$c%3$s%2$c,0%1$csection .bss%1$csection .text%1$c%5$cextern fprintf%1$c%5$cextern printf%1$c%5$cextern fopen%1$c%5$cextern fclose%1$c%5$cextern strncpy%1$c%5$cextern sprintf%1$c%5$cextern system%1$c%5$cextern access%1$c%5$cglobal main%1$cmain:%1$c%5$center%5$c16, 0%1$c%5$c; check and decrement count%1$c%5$ccmp%5$c%5$cDWORD [count], 0%1$c%5$cjle%5$c%5$creturn%1$c%5$cmov%5$c%5$crdi, s5name%1$c%5$cxor%5$c%5$crsi, rsi%1$c%5$ccall%5$c%5$caccess%1$c%5$ccmp%5$c%5$crax, 0%1$c%5$cjne%5$c%5$cno_dec%1$c%5$cdec%5$c%5$cDWORD [count]%1$cno_dec:%1$c%5$c; change X in fname%1$c%5$cxor%5$c%5$crax, rax%1$c%5$cmov%5$c%5$cal, BYTE [count]%1$c%5$cadd%5$c%5$cal, BYTE 48%1$c%5$cmov%5$c%5$cBYTE [fname + 6], al%1$c%5$c; open file%1$c%5$cmov%5$c%5$crdi, fname%1$c%5$cmov%5$c%5$crsi, mode%1$c%5$ccall%5$cfopen%1$c%5$ccmp%5$c%5$crax, 0%1$c%5$cjle%5$c%5$creturn_error%1$c%5$cmov%5$c%5$c[rsp + 16], rax%1$c%5$c; fprintf%1$c%5$cmov%5$c%5$crdi, rax%1$c%5$cmov%5$c%5$crsi, str%1$c%5$cmov%5$c%5$crdx, 10%1$c%5$cmov%5$c%5$crcx, 34%1$c%5$cmov%5$c%5$cr8, str%1$c%5$cxor%5$c%5$cr9, r9%1$c%5$cmov%5$c%5$cr9b, BYTE [count]%1$c%5$cmov%5$c%5$cQWORD [rsp + 8], QWORD 37%1$c%5$cmov%5$c%5$cQWORD [rsp], QWORD 9%1$c%5$cxor%5$c%5$crax, rax%1$c%5$ccall%5$cfprintf%1$c%5$cmov%5$c%5$crdi, [rsp + 16]%1$c%5$ccall%5$cfclose%1$c%5$c; strncpy%1$c%5$cmov%5$c%5$crdi, output%1$c%5$cmov%5$c%5$crsi, fname%1$c%5$cmov%5$c%5$crdx, 7%1$c%5$ccall%5$cstrncpy%1$c%5$c; sprintf%1$c%5$cmov%5$c%5$crdi, buff%1$c%5$ccmp%5$c%5$cDWORD [count + 1], 0%1$c%5$cjne%5$c%5$cfmt0%1$cfmt1:%1$c%5$cmov%5$c%5$crsi, sysfmt1%1$c%5$cjmp%5$c%5$cnext%1$cfmt0:%1$c%5$cmov%5$c%5$crsi, sysfmt0%1$cnext:%1$c%5$cmov%5$c%5$crdx, fname%1$c%5$cmov%5$c%5$crcx, output%1$c%5$cxor%5$c%5$crax, rax%1$c%5$ccall %5$csprintf%1$c%5$c; system%1$c%5$cmov%5$c%5$crdi, buff%1$c%5$ccall%5$csystem%1$creturn:%1$c%5$cxor rax, rax%1$c%5$cleave%1$c%5$cret%1$creturn_error:%1$c%5$cmov rax, 1%1$c%5$cleave%1$c%5$cret%1$c%1$c",0
section .bss
section .text
	extern fprintf
	extern printf
	extern fopen
	extern fclose
	extern strncpy
	extern sprintf
	extern system
	extern access
	global main
main:
	enter	16, 0
	; check and decrement count
	cmp		DWORD [count], 0
	jle		return
	mov		rdi, s5name
	xor		rsi, rsi
	call		access
	cmp		rax, 0
	jne		no_dec
	dec		DWORD [count]
no_dec:
	; change X in fname
	xor		rax, rax
	mov		al, BYTE [count]
	add		al, BYTE 48
	mov		BYTE [fname + 6], al
	; open file
	mov		rdi, fname
	mov		rsi, mode
	call	fopen
	cmp		rax, 0
	jle		return_error
	mov		[rsp + 16], rax
	; fprintf
	mov		rdi, rax
	mov		rsi, str
	mov		rdx, 10
	mov		rcx, 34
	mov		r8, str
	xor		r9, r9
	mov		r9b, BYTE [count]
	mov		QWORD [rsp + 8], QWORD 37
	mov		QWORD [rsp], QWORD 9
	xor		rax, rax
	call	fprintf
	mov		rdi, [rsp + 16]
	call	fclose
	; strncpy
	mov		rdi, output
	mov		rsi, fname
	mov		rdx, 7
	call	strncpy
	; sprintf
	mov		rdi, buff
	cmp		DWORD [count + 1], 0
	jne		fmt0
fmt1:
	mov		rsi, sysfmt1
	jmp		next
fmt0:
	mov		rsi, sysfmt0
next:
	mov		rdx, fname
	mov		rcx, output
	xor		rax, rax
	call 	sprintf
	; system
	mov		rdi, buff
	call	system
return:
	xor rax, rax
	leave
	ret
return_error:
	mov rax, 1
	leave
	ret

