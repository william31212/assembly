.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

array BYTE "FUCK"


.code
main proc
	mov ecx, LENGTHOF array
	mov esi,0

	L1:
		or array[esi],00100000b;upper->lower
		and array[esi],11011111b;lower->upper
		inc esi
	loop L1
	
	mov eax,0

	mov ecx, LENGTHOF array
	mov esi,0

	L2:
		mov al,array[esi]	
		call writechar
		inc esi
	loop L2

	

    exit

main endp
end main