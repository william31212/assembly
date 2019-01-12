.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
firstarray DWORD 0,2,5,9,10,12,19,23,34 
count EQU (LENGTHOF firstarray)
resultarray dword count DUP(0)

.code
main proc
	

	mov edx,firstarray[(count-1) * 4]

	mov ecx,count-1
	mov esi,0
	LP:
		mov eax,firstarray[esi]
		mov resultarray[esi+4],eax
		add esi,4
	loop LP

	mov esi,0
	mov resultarray[esi],edx
	mov ecx,count


	LP_result:
		mov eax,resultarray[esi]
		call writedec
		add esi,4
		call CRLF

	loop LP_result
	

	

    exit

main endp
end main