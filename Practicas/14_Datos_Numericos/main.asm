;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 14: Captura y almacenamiento de datos numericos 
;Descripcion: Lee cinco numeros, los guarda y despues los muestra


INCLUDE Irvine32.inc
.data
	msgEntrada BYTE "Introduce un entero con signo: ",0
	msgError BYTE "Entrada invalida, intenta de nuevo",0
	msgDatos BYTE "Datos almacenados:",0
	datos SDWORD 5 DUP(?)

.code
main PROC
	mov esi, OFFSET datos
	mov ebx, 0 ; cuantos numeros llevo

capturar:
	mov edx, OFFSET msgEntrada
	call WriteString
	call ReadInt
	jo invalida ; si no es valido, volver a pedirlo
	mov [esi], eax ; guardar el numero
	add esi, 4 ; cada numero ocupa 4 bytes
	inc ebx
	cmp ebx, 5
	jl capturar

	mov edx, OFFSET msgDatos
	call WriteString
	call Crlf

	mov esi, OFFSET datos ; volver al inicio del arreglo
	mov ebx, 0

mostrar:
	mov eax, [esi] ; leer el numero guardado
	call WriteInt
	call Crlf
	add esi, 4
	inc ebx
	cmp ebx, 5
	jl mostrar
	jmp fin

invalida:
	mov edx, OFFSET msgError
	call WriteString
	call Crlf
	jmp capturar

fin:
	exit

main ENDP
END main
