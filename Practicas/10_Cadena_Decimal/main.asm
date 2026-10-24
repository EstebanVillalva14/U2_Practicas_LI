;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 10 : Obtencion de una cadenac decimal
;Descripcion: Convierte un numero a una cadena decimal


INCLUDE Irvine32.inc
.data
	msgNumero BYTE "El numero en cadena es: ",0
	numero DWORD 12345
	cadena BYTE 11 DUP(0) ; el ultimo byte queda en cero para terminar la cadena

.code
main PROC
	mov eax, numero
	mov ebx, 10 ; se divide entre 10
	mov edi, OFFSET cadena + 10 ; empezar por el final de la cadena

ciclo:
	mov edx, 0 ; limpiar edx antes de dividir
	div ebx ; eax = cociente, edx = residuo (el digito)
	add dl, '0' ; pasar el digito a caracter
	dec edi
	mov [edi], dl
	cmp eax, 0
	jne ciclo ; repetir mientras queden digitos

	mov edx, OFFSET msgNumero
	call WriteString
	mov edx, edi ; edi quedo en el primer digito
	call WriteString
	call Crlf
	exit

main ENDP
END main
