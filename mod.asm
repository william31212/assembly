.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
MSG1 BYTE "Enter two positve integers: "

.code
main proc
	
	mov edx,OFFSET MSG1
	call writestring

	mov eax, 5
	mov eax, 6
	call WriteInt

    exit

main endp
end main