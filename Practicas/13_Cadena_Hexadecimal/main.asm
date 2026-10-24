;Materia    : Lenguajes de Interfaz
;Unidad     : 2
;Alumno     : José Esteban Villalva Félix
;Horario    : 9 a 10 am
;Docente    : Dr. José Luis Medina Jiménez
;Práctica 13: Obtencion de una cadena hexadecimal
;Descripcion: Convierte un numero a una cadena hexadecimal


INCLUDE Irvine32.inc
.data
	msgNumero BYTE "El numero en hexadecimal es: ",0
	numero DWORD 1234ABCDh
	cadena BYTE 9 DUP(0) ; 8 digitos y el cero final

.code
main PROC
	mov eax, numero
	mov edi, OFFSET cadena + 7 ; empezar por el ultimo digito
	mov ecx, 8 ; un DWORD tiene 8 digitos hexadecimales

ciclo:
	mov ebx, eax
	and ebx, 0Fh ; quedarse con los ultimos 4 bits
	cmp ebx, 10
	jb esNumero ; del 0 al 9 se suma '0'
	add bl, 'A' - 10 ; del 10 al 15 se suma 'A' menos 10
	jmp guardar

esNumero:
	add bl, '0'

guardar:
	mov [edi], bl
	shr eax, 4 ; pasar al siguiente digito
	dec edi
	loop ciclo

	mov edx, OFFSET msgNumero
	call WriteString
	mov edx, OFFSET cadena
	call WriteString
	call Crlf
	exit

main ENDP
END main
