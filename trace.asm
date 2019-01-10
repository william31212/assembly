.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
array SWORD 8,2,3,5,-4,6,0,4
arraybyte byte 1,2,3,4,5,6,0,8
.code
main proc
	mov esi,0
	mov ecx,LENGTHOF arraybyte
	call dumpregs
	L1: 
	mov ax,array[esi]
	call dumpregs
	cmp ax,0
	pushf
	add esi,TYPE array
	popf
	Loopne L1
	
	


    exit

main endp
end main