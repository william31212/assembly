.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

array DWORD 10000h,20000h,30000h,40000h,50000h
theSum DWORD ?
.code
main proc
	
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	call ArraySum
	mov theSum,eax
	call writehex
    exit

main endp

; Sumof proc
; 	add eax,ebx
; 	add eax,ecx
; 	call crlf
; 	ret
; Sumof endp 

ArraySum proc USES esi ecx
	
	mov eax,0
L1:
	add eax,[esi]
	add esi,TYPE DWORD
loop L1
	ret

ArraySum endp

end main