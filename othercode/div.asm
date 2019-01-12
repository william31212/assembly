.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	mov eax,0
	mov edx,0
	mov ax,8311h
	mov bx,02h
	div bx
	call dumpregs
	call crlf

    exit

main endp
end main