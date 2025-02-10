.text
.globl atacarCenarioFlor, refazerFundoTiroNormalCenarioFlor

###################################################
# funcao para os tiros ficarem saindo do personagem
# reg usados: $10, $11, $13, $14, $15
# $4 -> canto superior esquerdo do personagem

atacarCenarioFlor:  
  sw $4, 0($sp)
  addi $sp, $sp, -4

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
  lui $10, 0x1001
  addi $10, $10, 65560
  lw $4, 0($10)
  
  # checa a colisao do tiro com as bordar verticais
  
  # checa se o tiro esta pra direita ou esquerda
  addi $10, $10, 4
  lw $5, 0($10) # direcao do tiro, 1 = esquerda, 0 = direita
  
  # pega o canto superior esquerdo do tiro
  addi $10, $10, -4
  lw $4, 0($10)

  beq $5, $0, atacarCenarioFlorIndexZeroDireita
  
  jal checarColisaoTirosParedesCenarioFlor
  bne $3, $0, desfazerTiroCenarioFlorIndexZero # se o retorno da checagem de colisao diferente de 0 bateu em uma parede invisivel
  
  # Refaz o fundo onde estava o tiro
  lw $4, 0($10) # pega a posicao do tiro
  jal refazerFundoTiroNormalCenarioFlor
  
  # Cria novamente o tiro so que na nova posicao
  lw $4, 0($10) # pega a posicao antiga do tiro
  
  # ataque pra esquerda
  addi $4, $4, -4 # desloca o tiro 1 pixel pra esquerda
  sw $4, 0($10)  # atualiza na memoria a posiçao nova do tiro
  addi $5, $0, 0  # tipo do tiro
  jal criarAtaqueNormalCupheadFlor
  j retornoAtacarCenarioFlor
  
  
  
atacarCenarioFlorIndexZeroDireita:
  jal checarColisaoTirosParedesCenarioFlor
  bne $3, $0, acertouBossFlorAtqNormal # se o retorno da checagem de colisao diferente de 0 bateu em uma parede invisivel
  
  # Refaz o fundo onde estava o tiro
  lw $4, 0($10) # pega a posicao do tiro
  jal refazerFundoTiroNormalCenarioFlor
  
  # Cria novamente o tiro so que na nova posicao
  lw $4, 0($10) # pega a posicao antiga do tiro
  
  addi $4, $4, 4 # desloca o tiro 1 pixel pra direita
  sw $4, 0($10) # atualiza na memoria a posiçao nova do tiro
  addi $5, $0, 0 # tipo do tiro
  jal criarAtaqueNormalCupheadFlor
  j retornoAtacarCenarioFlor
  
  
  
primeiroIterAtacarCenarioFlorIndexZero:
  # Evita que ao pular o jogador pare de atirar pra sempre
  ble $24, $0, retornoAtacarCenarioFlor

  # pega a direçao que o jogador esta olhando
  lui $10, 0x1001
  addi $10, $10, 65548
  lw $11, 0($10)
  
  beq $11, $0, primeiroIterAtacarCenarioFlorIndexZeroOlhandoDireita
  # a partir daqui o jogador esta olhando pra esquerda
  
  add $11, $0, $4
  # checa se o jogador esta encostado na parede da esquerda para evitar o tiro atravessando pro outro lado
  add $4, $0, $24
  addi $5, $0, 0
  jal checarColisaoCenarioFlor
  bne $3, $0, retornoAtacarCenarioFlor
  ####################################
  add $4, $0, $11
  
  # Define a direçao do tiro como esquerda
  addi $10, $10, 16
  addi $11, $0, 1
  sw $11, 0($10)
  # define o canto superior esquerdo do tiro index 0
  addi $11, $4, 5608 # dois pixels a esquerda do dedo do personagem
  addi $10, $10, -4
  sw $11, 0($10)
  j continueAtacarCenarioFlorIndexZero
  
  
primeiroIterAtacarCenarioFlorIndexZeroOlhandoDireita:
  # Define a direçao do tiro como direita
  addi $10, $10, 16
  sw $0, 0($10)
  # define o canto superior esquerdo do tiro index 0
  addi $11, $4, 5708 # dois pixels a direita do dedo do personagem
  addi $10, $10, -4
  sw $11, 0($10)
  j continueAtacarCenarioFlorIndexZero
  
  
acertouBossFlorAtqNormal:
  jal reduzirVidaFlor
  jal danoBarraHpBoss
  j desfazerTiroCenarioFlorIndexZero
  
desfazerTiroCenarioFlorIndexZero:
  jal refazerFundoTiroNormalCenarioFlor
  # reseta a posiçao do tiro index 0 para 0 entao ele pode ser recriado na proxima iteraçao
  lui $10, 0x1001
  addi $10, $10, 65560
  sw $0, 0($10)
  j retornoAtacarCenarioFlor
  
  
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
  
  addi $sp, $sp, 4
  lw $4, 0($sp)
  
  j continueAtaqueNormalCenarioFlor
  
  
  
  
  
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
