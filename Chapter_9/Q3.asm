.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib



.data

vowels BYTE 0
consonants BYTE 0
digits BYTE 0
spaces BYTE 0

input BYTE "Enter a line of string:",0dh,0ah,0
is_vowel BYTE "Vowels: ",0
is_consonants BYTE "Consonants: ",0
is_digits BYTE "Digits: ",0
is_white BYTE "White spaces: ",0

stringg BYTE ?





.code
main proc
	
	mov edx,offset input
	call writestring


	mov ecx,1000
	mov edx,offset stringg
	call readstring

	mov ecx,eax

	mov esi,offset stringg

	L1:
		lodsb
		
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


		cmp al,47; > 48
		jg isbig0 

		isalpht:

		cmp al,65; > 65
		jg is_A

		issmall:
		
		cmp al,97; > 97
		jg isa


		cmp al,32
		jz block

		jmp continue


		isbig0: 
			cmp al,58 ; < 57
			jl isdigits
			jmp isalpht

		isvo:
			add vowels,1
			add consonants,1
			jmp continue



		isdigits:
			add digits,1
			jmp continue


		is_A:
			cmp al,90
			jg issmall
			add consonants,1
			jmp continue


		isa:
			cmp al,122
			jg continue
			add consonants,1
			jmp continue

		block:
			add spaces,1

		continue:
			

	loop L1


	mov edx,offset is_vowel
	call writestring
	mov al,vowels
	call writeint
	call crlf


	mov edx,offset is_consonants
	call writestring
	mov al,consonants
	call writeint
	call crlf


	mov edx,offset is_digits
	call writestring
	mov al,digits
	call writeint
	call crlf


	mov edx,offset is_white
	call writestring
	mov al,spaces
	call writeint
	call crlf




    exit

main endp
end main