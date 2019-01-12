.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

STR_COUNT = 10
STR_SIZE = 10
TAB = 9
.data
aString BYTE STR_SIZE DUP(0),0

.code
main proc
	
	mov ecx,STR_COUNT
	call randomize
	L1:

	mov eax,STR_SIZE
	mov esi,OFFSET aString
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

L1:
	mov eax,26
	call RandomRange
	add eax,'A'
	mov [esi],al
	inc esi
loop L1
	pop ecx
	ret
CreateRandomString endp

end main