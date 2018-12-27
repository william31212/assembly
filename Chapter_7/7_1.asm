.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
ArraySize = 3
array byte 1,2,3

.code
main proc
	mov eax,0
	mov ebx,0

	mov al,200
	mov bl,100
	mul bl






	call writeint
	
    exit

main endp
end main