.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
val2 DWORD 5
val1 DWORD 6

.code
main proc
	
	; push 5
	; push 6
	; call AddTwo
	; call dumpregs

	; call writeint
	call myfuck


    exit

main endp

AddTwo proc
	call dumpregs
	push ebp
	mov ebp,esp
	call dumpregs
	mov eax,[ebp+12]
	add eax,[ebp+8]
	pop ebp
	call dumpregs
	ret 8
AddTwo endp


makeArray proc

	push ebp
	mov ebp,esp
	sub esp,32;開30格array
	lea esi,[ebp-30]
	;mov esi,offset [ebp-30] is wrong
	mov ecx,30

	L1:
		mov BYTE PTR [esi],'*'
		inc esi
	loop L1

	add esp,32
	pop ebp

	ret 
makeArray endp

; example1 proc
; 	call dumpregs
; 	push 6
; 	call dumpregs
; 	push 5
; 	call dumpregs
; 	call AddTwo
; 	call dumpregs
; 	add esp,8
; 	ret
; example1 endp

myfuck proc
	call dumpregs
	enter 8,0
	call dumpregs
	leave
	ret

myfuck endp


end main