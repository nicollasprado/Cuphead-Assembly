.text
.globl cenarioSereia

cenarioSereia:

 	sw $31, 0($29)
 	add $29, $29, -4 	
	# Primeiro endereço de memória para o display
	lui $8, 0x1001
	add $8, $8, $4        	
	
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
	
	# Chamada para desenhar o nuvem 1
	jal desehar_nuvem1
	
	# Chamada para desenhar o nuvem 2
	jal desehar_nuvem2
	
	# Chamada para desenhar o nuvem 3
	jal desehar_nuvem3
	
	# Chamada para desenhar o nuvem 4
	jal desehar_nuvem4

	# Chamada para desenhar o nuvem 5
	jal desehar_nuvem5	
	
	# Chamada para desenhar o nuvem 6
	jal desehar_nuvem6	
	
	addi $29, $29, 4
	lw $31, 0($29)
	add $4, $0, $0
	
	# Finalização do programa
	#addi $2, $0, 10
	#syscall
	
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
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 2604     	# Posição inicial (512*5) + (4x11)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3108     	# Posição inicial (512*6) + (4x9)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	      
	addi $8, $8, 28    	# espaço de 7 unidades de pixels, (4*7)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3612     	# Posição inicial (512*7) + (4x7)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 12    	# espaço de 3 unidades de pixels, (4*3)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4120     	# Posição inicial (512*8) + (4x6)
	li $10, 31 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4628 	# Posição inicial (512*9) + (4x5)
	li $10, 34 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5136     	# Posição inicial (512*10) + (4x4)
	li $10, 37 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5644     	# Posição inicial (512*11) + (4x3)
	li $10, 40 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6160     	# Posição inicial (512*12) + (4x4)
	li $10, 39 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6680     	# Posição inicial (512*13) + (4x6)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7204    	# Posição inicial (512*14) + (4x69)
	li $10, 30 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7760    	# Posição inicial (512*15) + (4x20)
	li $10, 16 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3116      	# Posição inicial (512*6) + (4x11)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 36    	# espaço de 9 unidades de pixels, (4*3)
	li $10, 3  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3620      	# Posição inicial (512*7) + (4x9)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 24    	# espaço de 6 unidades de pixels, (4*6)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4128      	# Posição inicial (512*8) + (4x8)
	li $10, 10  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	addi $8, $8, 20    	# espaço de 5 unidades de pixels, (4*5)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4632      	# Posição inicial (512*9) + (4x6)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5136      	# Posição inicial (512*10) + (4x4)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5644      	# Posição inicial (512*11) + (4x3)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*2)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6160      	# Posição inicial (512*12) + (4x4)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 4    	# espaço de 1 unidades de pixels, (4*1)
	li $10, 24 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha		
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6680      	# Posição inicial (512*13) + (4x6)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 9492      	# Posição inicial (512*18) + (4x69)
	li $10, 27		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7204      	# Posição inicial (512*14) + (4x9)
	li $10, 27		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7760      	# Posição inicial (512*15) + (4x20)
	li $10, 10		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31


#=================================================================================================================

# Sub-rotina para desenhar nuvem 2

desehar_nuvem2:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 7  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10420      # Posição inicial (512*20) + (4x45)
	li $10, 12  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10924      # Posição inicial (512*21) + (4x43)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 11432      # Posição inicial (512*22) + (4x42)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 11940      # Posição inicial (512*23) + (4x41)
	li $10, 23  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 12452      # Posição inicial (512*24) + (4x41)
	li $10, 23 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 12968      # Posição inicial (512*25) + (4x42)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13484      # Posição inicial (512*26) + (4x43)
	li $10, 17		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14004      # Posição inicial (512*27) + (4x44)
	li $10, 12 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor	
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 9916      	# Posição inicial (512*19) + (4x47)
	li $10, 4  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10428      # Posição inicial (512*20) + (4x45)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10932      # Posição inicial (512*21) + (4x43)
	li $10, 11 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 11436      # Posição inicial (512*22) + (4x42)
	li $10, 15  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 11944      # Posição inicial (512*23) + (4x41)
	li $10, 18  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 12452      # Posição inicial (512*24) + (4x41)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 12968      # Posição inicial (512*25) + (4x42)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13484      # Posição inicial (512*26) + (4x43)
	li $10, 13		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14004      # Posição inicial (512*27) + (4x44)
	li $10, 7 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador
    	
#=================================================================================================================    	

# Sub-rotina para desenhar nuvem 3

desehar_nuvem3:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13356      # Posição inicial (512*26) + (4x10)
	li $10, 7  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13860      # Posição inicial (512*27) + (4x9)
	li $10, 12  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14364      # Posição inicial (512*28) + (4x7)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14872      # Posição inicial (512*29) + (4x6)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15380      # Posição inicial (512*30) + (4x5)
	li $10, 23  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15892      # Posição inicial (512*31) + (4x5)
	li $10, 23 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16408      # Posição inicial (512*32) + (4x6)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16924      # Posição inicial (512*33) + (4x7)
	li $10, 17 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17444      # Posição inicial (512*34) + (4x8)
	li $10, 13 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor	
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13356      
	li $10, 4  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 13868      
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14372      
	li $10, 11 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14876      
	li $10, 15  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15384      
	li $10, 18  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15892      
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16408      
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16924      # Posição inicial (512*26) + (4x43)
	li $10, 14		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17444      # Posição inicial (512*27) + (4x44)
	li $10, 7 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador
    	
#=================================================================================================================

# Sub-rotina para desenhar nuvem 4

desehar_nuvem4:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4892     	# Posição inicial (512*9) + (4x71)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5396     	# Posição inicial (512*10) + (4x69)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	      
	addi $8, $8, 28    	# espaço de 7 unidades de pixels, (4*7)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5900     	# Posição inicial (512*11) + (4x67)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 12    	# espaço de 3 unidades de pixels, (4*3)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6408     	# Posição inicial (512*12) + (4x66)
	li $10, 31 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6916     	# Posição inicial (512*13) + (4x65)
	li $10, 34 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7424     	# Posição inicial (512*14) + (4x64)
	li $10, 37 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7932     	# Posição inicial (512*15) + (4x63)
	li $10, 40 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 8448     	# Posição inicial (512*16) + (4x64)
	li $10, 39 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 8968     	# Posição inicial (512*17) + (4x66)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 9492    	# Posição inicial (512*18) + (4x69)
	li $10, 30 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10048    	# Posição inicial (512*19) + (4x80)
	li $10, 16 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5404      	# Posição inicial (512*10) + (4x71)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 36    	# espaço de 9 unidades de pixels, (4*3)
	li $10, 3  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5908      	# Posição inicial (512*11) + (4x69)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 24    	# espaço de 6 unidades de pixels, (4*6)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6416      	# Posição inicial (512*12) + (4x68)
	li $10, 10  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	addi $8, $8, 20    	# espaço de 5 unidades de pixels, (4*5)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6920      	# Posição inicial (512*13) + (4x66)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7424      	# Posição inicial (512*14) + (4x64)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7932      	# Posição inicial (512*15) + (4x63)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*2)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 8448      	# Posição inicial (512*16) + (4x64)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 4    	# espaço de 1 unidades de pixels, (4*1)
	li $10, 24 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha		
	
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 8968      	# Posição inicial (512*17) + (4x66)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 9492      	# Posição inicial (512*18) + (4x69)
	li $10, 27		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 10048      	# Posição inicial (512*18) + (4x69)
	li $10, 10		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31
    	

#=================================================================================================================

# Sub-rotina para desenhar nuvem 5

desehar_nuvem5:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 14716     	# Posição inicial (512*28) + (4x95)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15220     	# Posição inicial (512*29) + (4x93)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	      
	addi $8, $8, 28    	# espaço de 7 unidades de pixels, (4*7)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15724     	# Posição inicial (512*30) + (4x91)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 12    	# espaço de 3 unidades de pixels, (4*3)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16232     	# Posição inicial (512*31) + (4x90)
	li $10, 31 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16740     	# Posição inicial (512*32) + (4x89)
	li $10, 34 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17248     	# Posição inicial (512*33) + (4x88)
	li $10, 37 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17756     	# Posição inicial (512*34) + (4x87)
	li $10, 40 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 18272     	# Posição inicial (512*35) + (4x88)
	li $10, 39 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 18792     	# Posição inicial (512*36) + (4x90)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 19316    	# Posição inicial (512*37) + (4x93)
	li $10, 30 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 19872    	# Posição inicial (512*38) + (4x104)
	li $10, 16 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15228      # Posição inicial (512*29) + (4x95)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 36    	# espaço de 9 unidades de pixels, (4*3)
	li $10, 3  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 15732      # Posição inicial (512*30) + (4x93)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 24    	# espaço de 6 unidades de pixels, (4*6)
	li $10, 5  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16240      # Posição inicial (512*31) + (4x92)
	li $10, 10  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	addi $8, $8, 20    	# espaço de 5 unidades de pixels, (4*5)
	li $10, 9  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 16744      	# Posição inicial (512*32) + (4x90)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17248      # Posição inicial (512*33) + (4x88)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*5)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 17756      	# Posição inicial (512*34) + (4x87)
	li $10, 13  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 8    	# espaço de 2 unidades de pixels, (4*2)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 18272      	# Posição inicial (512*35) + (4x88)
	li $10, 11  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	addi $8, $8, 4    	# espaço de 1 unidades de pixels, (4*1)
	li $10, 24 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha		
	
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 18792      	# Posição inicial (512*36) + (4x90)
	li $10, 35 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 19316     	# Posição inicial (512*37) + (4x93)
	li $10, 27		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 19872    	# Posição inicial (512*38) + (4x104)
	li $10, 10		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31




#=================================================================================================================

# Sub-rotina para desenhar nuvem 6

desehar_nuvem6:
	add $25, $0, $31        # Salva o valor do registrador de retorno
	
	ori $9, $0, 0xf4a29e	# Cor
		
	li $14, 4		# Controle de direcao (Horizontal)
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3000      	# Posição inicial (512*5) + (4x110)
	li $10, 7  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3504       # Posição inicial (512*6) + (4x108)
	li $10, 12  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4008       # Posição inicial (512*7) + (4x106)
	li $10, 17  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4516       # Posição inicial (512*8) + (4x105)
	li $10, 20  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5024       # Posição inicial (512*9) + (4x104)
	li $10, 23  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5536       # Posição inicial (512*10) + (4x104)
	li $10, 23 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6052       # Posição inicial (512*11) + (4x105)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6568      # Posição inicial (512*12) + (4x106)
	li $10, 17		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7088       # Posição inicial (512*13) + (4x108)
	li $10, 12 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha

#-----------------------------------------------------------------------------------------------------------------

	ori $9, $0, 0xe1827e	# Cor	
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3000      	# Posição inicial (512*5) + (4x110)
	li $10, 4  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 3512       # Posição inicial (512*6) + (4x110)
	li $10, 6  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4016       # Posição inicial (512*7) + (4x108)
	li $10, 11 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
		
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 4520       # Posição inicial (512*8) + (4x106)
	li $10, 15  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5028       # Posição inicial (512*9) + (4x105)
	li $10, 18  		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 5536       # Posição inicial (512*10) + (4x104)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6052       # Posição inicial (512*11) + (4x105)
	li $10, 20 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 6568      # Posição inicial (512*12) + (4x106)
	li $10, 13		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
	addi $8, $8, 7088       # Posição inicial (512*13) + (4x108)
	li $10, 7 		# Número de unidades de pixels
	li $11, 0      		# Contador    
	jal desenha_Linha
	
	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador
    	
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
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
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

    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 25092      # Posição inicial do mar (linha 48)

    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha

    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 24588      # Posição inicial da segunda linha do mar (linha 47)
    	jal forOndasTracos2    	# Chamada para desenhar a segunda linha

	lui $8, 0x1001
	add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 24084      # Posição inicial da terceira linha do mar (linha 46)
	jal forOndasTracos3
    
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador

#=================================================================================================================

# Sub-rotina para desenhar o mar 2
desenha_mar2:
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
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
	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 27648      # Posição inicial do mar (linha 54)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
    	
	lui $8, 0x1001
	add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 27136       
    	jal forOndasTracos2
    	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 26628       
    	jal forOndasTracos3
    	
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador     	
	
#=================================================================================================================

# Sub-rotina para desenhar o mar 3
desenha_mar3:
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
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
    	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 29712     	# Posição inicial do mar (linha 58)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
    	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 29204     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos2    	# Chamada para desenhar a primeira linha
    	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 28696     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos3    	# Chamada para desenhar a primeira linha	
    	
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador     	 


#=================================================================================================================

# Sub-rotina para desenhar o mar 3
desenha_mar4:
	
	lui $8, 0x1001
	add $8, $8, $4   	# Primeiro endereço de memória	      
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
    	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 30720      # Posição inicial do mar (linha 58)
    	
    	li $12, 10              # Número de traco para as linhas
    	jal forOndasTracos1    	# Chamada para desenhar a primeira linha
	
    	lui $8, 0x1001
		add $8, $8, $4          # Primeiro endereço de memória
    	addi $8, $8, 30216     	# Posição inicial do mar (linha 58)
    	jal forOndasTracos2    	# Chamada para desenhar a primeira linha
   	
   	lui $8, 0x1001
	add $8, $8, $4          # Primeiro endereço de memória
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
