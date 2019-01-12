.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
str1 BYTE "The original array as it is given:",0dh,0ah,0
str2 BYTE "After exchanging the result is as follows:",0dh,0ah,0
firstarray DWORD 21,32,45,64,76,87,56,23,34,77
count EQU (LENGTHOF firstarray)
resultarray DWORD count DUP(0)

.code
main proc
	
	mov esi,0
	mov ecx,5



	LP1:
		mov eax,firstarray[esi]
		mov resultarray[esi+4],eax;
		mov eax,firstarray[esi+4]
		mov resultarray[esi],eax
		add esi,8

	loop LP1

	mov esi,0
	mov ecx,count

	mov edx,OFFSET str1
	call WriteString

	LP_start:
		mov eax,firstarray[esi]
		add esi,4
		call WriteDec
		call CRLF
	loop LP_start

	mov esi,0
	mov ecx,count
	mov edx,OFFSET str2
	call WriteString

	LP_INVERSE:
		mov eax,resultarray[esi]
		add esi,4
		call WriteDec
		call CRLF
	loop LP_INVERSE
    exit

main endp
end main