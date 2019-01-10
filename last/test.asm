.386
Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
testStr BYTE "Johnson,Calvin,goes,to sleep,by,tonight",0

.code

str_nextWord proto,
	pString:PTR BYTE,
	delimiter:BYTE

main PROC

	call Clrscr
	mov edx,OFFSET testStr 
	call WriteString
	call Crlf
	mov esi, OFFSET testStr

	L1: 
		invoke str_nextword, esi, "," ; look for delimiter
		jnz Exit_prog ; quit if not found
		mov esi, eax ; point to next substring
		mov edx, eax
		call WriteString ; display remainder of string

		call Crlf
	jmp L1

	Exit_prog:
	exit
main ENDP


str_nextWord PROC,
	pString:PTR BYTE,
	delimiter:BYTE

	push esi
	mov al, delimiter
	mov esi, pString
	cld ; clear Direction flag (forward)
	
	L1:
		lodsb ; AL = [esi], inc(esi)
		cmp al,0 ; end of string?
		je L3 ; yes: exit with ZF = 0
		cmp al,delimiter ; delimiter found?
		jne L1 ; no: repeat loop
	L2:
		mov BYTE PTR [esi-1], 0 ; yes: insert null byte
		mov eax, esi ; point EAX to next character
		Jmp Exit_proc ; exit with ZF = 1
	L3:
		or al,1 ; clear Zero flag

	Exit_proc:
	pop esi

	ret
Str_nextWord ENDP



end main