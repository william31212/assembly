.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

array SWORD 8,2,3,5,-4,6,0,4
.code
main proc
	

		mov cx,1
		mov esi,2
		mov ax,array[esi]
		call dumpregs
		mov bx,array[esi+4]
		call dumpregs
		cmp ax,3
		jae L2
		cmp bx,4
		jb L1
		jmp L3
		L1: mov cx,4
		L2: mov dx,5
		jmp L4
		L3: mov dx,6
		L4:
			call dumpregs
		    exit

main endp
end main