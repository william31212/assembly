.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
TAB = 9

.code
main proc
	
	call Randomize
	call Rand1
	call Rand2

    exit

main endp
;------------------
Rand1 proc
	mov ecx,10
L1:
	call Random32
	call writedec
	mov al,TAB
	call WriteChar
loop L1
call Crlf
ret
Rand1 endp
;--------------------
Rand2 proc
	mov ecx,10
L1:
	mov eax,97
	call RandomRange
	; call writechar
	call writeint
	mov al,TAB
	call WriteChar
Loop L1
	call Crlf
	ret
Rand2 endp

end main