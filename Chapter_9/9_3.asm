.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

target BYTE "abcxxxxxxxxxxdefghijklmop",0

.code

str_remove proto,
pString:ptr byte,
len: dword

main proc
	invoke str_remove,addr [target+3],9;postion,delete4

	mov edx,offset target
	call writestring
	call crlf
	
	; invoke str_remove,addr [target+2],19


    exit

main endp

str_remove proc uses eax edx esi edi,
	pString:PTR BYTE,
	len: dword

	invoke str_length,pString;get->第三個位置到尾端有幾個字
	mov ecx,eax

	.if ecx >= len;全部長度 - 要刪掉的長度
		sub ecx,len
	.endif

	mov esi,pString;指向要刪掉的開頭
	add esi,len;加長度
	mov edi,pString;直接重疊過去

	;使用遞增
	cld

	rep movsb

	mov byte ptr [edi],0

	ret


str_remove endp


end main