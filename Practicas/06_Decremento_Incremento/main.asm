;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 6 : Decremento e incremento
;Descripcion: Decrementa intentos de acceso; el complemento usa INC y DEC


INCLUDE Irvine32.inc

; Mensajes y variables
.data
	msgPin BYTE "Ingrese PIN de acceso: ", 0
	msgError BYTE "PIN Incorrecto", 0
	msgAcceso BYTE "Acceso permitido", 0
	msgIntento BYTE "Intentos Restantes: ", 0
	msgBloqueo BYTE "Sistema bloqueado", 0

	pinCorrecto = 1234

; Inicio del programa
.code
main PROC
	mov ebx, 3

intentar:
	mov edx, OFFSET msgPin
	call WriteString
	call ReadInt

	CMP eax, pinCorrecto
	JE acceso

	mov edx, OFFSET msgError
	call WriteString
	call crlf

	dec ebx ; Quitar un intento.
	jz bloqueo

	mov edx, OFFSET msgIntento
	call WriteString
	mov eax, ebx
	call WriteDec
	call crlf

	JMP intentar

	acceso:
		mov edx, OFFSET msgAcceso
		call WriteString
		call crlf
		JMP fin

	bloqueo:
		mov edx, OFFSET msgBloqueo
		call WriteString
		call crlf
		JMP fin

	fin:
		exit

main ENDP
END main
