.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte ?
vowel byte "AEIOUaeiou"


.code
main proc
	
	mov edx,offset str1
	call readstring

	invoke str_search,addr str1

    exit

main endp

str_search proc



str_search endp


end main