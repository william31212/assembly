  .386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

Str_findPROTO, pTarget:PTRBYTE, pSource:PTRBYTE
.data
target BYTE "01ABAAAAAABABCC45ABC9012",0
source BYTE "AAABA",0
str1 BYTE "Source string found at position ",0
str2 BYTE " in Target string (counting from zero).",0Ah,0Ah,0Dh,0
str3 BYTE "Unable to find Source string in Target string.",0Ah,0Ah,0Dh,0
stop DWORD ?
lenTarget DWORD ?
lenSource DWORD ?
position  DWORD ?
.code 
main PROC
	INVOKE Str_find,ADDR target, ADDR source
	mov position,eax
	jz wasfound; ZF=1 indicates string found
	mov edx,OFFSET str3; string not found
	call WriteString
	jmp quit
	wasfound:; display message
		mov edx,OFFSET str1
		call WriteString
		mov eax,position; write position value
		call WriteDec
		mov edx,OFFSET str2
		call WriteString
	quit:
		exit
main ENDP
;--------------------------------------------------------
Str_find PROC, pTarget:PTRBYTE, ;PTR to Target string
			  pSource:PTRBYTE  ;PTR to Source string;; Searches for the first matching occurrence of a source; string inside a target string.; Receives: pointer to the source string and a pointer; to the target string.; Returns: If a match is found, ZF=1 and EAX points to; the offset of the match in the target string.; IF ZF=0, no match was found.;--------------------------------------------------------
	INVOKE Str_length,pTarget; get length of targetmovlenTarget,eaxINVOKE Str_length,pSource; get length of sourcemovlenSource,eaxmovedi,OFFSETtarget; point to targetmovesi,OFFSETsource; point to source; Compute place in target to stop searchmoveax,edi; stop = (offset target)add  eax,lenTarget;       + (length of target)sub  eax,lenSource;       -(length of source)inceax;       + 1movstop,eax; save the stopping position
; Compare source string to current targetcldmovecx,lenSource; length of source stringL1:pushadrepecmpsb; compare all bytespopadje   found; if found, exit nowincedi; move to next target positioncmpedi,stop; has EDI reached stop position?jaenotfound; yes: exitjmpL1; not: continue loopnotfound:; string not foundor   eax,1; ZF=0 indicates failurejmpdone
