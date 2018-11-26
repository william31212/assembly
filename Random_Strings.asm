.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

STR_COUNT = 20
STR_SIZE = 10
TAB = 9

.data
aString BYTE STR_SIZE DUP(0), 0

.code
main proc
	
	mov ecx, STR_COUNT
	call randomize
	L1:
		mov eax,STR_SIZE
		mov esi,0
		call CreateRandomString

		mov edx,OFFSET aString
		call WriteString
		mov al,TAB
		call writechar 
	loop L1
    exit

main endp
	
CreateRandomString PROC
	push ecx
	mov ecx,eax
	L2:
		mov eax,26
		call RandomRange
		add eax,'A'
		mov aString[esi],al
		inc esi
	loop L2

	pop ecx
	ret

CreateRandomString ENDP

end main