.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


String1 BYTE ?
input BYTE "Enter a string: ",0ah,0dh,0
find BYTE "Enter a character to find the frequency: ",0ah,0dh,0
frequ BYTE "Frequency of ",0
isequ BYTE " = ",0


char BYTE 0

.code
main proc

	mov edx,offset input
	call writestring

	mov ecx,1000
	mov edx,offset String1
	call readstring


	mov ebx,eax

	

	mov edx,offset find
	call writestring


	call readchar
	mov char,al
	call writechar
	call crlf	

	mov ecx,ebx
	
	mov eax,0
	mov ebx,0

	mov esi,offset String1

	L1:
		lodsb
		; call writeint

		cmp al,char
		jnz skip
		add ebx,1
		
		skip:

	loop L1

	mov edx,offset frequ
	call writestring

	mov al,char
	call writechar

	mov edx,offset isequ
	call writestring

	mov eax,ebx
	call writedec
	
	exit
	

main endp
end main