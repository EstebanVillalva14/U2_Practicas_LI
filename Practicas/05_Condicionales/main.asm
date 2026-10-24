;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 5 : Condicionales
;Descripcion: Repite mientras el contador sea menor o igual a cien


INCLUDE Irvine32.inc
; inicio del programa
.code
main PROC
	mov ebx, 1
ciclo:
	CMP ebx, 100 ; terminar cuando pase de cien
	jg fin

	mov eax, ebx
	call WriteDec
	call crlf

	inc ebx ; aumentar el contador

	jmp ciclo

fin:
	exit
main ENDP
END main
