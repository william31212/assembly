.386


Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
char byte ?
.code
main PROC
	
	; mov edx,	offset input
	; mov ecx,	lengthof input
	; call readstring
	; mov input_length,eax ; enter string

	; mov edx,	offset input
	; call writestring

	mov eax,0
	call dumpregs
	call Readchar
	call dumpregs


	mov char,al


	call writeint
	exit

main endp
end main