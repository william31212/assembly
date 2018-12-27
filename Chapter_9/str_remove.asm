.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

target BYTE "abcxxxxdefghijklmop",0

.code

str_remove proto,
pString:ptr byte,
char: dword

main proc
	invoke str_remove,addr [target+3],4;postion,delete4

	mov edx,offset target
	call writestring
	call crlf
	
	; invoke str_remove,addr [target+2],19


    exit

main endp

str_remove proc uses eax edx esi edi,
	pString:PTR BYTE,
	char: dword

	invoke str_length,pString
	mov ecx,eax

	.if char <= ecx
		sub ecx,char
	.endif

	mov esi,pString
	add esi,char
	mov edi,pString

	cld

	rep movsb

	mov byte ptr [edi],0

	Exit_proc:
		ret


str_remove endp


end main