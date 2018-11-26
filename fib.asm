.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
tmp DWORD 0
tmp2 DWORD 0
input BYTE "num: ", 0dh, 0ah, 0 
Total BYTE "Total is", 0dh, 0ah, 0 

.code

main proc
	
	mov edx, OFFSET input
	call Writestring
	call ReadInt
    mov ecx, eax
    mov ebx, 0
    mov eax, 1
    mov tmp, 0
    mov tmp2, 0


 
    lp1:
        mov edx, OFFSET Total
        call Writestring

        add eax,tmp
        add eax,tmp2
        call Writeint

        mov tmp,eax
        call dumpregs
        ;change tmp1,tmp2
        

        mov ebx, tmp2
        mov eax, tmp
        mov tmp2,eax
        mov tmp,ebx
        mov eax, 0
        ;change end

    loop lp1

    exit



main endp
end main