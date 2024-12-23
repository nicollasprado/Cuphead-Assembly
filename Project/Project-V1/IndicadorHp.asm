.text
.globl criarIndicadorHP

criarIndicadorHP:
  addi $10, $0, 16
  addi $11, $0, 0
  addi $8, $8, -4088 # Define o ponto de inicio da moldura
  add $25, $0, $8   # salva no reg 25 o endereço de inicio da moldura
forMoldura:
  beq $10, $11, lateraisMoldura #preencherMoldura
  ori $9, $0, 0x00ff00
  
  sw $9, 0($8)    # parte de cima
  sw $9, 3072($8) # parte de baixo
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forMoldura
  
lateraisMoldura:
  addi $8, $25, 512 # Inicio das laterais
  
  addi $10, $0, 5
  addi $11, $0, 0
forLateraisMoldura:
  beq $10, $11, preencherMoldura
  
  sw $9, 0($8)    # esquerda
  sw $9, 60($8)   # direita
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateraisMoldura
  
  
preencherMoldura:
  ori $9, $0, 0xffd500
  addi $8, $25, 516  # inicio do interior da moldura
  
  addi $10, $0, 14
  addi $11, $0, 0
forPreencherMoldura:
  beq $10, $11, txtHP
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherMoldura

txtHP:
  ori $9, $0, 0x000000
  addi $8, $25, 1032 # inicio do texto de hp
  add $25, $0, $8    # armazena no reg 25 o inicio do H
  
  sw $9, 516($8)    # pixel do centro do H
  
  addi $10, $0, 3
  addi $11, $0, 0
forLateraisH:
  beq $10, $11, txtP
  
  sw $9, 0($8)
  sw $9, 8($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateraisH


txtP:
  addi $8, $25, 16 # define o inicio do P
  add $25, $0, $8 # salva no reg 25 o inicio do P
  
  sw $9, 4($8)   # lateral do p
  sw $9, 516($8) # lateral do p
  sw $9, 1032($8)
  
  addi $10, $0, 3
  addi $11, $0, 0
forLateralP:
  beq $10, $11, retorno
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralP

retorno:
  jr $31
