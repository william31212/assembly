.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

msg BYTE "input:" ,0dh,0ah,0
msg2 BYTE "output:" ,0dh,0ah,0
bigEndian WORD 1234h,5678h
count EQU (lengthof bigEndian)
littleEndian DWORD ?

.code
main proc
	
	mov edx,OFFSET msg
	call WriteString
	call crlf
	mov eax,0
	mov ecx,count
	mov esi,0
	input:
		mov ax,bigEndian[esi]
		call writehex
		call crlf
		add esi,2
	loop input


	mov eax,0
	mov ecx,count
	mov edi,2
	mov esi,0

	LP:
		mov ax,bigEndian[esi]
		mov WORD PTR littleEndian[edi] , ax
		add esi,2
		sub edi,2
	loop LP
	
	mov edx,OFFSET msg2
	call WriteString

	mov eax,0
	mov ecx,count
	mov esi,0
	output:
		mov ax,WORD PTR littleEndian[esi]
		add esi,2
		call crlf	
		call writehex
	loop output

	INVOKE ExitProcess,0


	

main endp
end main