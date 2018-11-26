.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

pin_length = 5 ; maximum buffer size

.data 
	inputMSG BYTE "Enter the PIN",0dh,0ah,0
	validStr BYTE "PIN is valid.",0dh,0ah,0					
	notValidStr BYTE "PIN is not valid.",0dh,0ah,0
	numbersOnlyStr BYTE "Numbers only! Try again... ",0dh,0ah,0

	endMsg BYTE "Press any key to continue or 1 to exit... ",0dh,0ah,0		; message to continue	
	pin BYTE 5 dup(?)												; holds the 5 digi pin
	
	llimit BYTE '5','2','4','1','3'
	hlimit BYTE '9','5','8','4','6'

.code 
main PROC 
	
	doAgain:										
		mov esi,0	
		mov ecx,pin_length						
		call getPin								
		call Crlf

		mov esi,0	
		mov ecx,pin_length				
		call validatePin						
		call Crlf

		mov edx,offset endMsg				
		call WriteString
		call Crlf


		call readChar							
		cmp al, '1'									
		je ending
		jmp doAgain	

	ending:
		exit



main ENDP 


getPin proc USES edx ebx ecx
	
	again:
	mov esi,0
	mov ecx,pin_length
	mov edx,offset inputMSG
	call WriteString
	
	L1:
		call readchar
		call writechar
		cmp al,'0'
		jl numberonly
		cmp al,'9'
		jg numberonly
		mov pin[esi],al
		add esi,1
	loop L1


	ret

	numberonly:
		mov edx,offset numbersOnlyStr
		call writestring
		jmp again


getPin endp


validatePin proc USES edx ebx ecx
	
	L2:
		mov al,pin[esi]
		cmp al,llimit[esi]
		jl notvaild
		cmp al,hlimit[esi]
		jg notvaild
		add esi,1
	loop L2


	mov edx,offset validStr
	call writestring
	jmp final

	notvaild:
		mov edx,offset notValidStr
		call writestring

	final:	
		ret

validatePin ENDP 


END main
