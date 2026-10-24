;Materia      : Lenguajes de Interfaz
;Unidad       : 2
;Alumno       : José Esteban Villalva Félix
;Horario      : 9 a 10 am
;Docente      : Dr. José Luis Medina Jiménez
;Práctica 6.1 : Estacionamiento
;Descripcion  : Controla diez lugares; impide sobrecupo, valores negativos y opciones invalidas


INCLUDE Irvine32.inc
.data
menu BYTE "0: terminar, 1: entrada, 2: salida: ",0
estado BYTE "Vehiculos: ",0
lleno BYTE "Estacionamiento lleno",0
vacio BYTE "Estacionamiento vacio",0
error BYTE "Opcion invalida",0
ocupacion DWORD 0
CAPACIDAD = 10
.code
main PROC
ciclo:
    mov edx, OFFSET menu
    call WriteString
    call ReadInt
    jo invalida
    cmp eax, 0
    je fin
    cmp eax, 1
    je entrada
    cmp eax, 2
    je salida
invalida:
    mov edx, OFFSET error
    jmp aviso
entrada:
    ; Revisar si queda espacio antes de sumar un carro.
    cmp ocupacion, CAPACIDAD
    jae sinLugar
    inc ocupacion
    jmp mostrar
salida:
    cmp ocupacion, 0
    je sinVehiculos
    dec ocupacion
    jmp mostrar
sinLugar:
    mov edx, OFFSET lleno
    jmp aviso
sinVehiculos:
    mov edx, OFFSET vacio
aviso:
    call WriteString
    call Crlf
mostrar:
    mov edx, OFFSET estado
    call WriteString
    mov eax, ocupacion
    call WriteDec
    call Crlf
    jmp ciclo
fin:
    exit
main ENDP
END main
