.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
start DWORD 1
chars BYTE 'H','A','C','E','B','D','F','G'
links DWORD 0,4,5,6,2,3,7,0
linksType BYTE TYPE links
newArray BYTE LENGTHOF chars DUP(?)

.code
main PROC

    MOV ECX, LENGTHOF newArray
    MOV EDI, OFFSET newArray

    L1:
    ;Get char array element accoridng to start
        MOV ESI, OFFSET chars
        ADD ESI, start
        MOV AL, [ESI]
    ;Move element to new array
        MOV [EDI], AL

    ;Move start to element in the links array
        MOV EDX, OFFSET links
        MOV EAX, start
        call writeint
        MUL linksType
        	
        MOV start, EAX 
        ADD EDX, start
    ;Replace start       
        MOV EAX, [EDX]
        MOV start, EAX
		call writeint
        INC EDI
    LOOP L1

    call msgbox

    exit

main endp
end main