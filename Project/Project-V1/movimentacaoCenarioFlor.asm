.text
.globl pularCenarioFlor, checarPuloCenarioFlor, andarEsquerdaCenarioFlor, andarDireitaCenarioFlor, descerPularCenarioFlor, descerPlataformaCenarioFlor



#####################
# funçao para o personagem andar pra esquerda
# Registradores usados: $10, $11, $13

andarEsquerdaCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4


  add $4, $0, $24
  addi $5, $0, 0
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continueMovCenarioFlor # se o retorno da checagem de colisao diferente de 0 nao pode andar
  
  # pintar fundo atras do personagem
  add $5, $0, $24   # canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  # desenha o personagem
  lui $10, 0x1001
  addi $10, $10, 65544
  lw $13, 0($10)    # pega a velocidade do jogador
  mul $13, $13, 4   # ajusta pra qtd de pixels
  mul $13, $13, -1  # negativa pra andar pra esquerda
  
  add $4, $24, $13  # novo endereço do cuphead
  addi $5, $0, 1    # 1 = olhando pra esquerda
  jal desenharCuphead
  
  addi $10, $10, 4 # endereço que guarda a direçao que esta olhando
  addi $11, $0, 1  # esquerda
  sw $11, 0($10)
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  jal checarColisaoPlataformaCenarioFlor
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j posMovHorizontalFlor
  



#####################
# funçao para o personagem andar pra direita
# Registradores usados: $10, $11
  
andarDireitaCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4


  add $4, $0, $24 # pos do personagem
  addi $5, $0, 1  # olhando pra direita
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continueMovCenarioFlor # se o retorno da checagem de colisao diferente de 0 nao pode andar
  
  # pintar o fundo atras do personagem
  add $5, $0, $24
  jal refazerFundoCenarioFlor
  
  lui $10, 0x1001
  addi $10, $10, 65544
  lw $11, 0($10)    # pega a velocidade do jogador
  mul $11, $11, 4   # ajusta pra qtd de pixels
  
  add $4, $24, $11   # endereço do cuphead
  addi $5, $0, 0    # 0 = olhando pra direita
  jal desenharCuphead
  
  addi $10, $10, 4 # endereço que guarda a direçao que esta olhando
  sw $0, 0($10)    # 0 = direita
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  jal checarColisaoPlataformaCenarioFlor
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
 
 
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j posMovHorizontalFlor
  
  



#####################
# funçao para o personagem pular no cenario da flor
# Registradores usados: $10, $11, $13

pularCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  
  # altera o estado de pulo do jogador
  lui $10, 0x1001
  addi $10, $10, 65552
  sw $0, 0($10)
  
  # resgatar a altura atual do personagem
  addi $10, $10, 4
  lw $11, 0($10)
  
  addi $13, $0, 25 # qtd de pixels pra cima (altura do pulo)
  bge $11, $13, descerPularCenarioFlor
  
  # pintar o fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, -512 # endereço do cuphead

  addi $10, $10, -8
  lw $5, 0($10)      # para onde esta olhando
  jal desenharCuphead
  
  add $24, $0, $4    # atualiza a posiçao do jogador
  
  # atualiza a altura do personagem
  addi $10, $10, 8
  lw $11, 0($10)
  
  addi $11, $11, 1
  sw $11, 0($10)
  
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  
  
  
#####################
# funçao para o personagem descer apos pular no cenario da flor
# Registradores usados: $10, $11
  
descerPularCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
 
  
  # define o estado de pulo do jogador como descendo de pulo
  lui $10, 0x1001
  addi $10, $10, 65552
  addi $11, $0, 2 # descendo de pulo
  sw $11, 0($10)
  
  # pega a altura do jogador
  addi $10, $10, 4
  lw $11, 0($10)
  
  beq $11, $0, fimQuedaCenarioFlor
  
  # pintar fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 512     # novo endereço do cuphead
  # direçao que esta olhando
  addi $10, $10, -8
  lw $5, 0($10)
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  jal checarColisaoPlataformaCenarioFlor
  beq $3, $0, subiuPlataformaPulo
  
  # atualiza a altura do personagem
  addi $10, $10, 8
  lw $11, 0($10)
  
  addi $11, $11, -1
  sw $11, 0($10)
  
  
  
  addi $sp, $sp, 4
  lw $12, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  
subiuPlataformaPulo:
  # atualiza o estado de pulo do jogador para em piso
  lui $10, 0x1001
  addi $10, $10, 65552
  addi $11, $0, 1
  sw $11, 0($10)
  j continueMovCenarioFlor
  
fimQuedaCenarioFlor:
  jal checarColisaoPlataformaCenarioFlor
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  
  # atualiza o estado de pulo do jogador
  lui $10, 0x1001
  addi $10, $10, 65552
  addi $11, $0, 1
  sw $11, 0($10)
  
  
  addi $sp, $sp, 4
  lw $12, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  


#####################
# funçao para o personagem descer ao clicar S em uma plataforma
# Registradores usados: $10, $11, $13, $14
  
descerPlataformaCenarioFlor:
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  sw $14, 0($sp)
  addi $sp, $sp, -4
  
 
  # checa se o player esta na altura das plataformas
  addi $10, $0, 14332 # ultimo pixel a direita na altura das plataformas
  bgt $24, $10, testarHitboxLateraisPlataformasCenarioFlor

continueTestarHitboxLateraisPlataformasCenarioFlor:
  # atualiza o estado do jogador para descendo de plataforma
  lui $10, 0x1001
  addi $10, $10, 65552
  
  addi $13, $0, 3 # estado de descendo plataforma
  sw $13, 0($10)
  
  # pega a altura do jogador
  addi $10, $10, 4
  lw $13, 0($10)
  
  # desce o player da plataforma
  addi $14, $0, 1
  beq $13, $14, fimDescerPlataformaCenarioFlor
  
  # pinta o fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 512 # endereço do cuphead
  # endereço que guarda a direçao que esta olhando
  addi $10, $10, -8
  lw $5, 0($10)     # direçao que esta olhando
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  # atualiza a altura do jogador
  addi $10, $10, 8
  addi $13, $13, -1
  sw $13, 0($10)
  
  
  
  addi $sp, $sp, 4
  lw $14, 0($sp)
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  
testarHitboxLateraisPlataformasCenarioFlor:
  # pega a altura do jogador
  lui $10, 0x1001
  addi $10, $10, 65556
  lw $13, 0($10)
  
  ble $13, $0, foraPlataformaDescerPlataformaCenarioFlor
  j continueTestarHitboxLateraisPlataformasCenarioFlor
  
  
foraPlataformaDescerPlataformaCenarioFlor:
  # atualiza o estado do jogador para em piso
  lui $10, 0x1001
  addi $10, $10, 65552
  addi $13, $0, 1 # estado de em piso
  sw $13, 0($10)
  j continueMovCenarioFlor
  

fimDescerPlataformaCenarioFlor:
  # atualiza o estado do jogador para no chao
  lui $10, 0x1001
  addi $10, $10, 65552
  addi $13, $0, 1
  sw $13, 0($10)
  
  # reseta o contador da altura
  lui $10, 0x1001
  addi $10, $10, 65556
  sw $0, 0($10)
  
  
  
  addi $4, $0, 0
  
  addi $sp, $sp, 4
  lw $14, 0($sp)
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  j continueMovCenarioFlor
  
  
  
#####################
# funçao para checar se o personagem esta pulando
# Registradores usados: $10
# retorno: $3

checarPuloCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $10, 0x1001
  addi $10, $10, 65552 # endereco que guarda se esta pulando
  lw $3, 0($10)
  
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
      
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31 