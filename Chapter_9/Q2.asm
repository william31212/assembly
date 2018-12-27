.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

input BYTE "Enter an alphabet: ",0ah,0dh,0
isvowel BYTE " is a vowel.",0ah,0dh,0
isconst BYTE " is a consonant.",0ah,0dh,0

.code
main proc
	
	mov edx,offset input
	call writestring

	call readchar
	call writechar
	call crlf

	cmp al,65
	jz isvo

	cmp al,69
	jz isvo

	cmp al,73
	jz isvo

	cmp al,79
	jz isvo

	cmp al,85
	jz isvo
	;------------
	cmp al,97
	jz isvo

	cmp al,101
	jz isvo

	cmp al,105
	jz isvo

	cmp al,111
	jz isvo

	cmp al,117
	jz isvo

	call writechar
	mov edx,offset isconst
	call writestring
	jmp quit


	isvo:

		call writechar
		mov edx,offset isvowel
		call writestring
		

	quit:
    	exit

main endp
end main