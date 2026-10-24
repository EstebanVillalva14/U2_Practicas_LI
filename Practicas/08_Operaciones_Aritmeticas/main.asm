;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 8 : Operaciones Aritmeticas
;Descripcion: Suma y resta dos números y muestra los resultados.


INCLUDE Irvine32.inc
.data
numero1 DWORD 20
numero2 DWORD 10
resultado DWORD ?
.code
main PROC
    ; Sumar 20 + 10.
    mov eax, numero1
    add eax, numero2
    mov resultado, eax
    call WriteDec
    call Crlf

    ; Restar 20 - 10.
    mov eax, numero1
    sub eax, numero2
    mov resultado, eax
    call WriteDec
    call Crlf
    exit
main ENDP
END main
