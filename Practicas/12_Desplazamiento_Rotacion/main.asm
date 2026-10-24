;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 12: Desplazamiento y rotacion
;Descripcion: Muestra como cambian los bits al desplazarlos y rotarlos


INCLUDE Irvine32.inc
.data
	numero DWORD 80000001h ; tiene prendido el primer y el ultimo bit
	msgShl BYTE "SHL: ",0
	msgShr BYTE "SHR: ",0
	msgSar BYTE "SAR: ",0
	msgRol BYTE "ROL: ",0
	msgRor BYTE "ROR: ",0

.code
main PROC
	; SHL, se mueve a la izquierda y entra un cero
	mov edx, OFFSET msgShl
	call WriteString
	mov eax, numero
	shl eax, 1 ; el bit de arriba se pierde
	call WriteHex
	call Crlf

	; SHR, se mueve a la derecha y entra un cero
	mov edx, OFFSET msgShr
	call WriteString
	mov eax, numero
	shr eax, 1
	call WriteHex
	call Crlf

	; SAR, se mueve a la derecha pero conserva el signo
	mov edx, OFFSET msgSar
	call WriteString
	mov eax, numero
	sar eax, 1 ; el bit de arriba se queda en 1
	call WriteHex
	call Crlf

	; ROL, el bit que sale por la izquierda entra por la derecha
	mov edx, OFFSET msgRol
	call WriteString
	mov eax, numero
	rol eax, 1
	call WriteHex
	call Crlf

	; ROR, el bit que sale por la derecha entra por la izquierda
	mov edx, OFFSET msgRor
	call WriteString
	mov eax, numero
	ror eax, 1
	call WriteHex
	call Crlf
	exit

main ENDP
END main
