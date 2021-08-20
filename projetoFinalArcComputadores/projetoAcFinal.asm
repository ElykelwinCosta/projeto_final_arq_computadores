	.data
intx:	.asciiz "Digite um numero inteiro positivo: " #X
strr:	.asciiz "Resultado: "

	.text
	.globl main
	
main:
	li $t0, 0 #Y
	
	li $v0, 4 #Imprime string
	la $a0, intx #endereço da string
	syscall
	
	li $v0, 5 #Lê o valor de X
	syscall
	move $t1, $v0 #Move o valor de X para $t1
	
WHILE:
	beq $t1,0,FIM	# while (x != 0)
IF:	
    	div $t7, $t1, 2 #Divide x por 2
	mfhi $t5 #Move o resto da divisão para $t5 
	beq $t5,0,VERDADE # se hi (Resto da divisão) = 0, ou seja, x é par, vá para VERDADE
	b LOOP
	
VERDADE:	
	add $t0,$t0,$t1	# y = y + x
	
LOOP:
	subi $t1,$t1,1 # x = x - 1
	b WHILE

FIM:	#aqui continuo meu código	
	li $v0, 4 #Imprime string
	la $a0, strr #endereço da string
	syscall
	
	li $v0,1	# print_int
	move $a0,$t0	# valor de retorno da funcao
	syscall

	li $v0,10	# syscall exit
	syscall		# executar syscall