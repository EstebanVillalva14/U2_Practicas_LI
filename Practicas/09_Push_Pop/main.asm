;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 9 : PUSH y POP
;Descripcion: Guarda dos números en la pila y después los muestra.


INCLUDE Irvine32.inc
.code

main PROC
	; Guardar dos numeros en la pila
	mov eax, 10
	push eax
	mov eax, 20
	push eax
	pop eax
	call WriteDec	;  20
	call Crlf
	pop eax
	call WriteDec	;  Sale el 10
	call Crlf
	exit

main ENDP

END main
