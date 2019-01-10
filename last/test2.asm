.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

testStr BYTE "Johnson,Calvin,goes,to sleep,by,tonight",0

.code
str_nextWord proto,
	pString:ptr byte,
	delimiter:byte


main proc
	
	call clrscr
	mov edx,offset testStr
	call writestring
	call crlf
	mov esi,offset testStr
	mov ebx,0


	L1:
		invoke str_nextWord, esi,","
		cmp bl,1
		je bye
		mov esi, eax
		mov edx, eax
		call writestring
		call crlf

	jmp L1

	bye:
    	exit

main endp

str_nextWord proc,
	pString:ptr byte,
	delimiter:byte

	
	mov al,delimiter
	mov esi,pString
	cld
	L1:
		lodsb
		cmp al,0
		je L3
		cmp al,delimiter
		je L2
		jmp L1

	L2:
		mov byte ptr [esi-1], 0
		mov eax,esi
		jmp exit_proc

	L3:
		mov bl,1

	exit_proc:
		
		ret
str_nextWord endp

end main