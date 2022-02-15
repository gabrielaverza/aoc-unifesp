.data
  str1: .asciiz "Insira a mensagem: "
  str2: .asciiz "Numero total de caracteres: "
  str3: .asciiz "\nMensagem Criptografada: "
  str4: .asciiz "\nInsira a senha: "
  str5: .asciiz "\nMensagem Original: "
  str6: .asciiz "Senha incorreta. "
  mensagem: 
    .align 2
    .space 1000

.text
.globl main

main:

  move $t1, $zero # indice do vetor
  move $t2, $zero # contador de caracteres
  move $t3, $zero # contador pro loop de impressao

  li $v0, 4	# imprime str1
  la $a0, str1
  syscall

  leitura:
    li $v0, 12 # le o caracter
    syscall
    move $t0, $v0 
    beq $t0, 10, terminaLeitura # compara com ascii enter
    sw $t0, mensagem($t1) # salva no vetor
    addi $t1, $t1, 4 # atualiza indice
    addi $t2, $t2, 1 # atualiza contador de caracteres
    j leitura

  terminaLeitura:

  move $t1, $zero # reseta o indice

  loop:
    beq $t3, $t2, sai # condicao de parada

    lb $a0, mensagem($t1) # carrega o caracter do vetor
    move $t5, $a0

    compara_space:
    beq $t5, 32, substitui_space # compara com space
    j compara_a

    substitui_space:
    li $t4, 48 # carrega '0' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_a:
    beq $t5, 97, substitui_a # compara com 'a'
    beq $t5, 65, substitui_a # compara com 'A'
    j compara_r

    substitui_a:
    li $t4, 49 # carrega '1' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_r:
    beq $t5, 114, substitui_r # compara com 'r'
    beq $t5, 82, substitui_r # compara com 'R'
    j compara_e

    substitui_r:
    li $t4, 50 # carrega '2' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_e:
    beq $t5, 101, substitui_e # compara com 'e'
    beq $t5, 69, substitui_e # compara com 'E'
    j compara_o

    substitui_e:
    li $t4, 51 # carrega '3' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_o:
    beq $t5, 111, substitui_o # compara com 'o'
    beq $t5, 79, substitui_o # compara com 'O'
    j compara_m

    substitui_o:
    li $t4, 52 # carrega '4' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_m:
    beq $t5, 109, substitui_m # compara com 'm'
    beq $t5, 77, substitui_m # compara com 'M'
    j compara_h

    substitui_m:
    li $t4, 53 # carrega '5' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_h:
    beq $t5, 104, substitui_h # compara com 'h'
    beq $t5, 72, substitui_h # compara com 'H'
    j compara_l

    substitui_h:
    li $t4, 54 # carrega '6' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_l:
    beq $t5, 108, substitui_l # compara com 'l'
    beq $t5, 76, substitui_l # compara com 'L'
    j compara_s

    substitui_l:
    li $t4, 55 # carrega '7' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_s:
    beq $t5, 115, substitui_s # compara com 's'
    beq $t5, 83, substitui_s # compara com 'S'
    j compara_p

    substitui_s:
    li $t4, 56 # carrega '8' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_p:
    beq $t5, 112, substitui_p # compara com 'p'
    beq $t5, 80, substitui_p # compara com 'P'
    j compara_zero

    substitui_p:
    li $t4, 57 # carrega '9' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_zero:
    beq $t5, 48, substitui_zero # compara com '0'
    j compara_um

    substitui_zero:
    li $t4, 32 # carrega 'space' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_um:
    beq $t5, 49, substitui_um # compara com '1'
    j compara_dois

    substitui_um:
    li $t4, 65 # carrega 'A' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_dois:
    beq $t5, 50, substitui_dois # compara com '2'
    j compara_tres

    substitui_dois:
    li $t4, 82 # carrega 'R' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_tres:
    beq $t5, 51, substitui_tres # compara com '3'
    j compara_quatro

    substitui_tres:
    li $t4, 69 # carrega 'E' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_quatro:
    beq $t5, 52, substitui_quatro # compara com '4'
    j compara_cinco

    substitui_quatro:
    li $t4, 79 # carrega 'O' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_cinco:
    beq $t5, 53, substitui_cinco # compara com '5'
    j compara_seis

    substitui_cinco:
    li $t4, 77 # carrega 'M' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_seis:
    beq $t5, 54, substitui_seis # compara com '6'
    j compara_sete

    substitui_seis:
    li $t4, 72 # carrega 'H' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_sete:
    beq $t5, 55, substitui_sete # compara com '7'
    j compara_oito

    substitui_sete:
    li $t4, 76 # carrega 'L' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_oito:
    beq $t5, 56, substitui_oito # compara com '8'
    j compara_nove

    substitui_oito:
    li $t4, 83 # carrega 'S' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_nove:
    beq $t5, 57, substitui_nove # compara com '9'
    j proximo

    substitui_nove:
    li $t4, 80 # carrega 'P' no registrador
    sw $t4, mensagem($t1) # substitui no vetor

    proximo:
    addi $t1, $t1, 4
    addi $t3, $t3, 1
    j loop

  sai:

  li $v0, 4	# imprime str2
  la $a0, str2
  syscall

  li $v0, 1	# imprime t2
  move $a0, $t2
  syscall

  li $v0, 4	# imprime str3
  la $a0, str3
  syscall

  move $t1, $zero
  move $t3, $zero

  imprime:
    beq $t3, $t2, terminaImpressao
    li $v0, 11
    lb $a0, mensagem($t1)
    syscall

    addi $t1, $t1, 4
    addi $t3, $t3, 1
    j imprime

  terminaImpressao:

  li $v0, 4	# imprime str4
  la $a0, str4
  syscall

  li $v0, 5	# leitura senha
  syscall

  move $t6, $v0

  beq $t6, 123456, senhaCorreta

  li $v0, 4	# imprime str6
  la $a0, str6
  syscall
  j fim

  senhaCorreta:

  move $t1, $zero # reseta o indice

  loop2:
    beq $t3, $t2, sai2 # condicao de parada

    lb $a0, mensagem($t1) # carrega o caracter do vetor
    move $t5, $a0

    compara_space:
    beq $t5, 32, substitui_space # compara com space
    j compara_a

    substitui_space:
    li $t4, 48 # carrega '0' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_a:
    beq $t5, 97, substitui_a # compara com 'a'
    beq $t5, 65, substitui_a # compara com 'A'
    j compara_r

    substitui_a:
    li $t4, 49 # carrega '1' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_r:
    beq $t5, 114, substitui_r # compara com 'r'
    beq $t5, 82, substitui_r # compara com 'R'
    j compara_e

    substitui_r:
    li $t4, 50 # carrega '2' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_e:
    beq $t5, 101, substitui_e # compara com 'e'
    beq $t5, 69, substitui_e # compara com 'E'
    j compara_o

    substitui_e:
    li $t4, 51 # carrega '3' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_o:
    beq $t5, 111, substitui_o # compara com 'o'
    beq $t5, 79, substitui_o # compara com 'O'
    j compara_m

    substitui_o:
    li $t4, 52 # carrega '4' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_m:
    beq $t5, 109, substitui_m # compara com 'm'
    beq $t5, 77, substitui_m # compara com 'M'
    j compara_h

    substitui_m:
    li $t4, 53 # carrega '5' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_h:
    beq $t5, 104, substitui_h # compara com 'h'
    beq $t5, 72, substitui_h # compara com 'H'
    j compara_l

    substitui_h:
    li $t4, 54 # carrega '6' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_l:
    beq $t5, 108, substitui_l # compara com 'l'
    beq $t5, 76, substitui_l # compara com 'L'
    j compara_s

    substitui_l:
    li $t4, 55 # carrega '7' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_s:
    beq $t5, 115, substitui_s # compara com 's'
    beq $t5, 83, substitui_s # compara com 'S'
    j compara_p

    substitui_s:
    li $t4, 56 # carrega '8' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_p:
    beq $t5, 112, substitui_p # compara com 'p'
    beq $t5, 80, substitui_p # compara com 'P'
    j compara_zero

    substitui_p:
    li $t4, 57 # carrega '9' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_zero:
    beq $t5, 48, substitui_zero # compara com '0'
    j compara_um

    substitui_zero:
    li $t4, 32 # carrega 'space' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_um:
    beq $t5, 49, substitui_um # compara com '1'
    j compara_dois

    substitui_um:
    li $t4, 65 # carrega 'A' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_dois:
    beq $t5, 50, substitui_dois # compara com '2'
    j compara_tres

    substitui_dois:
    li $t4, 82 # carrega 'R' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_tres:
    beq $t5, 51, substitui_tres # compara com '3'
    j compara_quatro

    substitui_tres:
    li $t4, 69 # carrega 'E' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_quatro:
    beq $t5, 52, substitui_quatro # compara com '4'
    j compara_cinco

    substitui_quatro:
    li $t4, 79 # carrega 'O' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_cinco:
    beq $t5, 53, substitui_cinco # compara com '5'
    j compara_seis

    substitui_cinco:
    li $t4, 77 # carrega 'M' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_seis:
    beq $t5, 54, substitui_seis # compara com '6'
    j compara_sete

    substitui_seis:
    li $t4, 72 # carrega 'H' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_sete:
    beq $t5, 55, substitui_sete # compara com '7'
    j compara_oito

    substitui_sete:
    li $t4, 76 # carrega 'L' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_oito:
    beq $t5, 56, substitui_oito # compara com '8'
    j compara_nove

    substitui_oito:
    li $t4, 83 # carrega 'S' no registrador
    sw $t4, mensagem($t1) # substitui no vetor
    j proximo

    compara_nove:
    beq $t5, 57, substitui_nove # compara com '9'
    j proximo

    substitui_nove:
    li $t4, 80 # carrega 'P' no registrador
    sw $t4, mensagem($t1) # substitui no vetor

    proximo:
    addi $t1, $t1, 4
    addi $t3, $t3, 1
    j loop2

  sai2:  

  fim:  

  li $v0, 10	# finaliza o programa
  syscall