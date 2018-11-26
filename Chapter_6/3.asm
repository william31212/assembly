.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
array BYTE 10 DUP(0)
MSGA BYTE "You got A",0dh,0ah,0
MSGB BYTE "You got B",0dh,0ah,0
MSGC BYTE "You got C",0dh,0ah,0
MSGD BYTE "You got D",0dh,0ah,0
MSGF BYTE "You got F",0dh,0ah,0
.code
main proc
	
	mov ecx,10
	mov esi,0
	call Randomize

	L1:
		mov eax,0
		mov al,50
		call RandomRange
		add al,50
		mov array[esi],al
		inc esi
	loop L1

	mov ecx,10
	mov esi,0
	mov eax,0

	L2:
		mov al,array[esi]
		call writeint
		call crlf
		cmp array[esi],60
		jge up60
		mov edx,OFFSET MSGF
		call writestring
		jmp endthis

		up60:
			cmp array[esi],70
			jge up70
			mov edx,OFFSET MSGD
			call writestring
			jmp endthis

		up70:
			cmp array[esi],80
			jge up80
			mov edx,OFFSET MSGC
			call writestring
			jmp endthis

		up80:
			cmp array[esi],90
			jge up90
			mov edx,OFFSET MSGB
			call writestring
			jmp endthis

		up90:
			mov edx,OFFSET MSGA
			call writestring
			jmp endthis

		endthis:
			call crlf
			inc esi
	loop L2
	

    exit

main endp
end main