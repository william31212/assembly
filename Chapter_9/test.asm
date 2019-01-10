.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

fuck byte "1234565",0
.code
main proc
	
	call dumpregs
	push ebp
	call dumpregs
	mov ebp,esp
	sub esp,4
	call dumpregs

    exit

main endp
end main