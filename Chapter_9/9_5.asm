.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

targets byte ",JohnsonCalvin",0
str_notfnd byte "NOT FOUND",0

Str_nextWord proto,
target: ptr byte,
char:byte

.code
main proc
	
	invoke Str_nextWord, addr targets, ','
	jnz notfound

	mov edx,offset targets
	call writestring
	exit
	notfound:
		mov edx,offset str_notfnd
		call writestring
    exit

main endp

Str_nextWord PROC,
	target:PTR BYTE, ; pointer to string
	char:BYTE ; char to find

		push esi
		mov al,char
		mov esi,offset targets

		cld ; clear Direction flag (forward)
		L1: 
			lodsb ; AL = [esi], inc(esi)
			cmp al,0 ; end of string?
			je L3 ; yes: exit with ZF = 0
			cmp al,char ; char found?
			jne L1 ; no: repeat loop
		L2: 
			mov BYTE PTR [esi-1],0 ; yes: insert null byte
			mov eax,esi ; point EAX to next character
			jmp Exit_proc ; exit with ZF = 1
		L3: 
			or al,1 ; clear Zero flag
		Exit_proc:
			pop esi
			ret
Str_nextword ENDP

end main