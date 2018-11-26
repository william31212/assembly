.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
msg BYTE "input is:",0dh,0ah,0
msg2 BYTE "output is:",0dh,0ah,0
array BYTE 11,22,33,44,55,66,77,88,99,87
array2 BYTE 10 DUP(0)
array_size EQU (lengthof array)
array2_size EQU (lengthof array2)
.code
main proc
	
	mov eax,0
	mov ecx,0
	mov ax,array2_size
	mov cl,2
	div cl
	mov ecx,eax


	
	mov edx,OFFSET msg
	call writestring
	call crlf

	mov ecx,array_size

	mov esi,0
	input:
		mov eax,0
		mov al,array[esi]
		call writedec
		call crlf	
		add esi,1
	loop input


	mov ecx,array2_size
	mov eax,0
	mov ecx,0
	mov ax,array2_size
	mov cl,2
	div cl
	mov ecx,eax

;---------------------------
	mov esi,0
	mov edi,0
	
	LP:
		mov al,array[esi+1]
		mov array2[edi],al
		add edi,1
		mov al,array[esi]
		mov array2[edi],al
		add esi,2
		add edi,1
	loop LP
;--------------------------
	mov edx,OFFSET msg2
	call writestring
	call crlf

	mov ecx,array2_size

	mov edi,0
	output:
		mov eax,0
		mov al,array2[edi]
		call writedec
		call crlf	
		add edi,1
	loop output

    exit

main endp
end main