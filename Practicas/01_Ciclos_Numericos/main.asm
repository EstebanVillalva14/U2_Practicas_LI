;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Practica 1 : Ciclos numéricos
;Descripcion: Cuenta de cinco a uno con LOOP

INCLUDE Irvine32.inc

; inicio del programa
.code
main PROC
	mov ecx, 5 ; repetir cinco veces

	ciclo:
	mov eax, ecx
	call WriteDec
	call crlf
	loop ciclo ; restar uno y repetir
	exit

main ENDP
END main
