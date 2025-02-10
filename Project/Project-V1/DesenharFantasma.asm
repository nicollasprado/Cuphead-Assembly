.text

.globl desenharFantasma, desfazerFantasma

# RG: $8, $9, $10, $11, $14

desenharFantasma:
	sw $31, 0($29)  # Salva o endereço de retorno
	addi $29, $29, -4  

	# Fazendo o Backup na pilha
	sw $8, 0($29)    # Salva $8 na pilha
	addi $29, $29, -4
	
	sw $9, 0($29)    # Salva $9 na pilha
	addi $29, $29, -4
	
	sw $10, 0($29)   # Salva $10 na pilha
	addi $29, $29, -4
	
	sw $11, 0($29)   # Salva $11 na pilha
	addi $29, $29, -4
	
	sw $14, 0($29)   # Salva $14 na pilha
	addi $29, $29, -4	
	
	# Primeiro endereço de memória para o display
	lui $8, 0x1001
	add $8, $8, $4

	ori $9, $0, 0x8fc4cc   	# Cor do fantasmaaff   	# Cor do fantasma
	li $14, 4		# Controle de direcao (Horizontal)role de direcao (Horizontal)
	
	addi $8, $8, 40
	li $10, 5  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488	# 512 - (6*4)
	li $10, 9  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 468	# 512 - (11*4)
	li $10, 13  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador 
	jal desenha_traco
	
	addi $8, $8, 8		# 8
	li $10, 4  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	addi $8, $8, 436	# 512 - (19*4)
	li $10, 18 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 444	# 512 - (17*4)
	li $10, 16  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 448	# 512 - (16*4)
	li $10, 15  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 456	# 512 - (16*4)
	li $10, 12 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	addi $8, $8, 468	# 512 - (11*4)
	li $10, 8 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 480	# 512 - (8*4)
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 4		# 4
	li $10, 3		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 484	# 512 - (8*4)
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	sw $9, 8($8)            # Salva o código da cor no endereço atual
	sw $9, 516($8)          # Salva o código da cor no endereço atual
	jal desenha_traco

#======================== SEGUNDA CAMADA ================================
	
	lui $8, 0x1001
	add $8, $8, $4
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaa
	
	addi $8, $8, 40		# 10*4
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
	sw $9, 0($8)
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
	
	addi $8, $8, 4		
	li $10, 1 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488	# 512 - (6*4)
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
	sw $9, 0($8)
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
	
	addi $8, $8, 4		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 476	# 512 - 9*4
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
			
	li $10, 6 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 16		# 4*4		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x000000  	# Cor do fantasmaa
	addi $8, $8, 448	# 512 - 16*4		
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
			
	li $10, 13 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xffffff
	addi $8, $8, 460
	sw $9, 0($8)
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
		
	addi $8, $8, 4		# 4*4		
	li $10, 11 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 452	# 4*4		
	li $10, 1 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
		
	ori $9, $0, 0xffffff
	
	li $10, 3		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xd4faff	# Cor do fantasmaaf
	
	li $10, 9		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 464	# 512 - 14*4		
	li $10, 9 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 480	# 512 - 8*4		
	li $10, 1 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 12				
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488	# 512 - 8*4		
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
#======================== ESPADA ================================
	
	lui $8, 0x1001
	add $8, $8, $4
	addi $8, $8, 3584
	
	ori $9, $0, 0x990000	# Cor do cabo
	sw $9, 28($8)
	sw $9, 1052($8)
	sw $9, 1056($8)
	sw $9, 1064($8)
	sw $9, 1564($8)
	
	ori $9, $0, 0x999999	# Cor do lamina1
	sw $9, 0($8)
	
	ori $9, $0, 0xb7b7b7	# Cor do lamina2
	addi $8, $8, 512	
	sw $9, 0($8)
	
	ori $9, $0, 0x999999	# Cor do lamina1
	addi $8, $8, 4
	li $10, 6 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x990000
	sw $9, 0($8)
	sw $9, 4($8)
	sw $9, 8($8)
	
	ori $9, $0, 0xb7b7b7	# Cor do lamina2
	addi $8, $8, 488
	li $10, 6 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	# Recuperando o Backup na pilha
	addi $29, $29, 4
	lw $14, 0($29)
	
	addi $29, $29, 4
	lw $11, 0($29)
	
	addi $29, $29, 4
	lw $10, 0($29)
	
	addi $29, $29, 4
	lw $9, 0($29)
	
	addi $29, $29, 4
	lw $8, 0($29)
			
retornFantasma:
 	addi $29, $29, 4
	lw $31, 0($29)
	jr $31
	
	
desenha_traco:
	sw $31, 0($29)
	addi $29, $29, -4
continueLoop_desenha_traco:
	beq $11, $10, retornFantasma 	# Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	add $8, $8, $14        	# Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j continueLoop_desenha_traco  







desfazerFantasma:

# RG: $8, $10, $11, $12, $13, $14, $15, 17

	sw $31, 0($29)  # Salva o endereço de retorno na pilha
	addi $29, $29, -4  

	# Fazendo backup dos registradores na pilha
	sw $8, 0($29)
	addi $29, $29, -4
	
	sw $10, 0($29)
	addi $29, $29, -4
	
	sw $11, 0($29)
	addi $29, $29, -4
	
	sw $12, 0($29)
	addi $29, $29, -4
	
	sw $13, 0($29)
	addi $29, $29, -4
	
	sw $14, 0($29)
	addi $29, $29, -4
		
	sw $15, 0($29)
	addi $29, $29, -4
	
	sw $17, 0($29)
	addi $29, $29, -4
	
	
	lui $8, 0x1001 # Carrega endereço base
	add $8, $8, $4 # Calcula endereço do baiacu
	addi $12, $8, 32768 # Ajusta um segundo endereço
	
	# Inicializa as variáveis para percorrer a matriz
	li $10, 27  # Número de colunas
	li $11, 0  # Contador de colunas
	
	li $13, 12  # Número de linhas
	li $14, 0  # Contador de linhas

#---------------------------------------------------------------------------------------------------
	
forLinha_removerFantasma: # Loop para percorrer linhas
	beq $13, $14 retorna_removerFantasma # Se atingiu o número de linhas, retorna
	
	add $15, $0, $8 # Salva o valor inicial da linha
	
forcoluna_removerFantasma: # Loop para percorrer colunas
	beq $10, $11, proxima_linha_removerFantasma # Se atingiu o número de colunas, passa para a próxima linha
	
	lw $17, 0($12) # Carrega um valor
	sw $17, 0($8) # Substitui o valor na posição do baiacu
	
	addi $8, $8, 4 # Move para a próxima coluna
	addi $12, $12, 4 # Move para a próxima coluna na memória
	
	addi $11, $11, 1 # Incrementa a contagem de colunas
	
	j forcoluna_removerFantasma # Continua percorrendo as colunas

proxima_linha_removerFantasma:
	li $11, 0 # Reseta o contador de colunas
	addi $14, $14, 1 # Incrementa a linha
	addi $8, $15, 512 # Move para a próxima linha
	addi $12, $8, 32768 # Ajusta o segundo endereço
	
	j forLinha_removerFantasma # Continua percorrendo as linhas

#---------------------------------------------------------------------------------------------------
			
retorna_removerFantasma:

	# Recuperando o backup dos registradores
	addi $29, $29, 4
	lw $17, 0($29)
	addi $29, $29, 4
	lw $15, 0($29)
	addi $29, $29, 4
	lw $14, 0($29)
	addi $29, $29, 4
	lw $13, 0($29)
	addi $29, $29, 4
	lw $12, 0($29)
	addi $29, $29, 4
	lw $11, 0($29)
	addi $29, $29, 4
	lw $10, 0($29)
	addi $29, $29, 4
	lw $8, 0($29)
	addi $29, $29, 4
	lw $31, 0($29) # Recupera o endereço de retorno
	
	jr $31	# Retorna para a função chamadora