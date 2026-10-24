;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 11: Operaciones logicas
;Descripcion: Muestra el resultado de AND, OR, XOR y NOT


INCLUDE Irvine32.inc
.data
	numero1 DWORD 12 ; 1100 en binario
	numero2 DWORD 10 ; 1010 en binario
	resultado DWORD ?
	msgAnd BYTE "AND: ",0
	msgOr BYTE "OR: ",0
	msgXor BYTE "XOR: ",0
	msgNot BYTE "NOT del primero: ",0

.code
main PROC
	; AND
	mov edx, OFFSET msgAnd
	call WriteString
	mov eax, numero1
	and eax, numero2 ; 1100 AND 1010 = 1000
	mov resultado, eax
	call WriteHex
	call Crlf

	; OR
	mov edx, OFFSET msgOr
	call WriteString
	mov eax, numero1
	or eax, numero2 ; 1100 OR 1010 = 1110
	mov resultado, eax
	call WriteHex
	call Crlf

	; XOR
	mov edx, OFFSET msgXor
	call WriteString
	mov eax, numero1
	xor eax, numero2 ; 1100 XOR 1010 = 0110
	mov resultado, eax
	call WriteHex
	call Crlf

	; NOT (cambia todos los bits de los 32)
	mov edx, OFFSET msgNot
	call WriteString
	mov eax, numero1
	not eax
	mov resultado, eax
	call WriteHex
	call Crlf
	exit

main ENDP
END main
