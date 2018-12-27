.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

endlessstr BYTE "recursion end", 0
str1 BYTE "pass retrunfact",0dh,0ah,0
str2 BYTE "pass last",0dh,0ah,0
.code
main proc
	
	push 3
	call Fac
	call writedec
	call crlf

    exit

main endp

Fac proc
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]
;
; n			 <-   ebp + 8
; ret adress <-   ebp + 4
; esp ebp    <-   ebp + 0

	cmp eax,0
	ja build
	mov eax,1
	jmp last


	build:
		dec eax
		push eax
		call Fac

	retrunfact:
		mov ebx,[ebp+8]
		mov edx,offset str1
		call writestring
		mul ebx
		

	last:
		mov edx,offset str2
		call writestring
		pop ebp
		call dumpregs
		ret 4

Fac endp



end main