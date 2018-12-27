.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

swap proto, pvalx:ptr dword, pvaly:ptr dword;like function

.data

Array dword 10000h,20000h

.code
main proc
	
	mov esi,offset Array
	mov ecx,2
	mov ebx,type Array
	call dumpmem

	invoke swap, addr Array, addr [Array+4]

	call dumpmem
    exit

main endp

swap proc uses eax esi edi,
	pvalx: ptr dword,
	pvaly: ptr dword


	mov esi,pvalx
	mov edi,pvaly
	mov eax,[esi]
	xchg eax,[edi]
	mov [esi],eax
	ret 
swap endp

end main