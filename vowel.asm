;In ax write number of vowels of string 'MESSAGE' 

SECTION .data
message db 'MESSAGE',0 ;string terminiran nulom
vowel	db 'A','I','U','E','O'
vowel_lenght equ	$-vowel

SECTION .text
global _start
_start:
	MOV esi,message
	MOV ax,0
	iterate_message:
		MOV edi,vowel
		MOV cx,vowel_lenght
		iterate_vowel:
			MOV bl,[edi]
			CMP [esi],bl
			JE match
			INC edi
			loop iterate_vowel
		INC esi
		CMP BYTE[esi],0
		JNE iterate_message
		JE end
match:
	INC ax
	INC edi
	DEC cx
	CMP cx,0
	JNE iterate_vowel
	INC esi
	CMP BYTE[esi],0 ;if last element 
	JNE iterate_message
	JE end
	
end:
	MOV eax,1
	MOV ebx,0
	int 80h




	