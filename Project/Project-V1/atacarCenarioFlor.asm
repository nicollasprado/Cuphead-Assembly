.text
.globl atacarCenarioFlor

###################################################
# funcao para os tiros ficarem saindo do personagem
# reg usados: $10, $11, $13, $14, $15
# $4 -> canto superior esquerdo do personagem
# $5 -> index do tiro, 0 a 2

atacarCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  sw $14, 0($sp)
  addi $sp, $sp, -4
  
  sw $15, 0($sp)
  addi $sp, $sp, -4
  
  
  # beq $5
  
  # salva o endereço do jogador no reg 13
  add $13, $0, $4
  
  # Tiro index 0 a partir daqui
  # pega o canto superior esquerdo do tiro
  lui $10, 0x1001
  addi $10, $10, 65560
  lw $11, 0($10)
  
  # se o valor do canto superior esquerdo do tiro for 0 ele nao esta na tela
  beq $11, $0, primeiroIterAtacarCenarioFlorIndexZero
continueAtacarCenarioFlorIndexZero:
  # load na posicao do tiro
  lw $4, 0($10)
  
  # checa a colisao do tiro com as bordar verticais
  addi $10, $10, -12
  lw $5, 0($10)
  
  jal checarColisaoTirosParedesCenarioFlor
  bne $3, $0, desfazerTiroCenarioFlorIndexZero # se o retorno da checagem de colisao diferente de 0 bateu em uma parede invisivel
  
  # Refaz o fundo onde estava o tiro
  addi $10, $10, 12
  lw $4, 0($10) # pega a posicao do tiro
  jal refazerFundoTiroNormalCenarioFlor
  
  # Cria novamente o tiro so que na nova posicao
  lw $4, 0($10) # pega a posicao antiga do tiro
  
  # checa se o tiro esta pra direita ou esquerda
  addi $13, $13, 5652
  # se o endereço do tiro for maior que 5652 o tiro esta indo pra direita
  bgt $4, $13, atacarCenarioFlorIndexZeroDireita
  
  # ataque pra esquerda
  addi $4, $4, -8 # desloca o tiro 2 pixels pra esquerda
  sw $4, 0($10)  # atualiza na memoria a posiçao nova do tiro
  addi $5, $0, 0  # tipo do tiro
  jal criarAtaqueNormalCupheadFlor
  j continueMovCenarioFlor
  
  
  
atacarCenarioFlorIndexZeroDireita:
  addi $4, $4, 8 # desloca o tiro 2 pixels pra direita
  sw $4, 0($10) # atualiza na memoria a posiçao nova do tiro
  addi $5, $0, 0 # tipo do tiro
  jal criarAtaqueNormalCupheadFlor
  j continueMovCenarioFlor
  
  
  
primeiroIterAtacarCenarioFlorIndexZero:
  # pega a direçao que o jogador esta olhando
  lui $10, 0x1001
  addi $10, $10, 65548
  lw $11, 0($10)
  
  beq $11, $0, primeiroIterAtacarCenarioFlorIndexZeroOlhandoDireita
  # a partir daqui o jogador esta olhando pra esquerda
  # define o canto superior esquerdo do tiro index 0
  addi $11, $4, 5624 # dois pixels a esquerda do dedo do personagem
  addi $10, $10, 12
  sw $11, 0($10)
  j continueAtacarCenarioFlorIndexZero
  
  
primeiroIterAtacarCenarioFlorIndexZeroOlhandoDireita:
  addi $11, $4, 5708 # dois pixels a direita do dedo do personagem
  addi $10, $10, 12
  sw $11, 0($10)
  j continueAtacarCenarioFlorIndexZero
  
  
desfazerTiroCenarioFlorIndexZero:
  # reseta a posiçao do tiro index 0 para 0 entao ele pode ser recriado na proxima iteraçao
  lui $10, 0x1001
  addi $10, $10, 65560
  sw $0, 0($10)
  j continueMovCenarioFlor
  
  
retornoAtacarCenarioFlor:
  addi $4, $0, 0
  addi $5, $0, 0
  
  addi $sp, $sp, 4
  lw $15, 0($sp)
  
  addi $sp, $sp, 4
  lw $14, 0($sp)
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  
  
  
  
###################################################
# Funçao para refazer o fundo atras do tiro normal
# reg usados: $8, $9, $10, $11, $13, $14
# $4 -> canto superior esquerdo do tiro

refazerFundoTiroNormalCenarioFlor:
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
  
  sw $14, 0($sp)
  addi $sp, $sp, -4
  
  
  # ponteiro pro canto superior esquerdo do tiro
  lui $8, 0x1001
  add $8, $8, $4
  # ponteiro pro canto superior do tiro so que na area da memoria da copia do cenario
  lui $13, 0x1001
  addi $13, $13, 32768
  add $13, $13, $4
  
  # Largura do tiro
  addi $10, $0, 6
  addi $11, $0, 0
forRefazerFundoTiroNormalCenarioFlor:
  beq $10, $11, retornoRefazerFundoTiroNormalCenarioFlor
  
  lw $14, 0($13) # pega a cor que esta armazenada na posicao da memoria da copia
  sw $14, 0($8)
  
  lw $14, 512($13)
  sw $14, 512($8)
  addi $13, $13, 4
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRefazerFundoTiroNormalCenarioFlor
  

retornoRefazerFundoTiroNormalCenarioFlor:
  addi $4, $0, 0
  
  addi $sp, $sp, 4
  lw $14, 0($sp)
  
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