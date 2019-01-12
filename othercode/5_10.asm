.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
ODDARRAY DWORD 200 DUP(0)
Message1 BYTE "Please Enter an integer N1 and then N2: Now enter N1", 0dh, 0ah, 0
Message2 BYTE "Please Enter an integer N2", 0dh, 0ah, 0
Message3 BYTE  "The total amount of factorial between N1 to N2 that you input is as follows: ", 0dh, 0ah, 0
N1 DWORD ?
N2 DWORD ?
Total DWORD 1

.code
main proc
	
	mov edx, OFFSET Message1
	call writestring
	call readint
	call crlf
	mov N1,eax

	mov edx, OFFSET Message2
	call writestring
	call readint
	call crlf
	mov N2,eax

	mov eax,N2
	sub eax,N1
	mov ecx,eax
	inc ecx
	mov esi,0
	mov eax,N1

	L1:
		mov ODDARRAY[esi],eax
		inc eax
		add esi,4
	loop L1

	mov eax,N2
	sub eax,N1
	mov ecx,eax
	inc ecx
	mov esi,0
	mov eax,1

	L2:
		mov ebx,ODDARRAY[esi];拔esi來乘
		imul eax,ebx
		call writedec
		add Total,eax
		call crlf
		add esi,4
	Loop L2

	mov edx,OFFSET Message3
	call writestring
	call crlf
	mov eax,Total
	call writedec
	call crlf
    exit

main endp
end main