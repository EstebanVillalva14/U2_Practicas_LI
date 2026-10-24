;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 3 : Comparación y prueba
;Descripcion: Compara dos números y revisa si el primero es par.


INCLUDE Irvine32.inc
.data
iguales BYTE "Son iguales",0
diferentes BYTE "Son diferentes",0
par BYTE "El primer numero es par",0
impar BYTE "El primer numero es impar",0

.code
main PROC
    ; Comparar dos numeros
    mov eax, 10
    mov ebx, 10
    cmp eax, ebx
    je igual
    mov edx, OFFSET diferentes
    jmp mostrar
igual:
    mov edx, OFFSET iguales
mostrar:
    call WriteString
    call Crlf

    ; Probar si 10 es par revisando su ultimo bit
    mov eax, 10
    test eax, 1
    jz esPar
    mov edx, OFFSET impar
    jmp resultado
esPar:
    mov edx, OFFSET par
resultado:
    call WriteString
    call Crlf
    exit
main ENDP
END main
