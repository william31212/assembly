.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

str1 byte 1000 DUP(0)
input byte "Enter a string: ",0dh,0ah,0
input2 byte "Enter a character to find the frequency:",0dh,0ah,0
output1 byte "Frequency of ",0
output2 byte " = ",0
len dword ?
ans dword 0
char byte ?
str_find proto,
	stringg:ptr byte,
	achar:byte

.code
main proc
	
	mov edx,offset input
	call writestring
	mov ecx,1000
	lea edx,[str1]		
	call readString
	mov len,eax
	mov edx,offset input2
	call writestring
	mov eax,0
	call readchar
	call dumpregs
	mov char,al


	mov ans,0
	invoke str_find,addr str1,char

	mov edx,offset output1
	call writestring
	mov al,char
	call writechar
	mov edx,offset output2
	call writestring


	mov eax,ans
	call writedec

    exit
main endp

str_find proc,
	stringg: ptr byte,
	achar: byte


	mov ecx,len
	mov esi,stringg
	mov bl,achar

	L1:
		mov al,byte ptr[esi]
		cmp byte ptr[esi],bl
		je thesame
		jmp conti

		thesame:
			add ans,1
			jmp conti

		conti:
		inc esi

	loop L1

	ret

str_find endp

end main