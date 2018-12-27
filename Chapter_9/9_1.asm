.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte '1234567890',0dh,0ah,0
str2 byte ?


.code

Str_CopyN proto,
		source:ptr byte,
		target:ptr byte,
		len:dword



main proc
	
	Invoke Str_CopyN,
			addr str1,
			addr str2,
			7


	mov edx,offset str2
	call writestring
	

    exit

main endp


Str_CopyN proc uses eax ecx esi edi,
	source:ptr byte,
	target:ptr byte,
	len:dword


	mov ecx,len

	mov esi, source
	mov edi, target

	cld
	; call dumpregs
	rep movsb
	
	mov byte ptr [edi],0
	
	ret 
	

Str_CopyN endp


end main