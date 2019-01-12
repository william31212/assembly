.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte 1000 DUP(0)
semicoma byte " : ",0
ascii byte 128 DUP(0)
cal proto,
	str123:ptr byte

.code
main proc

	mov ecx,1000
	mov edx,offset str1
	call readstring
	
	invoke cal,addr str1

	mov ecx,128
	mov ebx,0

	mov esi,0

	L1:
		.if(ascii[esi] > 0)
			mov al,bl
			call writechar
			mov edx,offset semicoma
			call writestring
			mov al,ascii[esi]
			call writedec
			call crlf
		.endif
		inc esi
		inc ebx
	loop L1

    exit

main endp


cal proc,
	str123:ptr byte

	invoke str_length,str123
	mov ecx,eax
	mov esi,0

	L2:
		mov ebx,0
		mov edi,0
		mov bl,str1[esi]
		add edi,ebx
		add ascii[edi],1
		inc esi
	loop L2

	ret
cal endp

end main