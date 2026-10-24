;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 15: Manipulacion de archivos
;Descripcion: Guarda un mensaje en un archivo y despues lo lee


INCLUDE Irvine32.inc
.data
	nombreArchivo BYTE "practica15-datos.txt",0
	mensaje BYTE "Lenguajes de Interfaz - Unidad 2",0
	longitud = SIZEOF mensaje - 1 ; sin contar el cero final
	buffer BYTE 50 DUP(0)
	archivo DWORD ?
	msgError BYTE "No se pudo abrir o crear el archivo",0

.code
main PROC
	; crear el archivo
	mov edx, OFFSET nombreArchivo
	call CreateOutputFile
	cmp eax, INVALID_HANDLE_VALUE
	je error
	mov archivo, eax ; guardar el identificador del archivo

	; escribir el mensaje y cerrar
	mov eax, archivo
	mov edx, OFFSET mensaje
	mov ecx, longitud
	call WriteToFile
	mov eax, archivo
	call CloseFile

	; abrir el archivo otra vez para leerlo
	mov edx, OFFSET nombreArchivo
	call OpenInputFile
	cmp eax, INVALID_HANDLE_VALUE
	je error
	mov archivo, eax

	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer - 1 ; dejar espacio para el cero final
	call ReadFromFile
	jc error ; si hubo error al leer

	mov edx, OFFSET buffer
	call WriteString
	call Crlf

	mov eax, archivo
	call CloseFile
	jmp fin

error:
	mov edx, OFFSET msgError
	call WriteString
	call Crlf

fin:
	exit

main ENDP
END main
