;Materia     : Lenguajes de Interfaz
;Unidad      : 2
;Alumno      : José Esteban Villalva Félix
;Horario     : 9 a 10 am
;Docente     : Dr. José Luis Medina Jiménez
;Práctica 4.1: Mayor, menor o igual
;Descripcion : Lee dos números y dice cuál es mayor o si son iguales


INCLUDE Irvine32.inc
.data
mensaje BYTE "Escribe un numero: ",0
igual BYTE "Los numeros son iguales",0
mayor BYTE "El primero es mayor",0
menor BYTE "El primero es menor",0
primero SDWORD ?
.code
main PROC
    ; Leer el primer numero y guardarlo
    mov edx, OFFSET mensaje
    call WriteString
    call ReadInt
    mov primero, eax

    ; Leer el segundo numero
    mov edx, OFFSET mensaje
    call WriteString
    call ReadInt

    ; Elegir el mensaje segun la comparacion
    cmp primero, eax
    je sonIguales
    jg esMayor
    mov edx, OFFSET menor
    jmp mostrar
sonIguales:
    mov edx, OFFSET igual
    jmp mostrar
esMayor:
    mov edx, OFFSET mayor
mostrar:
    call WriteString
    call Crlf
    exit
main ENDP
END main
