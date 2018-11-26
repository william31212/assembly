.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

input BYTE "how many 4 do you want to show: ",0dh, 0ah, 0
.code
main proc
	
	mov edx,OFFSET input
	call WriteString
	call ReadInt

	mov ecx, eax
	mov eax, 0
	
	lp:
		add eax,4
		call WriteInt
		call CRLF
	loop lp
	

    exit

main endp
end main