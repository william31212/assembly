.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
; Upper and Lower Limits of Grade Average and Credits
LGrdAvg = 1
UGrdAvg = 400
LCredit = 1
UCredit = 30
; Inputs of Grade Average and Credits
gradeAverage	DWORD 375;?
credits			DWORD 28;?

; Prompts
pGrdAvg			BYTE "Input the students grade average (1-400): ",0dh,0ah,0
pCredit			BYTE "Input the students total credits (1-30): ",0dh,0ah,0
pGrdAvgHigh		BYTE "The grade average is over the upper limit of 400.",0dh,0ah,0
pGrdAvgLow		BYTE "The grade average is below the lower limit of 1.",0dh,0ah,0
pCreditHigh		BYTE "The credit total is over the upper limit of 30.",0dh,0ah,0
pCreditLow		BYTE "The credit total is below the lower limit of 1.",0dh,0ah,0
pOkToRegister	BYTE "The student can register.",0dh,0ah,0
pNotOkToRegister	BYTE "The student cannot register.",0dh,0ah,0

; row position tracking
newY BYTE 0

.code
main PROC

	mov edx,OFFSET pGrdAvg
	call WriteString
	call ReadInt

	cmp eax,UGrdAvg
	jg bigger400

	cmp eax,LGrdAvg
	jl smaller1


	mov edx,OFFSET pCredit
	call WriteString
	call ReadInt

	cmp eax,UCredit
	jg bigger30

	cmp eax,LCredit
	jl smaller1_2


	mov edx,OFFSET pOkToRegister
	call writestring
	jmp quit

bigger400:
	mov edx,OFFSET pGrdAvgHigh
	call WriteString
	call crlf
	mov edx,OFFSET pNotOkToRegister
	call WriteString
	jmp quit

smaller1:
	mov edx,OFFSET pGrdAvgLow
	call WriteString
	call crlf
	mov edx,OFFSET pNotOkToRegister
	call WriteString
	jmp quit


bigger30:
	mov edx,OFFSET pCreditHigh
	call WriteString
	call crlf
	mov edx,OFFSET pNotOkToRegister
	call WriteString
	jmp quit

smaller1_2:
	mov edx,OFFSET pCreditLow
	call WriteString
	call crlf
	mov edx,OFFSET pNotOkToRegister
	call WriteString
	jmp quit

	
quit:
	exit

main ENDP

END main