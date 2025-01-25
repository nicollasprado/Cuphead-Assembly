.text
.globl criarIndicadorHP, ajustarHpCuphead

criarIndicadorHP:
  addi $10, $0, 20
  addi $11, $0, 0
  
  lui $8, 0x1001
  addi $8, $8, 27168 # Define o ponto de inicio da moldura
  
  add $25, $0, $8   # salva no reg 25 o endereço de inicio da moldura
forMoldura:
  beq $10, $11, lateraisMoldura #preencherMoldura
  ori $9, $0, 0x000000
  
  sw $9, 0($8)    # parte de cima
  sw $9, 4096($8) # parte de baixo
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forMoldura
  
lateraisMoldura:
  addi $8, $25, 512 # Inicio das laterais
  
  addi $10, $0, 7
  addi $11, $0, 0
forLateraisMoldura:
  beq $10, $11, preencherMoldura
  
  sw $9, 0($8)    # esquerda
  sw $9, 76($8)   # direita
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateraisMoldura
  
  
preencherMoldura:
  ori $9, $0, 0xf1c232
  addi $8, $25, 516  # inicio do interior da moldura
  
  addi $10, $0, 18
  addi $11, $0, 0
forPreencherMoldura:
  beq $10, $11, txtHP
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  sw $9, 2560($8)
  sw $9, 3072($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherMoldura

txtHP:
  ori $9, $0, 0x000000
  addi $8, $25, 1032 # inicio do texto de hp
  add $25, $0, $8    # armazena no reg 25 o inicio do H
  
  sw $9, 1028($8)    # pixel do centro do H
  
  addi $10, $0, 5
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
  
  sw $9, 4($8)    # lateral do p
  sw $9, 8($8)    # lateral do p
  sw $9, 1028($8) # lateral do p
  sw $9, 1028($8) # lateral do p
  sw $9, 520($8)  # lateral do p
  sw $9, 1032($8) # lateral do p
  
  sw $9, 2060($8) # ponto
  
  addi $10, $0, 5
  addi $11, $0, 0
forLateralP:
  beq $10, $11, txtTres
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralP
  
  
txtTres:
  addi $8, $8, -2524
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, 512($8)
  sw $9, 1020($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2040($8)
  sw $9, 2044($8)
  sw $9, 2048($8)



retorno:
  jr $31





####################
# Funçao para atualizar o HP do jogador ao tomar dano
# Reg utilizados: $8, $9, $10, $11, $13

ajustarHpCuphead:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  
  # Recupera a qtd de vidas que o jogador tem no momento
  lui $8, 0x1001
  addi $8, $8, 65568
  lw $13, 0($8)
  # altera a vida na memoria
  addi $13, $13, -1
  sw $13, 0($8)
  
  
  # Alteraçao visual
  lui $8, 0x1001
  addi $8, $8, 28244 # Define o ponto de inicio dos numeros do display
  
  # Desfaz o numero que estava antes
  ori $9, $0, 0xf1c232 # amarelo

  # tamanho das colunas
  addi $10, $0, 5
  addi $11, $0, 0 
forRefazerFundoAjustarHpCuphead:
  beq $11, $10, desenharNumeroHpAjustarHpCuphead
  
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forRefazerFundoAjustarHpCuphead
  
  
desenharNumeroHpAjustarHpCuphead:
  lui $8, 0x1001
  addi $8, $8, 28244 # Define o ponto de inicio dos numeros do display
  ori $9, $0, 0x000000
  
  # checagem pra desenhar a vida atual do jogador
  beq $13, $0, retornoAjustarHpCuphead
  
  addi $10, $0, 2
  beq $13, $10, desenharNumeroDoisHpAjustarHpCuphead
  
  addi $10, $0, 1
  beq $13, $10, desenharNumeroUmHpAjustarHpCuphead
  
  # default
  j retornoAjustarHpCuphead
  
desenharNumeroDoisHpAjustarHpCuphead:
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  sw $9, 2052($8)
  sw $9, 2056($8)
  j retornoAjustarHpCuphead
  
desenharNumeroUmHpAjustarHpCuphead:
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 516($8)
  sw $9, 1028($8)
  sw $9, 1540($8)
  sw $9, 2048($8)
  sw $9, 2052($8)
  sw $9, 2056($8)
  j retornoAjustarHpCuphead
  
  
retornoAjustarHpCuphead:
  addi $sp, $sp, 4
  lw $13, 0($sp)
 
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31