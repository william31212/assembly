.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
source byte 50 DUP(?)
target byte 100 dup(?)

.code
main proc



	mov esi,offset source
	mov edi,offset target

	mov ecx,lengthof source
	call dumpregs
	
	cld
	
	rep	movsb
	

	mov ecx,lengthof target
	mov esi,0

	mov eax,0
	


    exit

main endp
end main