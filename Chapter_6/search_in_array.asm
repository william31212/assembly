.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

intArray SWORD 0,0,0,0,1,20,35,-12,66,4,0
NOTFOUND BYTE "404",0
len DWORD ?
.code
main proc
	
	mov esi,0
	mov ecx,lengthof intArray
	
	mov len,ecx

	L1:
		cmp intArray[esi],4
		jz found
		add esi,2
	loop L1
	jmp none

	found:
		mov eax,0
		call dumpregs
		sub len,ecx
		mov eax,len
		add eax,1
		call writeint
		jmp quit
	
	none:
		mov edx,OFFSET NOTFOUND
		call writestring
	
	quit:
		call crlf
		exit	


main endp
end main