.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main proc
	
	;cf = 1
	;cf is positive number to minus number 
	mov eax, 0
	add eax, 7
	sub eax, 8
	call dumpregs

	;sf = 1
	; the number is minus
	mov eax, 0
	add eax, -3
	call dumpregs

	;zf = 1
	;the number is zero,but need calculate
	mov eax,3
	sub eax,3 
	call dumpregs

	;of = 1
	;the (postive or minus) number overflow
	mov eax,2147483648
	add eax,2147483648
	call dumpregs


	;af = 1
	; the fourth bit is carry or borrow
	mov eax,1000b
	add eax,1000b
	call dumpregs


  	;pf = 1
  	;odd 1's => 0 / even 1's => 1
  	mov eax,1b
  	add eax,10b
  	call dumpregs

  	exit
main endp
end main