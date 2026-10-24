;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 2 : Captura y desplegado de mensajes
;Descripcion: Captura y muestra un nombre; reserva espacio para el terminador.

INCLUDE Irvine32.inc

; mensajes y variables
.data
	mensaje BYTE "Escribe tu nombre: ",0
	nombre BYTE 30 DUP(0)

; inicio del programa
.code
main PROC
	mov edx, OFFSET mensaje
	call WriteString

	mov edx, OFFSET nombre
	mov ecx, SIZEOF nombre - 1 ; Dejar espacio para el cero final.

	call ReadString ; Guardar el nombre.

	mov edx, OFFSET nombre
	call WriteString
	exit
main ENDP
END main
