.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	mov eax,0
	push 10
	push 20
	call Ex2Sub
	pop eax
	call dumpregs
    exit

main endp

Ex2Sub proc
	pop eax
	ret
Ex2Sub endp


end main