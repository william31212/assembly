.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

aName BYTE "Abraham Lincoln",0
nameSize = ($ - aName) - 1

.code
main proc
	
	mov ecx,nameSize
	mov esi,0

	L1: 
		movzx eax,aName[esi]
		push eax
		inc esi
	loop L1

	mov ecx,nameSize
	mov esi,0

	L2:
		pop eax
		mov aName[esi],al
		inc esi
	loop L2

	mov ecx,nameSize
	mov esi,0

	mov edx,OFFSET aName
	call writestring


    exit

main endp
end main