.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

target byte "123555jhjhkjhkjkhjhABCC342432",0
source byte "ABC",0
pos DWORD ?
stop DWORD ?
lensrc DWORD ?
lentar DWORD ?

str2 byte "the position is ",0
str3 byte "can't find this string",0ah,0dh,0


str_find proto,
src: ptr byte,
tar: ptr byte


.code
main proc
	
	mov eax,0
	invoke str_find, addr [source], addr [target] 

	cmp eax,0
	js no


	mov pos,eax
	inc eax
	
	mov edx,offset str2
	call writestring

	call writedec
	exit

	no:
		mov edx,offset str3
		call writestring
		exit

main endp

str_find proc,
	src: ptr byte,
	tar: ptr byte

	invoke str_length,tar
	mov lentar,eax
	invoke str_length,src
	mov lensrc,eax

	lea edi,[target]
	lea esi,[source]

	mov eax,edi
	add eax,lentar
	sub eax,lensrc
	inc eax

	mov stop,eax

	cld

	mov ecx,lensrc

	L1:
		pushad
		repe cmpsb
		popad

		je found
		inc edi
		cmp edi,stop
		jae notfound
		jmp L1


	notfound:
		mov eax,-1
		ret

	found:
		mov eax,edi
		sub eax,tar
		ret


str_find endp


end main