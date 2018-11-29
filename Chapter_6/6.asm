.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
msgMenu BYTE "---- Boolean Calculator ----",0dh,0ah
		BYTE 0dh,0ah
		BYTE "1. x AND y"     ,0dh,0ah
		BYTE "2. x OR y"      ,0dh,0ah
		BYTE "3. NOT x"       ,0dh,0ah
		BYTE "4. x XOR y"     ,0dh,0ah
		BYTE "5. Exit program",0

msgAND BYTE "Boolean AND",0
msgOR  BYTE "Boolean OR",0
msgNOT BYTE "Boolean NOT",0
msgXOR BYTE "Boolean XOR",0

msgInteger1 BYTE "Enter the first 32-bit decimal integer:  ",0
msgInteger2 BYTE "Enter the second 32-bit decimal integer: ",0
msgResult   BYTE "The 32-bit decimal result is:            ",0



.code
main proc
	call Clrscr

Menu:
	mov edx,offset msgMenu
	call writestring
	call crlf
L1:
	call Readchar
	cmp al,'5'
	ja L1
	cmp al,'1'
	jb L1

	cmp al,'5'
	je quit
	call crlf
	call choose
	call crlf
	jmp Menu

quit:
	exit
;---------------------------------------------------------
main endp

choose proc

	cmp al,'4'
	je XOR_op
	cmp al,'3'
	je NOT_op
	cmp al,'2'
	je OR_op
	cmp al,'1'
	je AND_op


choose endp

XOR_op proc
	
	pushad

	mov edx, offset msgXOR
	call writestring
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first operand
	call writestring
	call ReadDec
	mov ebx,eax
	mov edx, OFFSET msgInteger2	; ask for first operand
	call writestring
	call ReadDec

	xor eax,ebx

	mov edx,offset msgResult
	call writestring
	call writedec
	call crlf

	popad
	ret

XOR_op endp


AND_op proc
	
	pushad

	mov edx, offset msgAND
	call writestring
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first operand
	call writestring
	call ReadDec
	mov edx, OFFSET msgInteger2	; ask for first operand
	call writestring
	mov ebx,eax
	call ReadDec

	and eax,ebx

	mov edx,offset msgResult
	call writestring
	call writedec
	call crlf

	popad
	ret

AND_op endp

OR_op proc
	
	pushad

	mov edx, offset msgOR
	call writestring
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first operand
	call writestring
	call ReadDec
	mov ebx,eax
	mov edx, OFFSET msgInteger2	; ask for first operand
	call writestring
	call ReadDec

	or eax,ebx

	mov edx, offset msgResult
	call writestring
	call writedec
	call crlf

	popad
	ret

OR_op endp

NOT_op proc
	
	pushad

	mov edx, offset msgNOT
	call writestring
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1	; ask for first operand
	call writestring
	call ReadDec

	not eax

	mov edx, offset msgResult
	call writestring
	call writedec
	call crlf

	popad
	ret

NOT_op endp


END main
