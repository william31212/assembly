.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

String BYTE ?

MSG1 BYTE "input your String:",0dh,0ah,0
ouputstring BYTE ?

.code
main proc
	
	mov edx,offset MSG1
	call writestring


	mov ecx,150
	mov edx,offset String
	call readString


	mov esi,offset String

	mov edi,1

	L1:
		lodsb


		cmp al,64
		jg isupper
		cmp al,96
		jg islower
		jmp conti


		isupper:
			cmp al,91
			jl is_A
			jmp conti

		islower:
			cmp al,123
			jl is_aa
			jmp conti

		is_A:
			mov ouputstring[edi],al
			inc edi
			jmp conti

		is_aa:
			mov ouputstring[edi],al
			inc edi
			jmp conti





		conti:
		

	loop L1



	mov edx,offset ouputstring
	call writestring
	call crlf
	
    exit

main endp
end main