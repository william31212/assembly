.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	mov eax, 5
	mov eax, 6
	call WriteInt

    exit

main endp
end main