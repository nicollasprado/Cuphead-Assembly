.text

.globl cenarioSereia

cenarioSereia: 	
	# Primeiro endereço de memória para o display
	lui $8, 0x1001
	add $24, $0, $31
	
	# Chamada para desenhar o céu
	jal desenha_ceu
		
	# Chamada para desenhar o mar 1
	jal desenha_mar1
	
	# Chamada para desenhar o mar 2
	jal desenha_mar2
	
	# Chamada para desenhar o mar 3
	jal desenha_mar3
	
	# Chamada para desenhar o mar 4
	jal desenha_mar4
	
	# Chamada para desenhar o nuvem
	jal desehar_nuvem1
	
	jr $24
	
# Sub-rotina para retornar para o ponto de chamada	
retorna:
	jr $31
#=================================================================================================================

# Sub-rotina para desenhar o ceu
desenha_ceu:
	ori $9, $0, 0xfff2cc   	# Cor do céu
	li $10, 6400       	# Número de unidade de pixels (128x50)
	li $11, 0              	# Contador
	
for_ceu: 
	beq $11, $10, retorna  	# Verifica se todas as unidades de pixels foram desenhados
	
	sw $9, 0($8)           	# Salva o código da cor no endereço atual
	addi $8, $8, 4         	# Aponta para o próximo endereço
	addi $11, $11, 1       	# Incrementa o contador
	
	j for_ceu               

#=================================================================================================================

# Sub-rotina para desenhar nuvem 1

desehar_nuvem1:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 7  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 10420      # Posição inicial (512*20) + (4x45)
	li $10, 12  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 10924      # Posição inicial (512*21) + (4x43)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 11432      # Posição inicial (512*22) + (4x42)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 11940      # Posição inicial (512*23) + (4x41)
	li $10, 23  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 12452      # Posição inicial (512*24) + (4x41)
	li $10, 23 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 12968      # Posição inicial (512*25) + (4x42)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 13484      # Posição inicial (512*26) + (4x43)
	li $10, 17		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 14004      # Posição inicial (512*27) + (4x44)
	li $10, 12 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor	
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 4  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 10428      # Posição inicial (512*20) + (4x45)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 10932      # Posição inicial (512*21) + (4x43)
	li $10, 11 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 11436      # Posição inicial (512*22) + (4x42)
	li $10, 15  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 11944      # Posição inicial (512*23) + (4x41)
	li $10, 18  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 12452      # Posição inicial (512*24) + (4x41)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 12968      # Posição inicial (512*25) + (4x42)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 13484      # Posição inicial (512*26) + (4x43)
	li $10, 13		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 14004      # Posição inicial (512*27) + (4x44)
	li $10, 7 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador
    	
#=================================================================================================================    	

# Sub-rotina para desenhar nuvem 2

desehar_nuvem2:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 7  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	

#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 4  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31

#=================================================================================================================	

desenha_Linha:
	beq $11, $10, retorna 	# Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	add $8, $8, $14        # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j desenha_Linha  
	

#=================================================================================================================

# Sub-rotina para desenhar o mar 1
desenha_mar1:
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 25600      # Posição inicial do mar (linha 50) 
	
	ori $9, $0, 0x6d9eeb 	# Cor do mar	
	li $10, 640    		# Número de unidades de pixels do mar (128*14)  
	li $11, 0      		# Contador         
	
for_mar1:
	
	beq $11, $10, ondas_mar1 # Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j for_mar1               

ondas_mar1:
    	add $25, $0, $31        # Salva o valor do registrador de retorno

    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 25092      # Posição inicial do mar (linha 48)

    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha

    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 24588      # Posição inicial da segunda linha do mar (linha 47)
    	jal forOndasTracos2    	# Chamada para desenhar a segunda linha

	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 24084      # Posição inicial da terceira linha do mar (linha 46)
	jal forOndasTracos3
    
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador

#=================================================================================================================

# Sub-rotina para desenhar o mar 2
desenha_mar2:
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 28160      # Posição inicial do mar (linha 55) 
	
	ori $9, $0, 0x3d85c6 	# Cor do mar	
	li $10, 512     	# Número de unidades de pixels do mar (128*14)  
	li $11, 0      		# Contador         
	
for_mar2:
	
	beq $11, $10, onda_mar2 # Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j for_mar2 

onda_mar2:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 27648      # Posição inicial do mar (linha 54)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
    	
	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 27136       
    	jal forOndasTracos2
    	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 26628       
    	jal forOndasTracos3
    	
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador     	
	
#=================================================================================================================

# Sub-rotina para desenhar o mar 3
desenha_mar3:
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 30208      # Posição inicial do mar (linha 59) 
	
	ori $9, $0, 0x0b5394 	# Cor do mar	
	li $10, 512      	# Número de unidades de pixels do mar (128*14)  
	li $11, 0      		# Contador         
	
for_mar3:
	
	beq $11, $10, onda_mar3 # Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j for_mar3 

onda_mar3:
	add $25, $0, $31        # Salva o valor do registrador de retorno
    	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 29712     	# Posição inicial do mar (linha 58)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
    	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 29204     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos2    	# Chamada para desenhar a primeira linha
    	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 28696     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos3    	# Chamada para desenhar a primeira linha	
    	
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador     	 


#=================================================================================================================

# Sub-rotina para desenhar o mar 3
desenha_mar4:
	
	lui $8, 0x1001   	# Primeiro endereço de memória	      
	addi $8, $8, 31232     	# Posição inicial do mar (linha 59) 
	
	ori $9, $0, 0x073763 	# Cor do mar	
	li $10, 512     	# Número de unidades de pixels do mar (128*14)  
	li $11, 0      		# Contador         
	
for_mar4:
	
	beq $11, $10, onda_mar4 # Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j for_mar4 

onda_mar4:
	add $25, $0, $31        # Salva o valor do registrador de retorno
    	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 30720      # Posição inicial do mar (linha 58)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
	
    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 30216     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos2    	# Chamada para desenhar a primeira linha
   	
   	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 29712     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos3    	# Chamada para desenhar a primeira linha
    	
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador     	 	


#------------------------------------- Primeira linha da onda ----------------------------------------------#

forOndasTracos1:
    	li $13, 0               # Inicializa o contador de traços

loop1Linha1:
    	beq $13, $12, retorna  	# Se todos os traços foram desenhados, retorna

    	# Desenha 12 pixels para o traço atual
    	li $10, 12              # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loop1Traco1:
    	beq $11, $10, onda1intervalo1 # Se todos os pixels do traço foram desenhados, vai para o intervalo
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loop1Traco1          	# Repetição do loop para desenhar o traço

onda1intervalo1:
    	addi $8, $8, 4          # Adiciona 1 pixel de intervalo
    	addi $13, $13, 1        # Incrementa o contador de traços
    	j loop1Linha1          	# Repetição do loop de traços

#------------------------------------- Segunda linha da onda ----------------------------------------------#

forOndasTracos2:
    	li $13, 0               # Inicializa o contador de traços

loop1Linha2:
    	beq $13, $12, retorna  	# Se todos os traços foram desenhados, retorna

    	# Desenha 8 pixels para o traço atual
    	li $10, 8               # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loop1Traco2:

	# Se todos os pixels do traço foram desenhados, vai para o intervalo
    	beq $11, $10, onda1intervalo2 
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loop1Traco2          	# Repetição do loop para desenhar o traço

onda1intervalo2:
    	addi $8, $8, 20         # Adiciona 1 pixel de intervalo
   	addi $13, $13, 1        # Incrementa o contador de traços
    	j loop1Linha2          	# Repetição do loop de traços		
                  	       	           	       	
#------------------------------------- Terceira linha da onda ---------------------------------------------#

forOndasTracos3:
    	li $13, 0               # Inicializa o contador de traços

loop1Linha3:
    	beq $13, $12, retorna  	# Se todos os traços foram desenhados, retorna

    	# Desenha 4 pixels para o traço atual
    	li $10, 4               # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loop1Traco3:
    	beq $11, $10, onda1intervalo3 # Se todos os pixels do traço foram desenhados, vai para o intervalo
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loop1Traco3        	# Repetição do loop para desenhar o traço

onda1intervalo3:
    	addi $8, $8, 36         # Adiciona 9 pixels de intervalo (9 * 4 = 36)
    	addi $13, $13, 1        # Incrementa o contador de traços
    	j loop1Linha3         	# Repetição do loop de traços    	       	           	       	