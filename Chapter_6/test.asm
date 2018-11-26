.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
array BYTE 12h,34h,56h,78h
is_equ BYTE "equal",0dh,0ah,0
is_lower BYTE "ax<bx",0dh,0ah,0
is_bigger BYTE "ax>bx",0dh,0ah,0
.code
main proc
	mov eax,0
	mov ebx,0
	mov ax,5
	mov bx,6
	cmp ax,bx
	call dumpregs

	jnb L1


	mov edx,OFFSET is_lower
	call writestring

	exit

	L1:
		mov edx,OFFSET is_bigger
		call writestring


    exit

main endp
end main