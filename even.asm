.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	mov ecx, 100
	mov eax, 0
	call WriteInt
	call CRLF
	
	LP:
	add eax, 2
	call WriteInt
	call CRLF

	loop LP

	

    exit

main endp
end main