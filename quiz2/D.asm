.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte 1000 DUP(0)
input byte "Enter a String: ",0dh,0ah,0
output byte "Output String: ",0dh,0ah,0
len DWORD 0
str2 byte 1000 DUP(0)



remove proto,
	str123: ptr byte


.code
main proc
	
	mov ecx,150
	mov edx,offset input
	call writestring

	mov edx,offset str1
	call readstring 

	mov len,eax

	invoke remove,addr str1

	mov edx,offset output
	call writestring

	mov edx,offset str2
	call writestring

    exit

main endp


remove proc,
	str123: ptr byte

	mov esi,str123
	mov edi,offset str2

	mov ecx,len
	
	L1:
		mov bl,[esi]
		.if (bl >= 'a') && (bl <= 'z') || (bl >= 'A') && (bl <= 'Z')
			mov [edi],bl
			inc edi
		.endif
		inc esi
	loop L1

	mov bl,0
	mov [edi],bl

	ret

remove endp



end main