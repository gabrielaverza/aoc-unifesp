.data

str1: .asciiz "Entre com o dia (DD): "
str2: .asciiz "Entre com o mes (MM): "
str3: .asciiz "Entre com o ano (AAAA): "
str4: .asciiz "Dia invalido."
str5: .asciiz "Mes invalido."
str6: .asciiz "Ano invalido."
str7: .asciiz "Data de Nascimento: "
str8: .asciiz "/"
str9: .asciiz "\n"

.text
.globl main

main:
	leituraDia: 
	li $v0, 4	# imprime str1
	la $a0, str1
	syscall

	li $v0, 5	# leitura dia
	syscall

	move $t0, $v0	# move de v0 para t0
	
	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall
	
	blt $t0, 1, diaInvalido		# dia menor que 1
	bgt $t0, 31, diaInvalido 	# dia maior que 31
	j diaValido
	
	diaInvalido:
	li $v0, 4	# imprime str4
	la $a0, str4
	syscall

	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall	

	j leituraDia

	diaValido:	
	
	leituraMes:
	li $v0, 4	# imprime str2
	la $a0, str2
	syscall
	
	li $v0, 5	# leitura mes
	syscall

	move $t1, $v0	# move de v0 para t1
	
	li $v0, 4	# imrpime quebra de linha
	la $a0, str9
	syscall
	
	blt $t1, 1, mesInvalido		# mes menor que 0
	bgt $t1, 12, mesInvalido	# mes maior que 12
	j mesValido
	
	mesInvalido:
	li $v0, 4	# imprime str5
	la $a0, str5
	syscall

	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall	

	j leituraMes

	mesValido:
	
	leituraAno:
	li $v0, 4	# imprime str3
	la $a0, str3
	syscall
	
	li $v0, 5	# leitura ano
	syscall

	move $t2, $v0	# move ano de v0 para t2
	
	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall

	blt $t2, 1900, anoInvalido	# ano menor que 1900
	bgt $t2, 2021, anoInvalido	# ano maior que 2021
	j anoValido
	
	anoInvalido:
	li $v0, 4	# imprime str6
	la $a0, str6
	syscall
	
	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall
	
	j leituraAno

	anoValido:
	
	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall

	li $v0, 4	# imprime quebra de linha
	la $a0, str9
	syscall
	
	li $v0, 4	# imprime str7
	la $a0, str7
	syscall

	bge $t0, 10, imprimeDia # dia maior ou igual a 10
	
	li $v0, 1	# imprime 0 antes do dia menor que 10
	la $a0, 0
	syscall

	imprimeDia:
	li $v0, 1	# imprime t0
	move $a0, $t0	
	syscall

	li $v0, 4	# imprime str8
	la $a0, str8
	syscall

	bge $t1, 10, imprimeMes	# mes maior ou igual a 10
	
	li $v0, 1	# imprime 0 antes do mes menor que 10
	la $a0, 0
	syscall
	
	imprimeMes:
	li $v0, 1	# imprime t1
	move $a0, $t1
	syscall

	li $v0, 4	# imprime str8
	la $a0, str8
	syscall
	
	li $v0, 1	# imprime t2
	move $a0, $t2
	syscall

	li $v0, 10	# finaliza o programa
	syscall