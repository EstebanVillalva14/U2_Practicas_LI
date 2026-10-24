;Materia      : Lenguajes de Interfaz
;Unidad       : 2
;Alumno       : José Esteban Villalva Félix
;Horario      : 9 a 10 am
;Docente      : Dr. José Luis Medina Jiménez
;Práctica 5.1 : Repetir hasta cero
;Descripcion  : Muestra enteros hasta recibir cero; admite positivos y negativos.



INCLUDE Irvine32.inc
.data
mensaje BYTE "Introduce un entero (0 termina): ",0
.code
main PROC
ciclo:
    mov edx, OFFSET mensaje
    call WriteString
    call ReadInt
    jo ciclo                 ; volver a pedir un numero
    cmp eax, 0
    je fin                   ; salir si escribe cero
    call WriteInt
    call Crlf
    jmp ciclo
fin:
    exit
main ENDP
END main
