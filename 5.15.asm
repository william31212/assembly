.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	mov esp,0019FF84h
	push ax
	push bx
	push cx
	call dumpregs
    exit

main endp
end main