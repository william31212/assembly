.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

SetX = 1000000000000000000000000000111b
SetY = 1000001010100000000011101100011b

.code
main proc
	
	mov eax,SetX;SetX
	or eax,SetY;UNION

	call writebin

    exit

main endp
end main