.text
.globl atacarCenarioSereia

###################################################
# funcao para os tiros ficarem saindo do personagem
# reg usados: $10, $11, $13, $14, $15
# $4 -> canto superior esquerdo do personagem

atacarCenarioSereia:  
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
  beq $11, $0, primeiroIterAtacarCenarioSereia

continueAtacarCenarioSereia:
  # load na posicao do tiro
  lui $10, 0x1001
  addi $10, $10, 65560
  lw $4, 0($10)
  
  # checa a colisao do tiro com a parede da direita
  
  jal checarColisaoTirosParedesCenarioFlor
  bne $3, $0, acertouBossFlorAtqNormal # se o retorno da checagem de colisao diferente de 0 bateu em uma parede invisivel
  
  # Refaz o fundo onde estava o tiro
  lw $4, 0($10) # pega a posicao do tiro
  jal refazerFundoTiroNormalCenarioFlor
  
  # Cria novamente o tiro so que na nova posicao
  lw $4, 0($10) # pega a posicao antiga do tiro
  
  # ataque pra direita
  addi $4, $4, 4 # desloca o tiro 1 pixel pra direita
  sw $4, 0($10)  # atualiza na memoria a posiçao nova do tiro
  addi $5, $0, 0  # tipo do tiro
  jal criarAtaqueNormalCupheadFlor
  j retornoAtacarCenarioSereia
  
  
  
primeiroIterAtacarCenarioSereia:
  # Evita que ao pular o jogador pare de atirar pra sempre
  ble $24, $0, retornoAtacarCenarioSereia

  # pega a direçao que o jogador esta olhando
  lui $10, 0x1001
  addi $10, $10, 65560
  lw $11, 0($10)
  
  # define o canto superior esquerdo do tiro index 0
  addi $11, $4, 5708 # dois pixels a direita do dedo do personagem
  sw $11, 0($10)
  j continueAtacarCenarioSereia
  
  
acertouBossFlorAtqNormal:
  jal reduzirVidaSereia
  jal danoBarraHpBoss
  j desfazerTiroCenarioSereia
  
desfazerTiroCenarioSereia:
  jal refazerFundoTiroNormalCenarioFlor
  # reseta a posiçao do tiro index 0 para 0 entao ele pode ser recriado na proxima iteraçao
  lui $10, 0x1001
  addi $10, $10, 65560
  sw $0, 0($10)
  j retornoAtacarCenarioSereia
  
  
retornoAtacarCenarioSereia:
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
  
  j continueAtaqueCenarioSereia