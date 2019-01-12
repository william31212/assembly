.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
COUNT = 4
color_1 = 1 + (black * 16)
color_2 = 2 + (black * 16)
color_3 = 3 + (black * 16)
color_4 = 4 + (black * 16)
DefaultColor = lightGray + (black * 16)
arrayD SDWORD 12345678h,1A4B200h,3434h,7AB9h
First BYTE "This is first color",0dh,0ah,0
Second BYTE "This is second color",0dh,0ah,0
Third BYTE "This is third color",0dh,0ah,0
Fourth BYTE "This is Fourth clor",0dh,0ah,0

.code
main proc
	mov eax,color_1
	call SetTextColor

	mov edx,OFFSET First
	call WriteString
	call crlf
;-----------------------
	mov eax,color_2
	call SetTextColor

	mov edx,OFFSET Second
	call WriteString
	call crlf
;-----------------------
	mov eax,color_3
	call SetTextColor

	mov edx,OFFSET Third
	call WriteString
	call crlf
;-----------------------
	mov eax,color_4
	call SetTextColor

	mov edx,OFFSET Fourth
	call WriteString
	call crlf
;-----------------------

	mov eax,DefaultColor
	call SetTextColor
	call waitmsg
    exit

main endp
end main