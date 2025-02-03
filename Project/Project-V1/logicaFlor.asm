.text
.globl logicaFlor, reduzirVidaFlor

# Reg utilizados: $8, $9, $10, $11, $13
logicaFlor:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
hubAtaques:
  # Recupera o contador para utilizar o ataque de pinha novamente
  lui $8, 0x1001
  addi $8, $8, 65572
  lw $9, 0($8)
  
  # cooldown do ataque de pinha
  addi $10, $0, 128
  blt $9, $10, emCooldownAtaquePinhaFlor
  beq $9, $10, continueAtaquePinhaFlor
  
posCdTestAtqPinhaFlor:
  # Recupera o contador para utilizar o ataque missel novamente
  lui $8, 0x1001
  addi $8, $8, 65580
  lw $9, 0($8)
  # cooldown do ataque missel
  addi $10, $0, 320
  blt $9, $10, emCooldownAtaqueMisselFlor
  beq $9, $10, continueAtaqueMisselFlor
posCdTestAtqMisselFlor:
  
  j retornoLogicaFlor
  
  
continueAtaquePinhaFlor:
  # Recupera a posiçao que esta o ataque
  addi $8, $8, 4 # 65576
  lw $4, 0($8)
  
  # se a posicao do tiro for 0 ele nao esta na tela
  beq $4, $0, primeiroIterAtaquePinhaFlor
  
  # atualiza a posicao do ataque
  addi $4, $4, -4
  sw $4, 0($8) # atualiza a posicao do ataque
  
  # checa colisao do ataque com a parede invisivel na esquerda
  jal checarColisaoAtqHorizFlor
  beq $3, $0, desfazerAtaquePinhaFlorLogica
  
  # checa colisao da posicao que o ataque vai se mover com o cuphead
  lw $4, 0($8)
  add $5, $0, $24
  jal checarColisaoPinhaCupheadFlor
  beq $3, $0, acertouCupheadAtaquePinhaFlor
  
  # caso continue, o ataque deve continuar se movendo
  lw $4, 0($8) # endereço do ataque
  jal desfazerAtaquePinhaFlor
  
  jal ataquePinhaFlor
  
  j posCdTestAtqPinhaFlor
  
  
emCooldownAtaquePinhaFlor:
  # incremento contador de cooldown
  addi $9, $9, 1
  sw $9, 0($8)
  j posCdTestAtqPinhaFlor
  
  
primeiroIterAtaquePinhaFlor: 
  addi $9, $24, 5608 # centro do cuphead
  
  # Para evitar de parar de atacar ao sair da tela pra cima
  ble $9, $0, retornoLogicaFlor
  
  # pega a altura do cuphead
  addi $11, $0, 512
  div $9, $11 # pos do cuphead / 512 => lo = altura
  mflo $9
  
  # Define a posiçao do tiro com base na altura do cuphead
  mul $9, $9, $11
  addi $9, $9, 300 # Na altura do cuphead a esquerda
  
  # Define a posiçao inicial do tiro
  sw $9, 0($8)
  
  # desenha o primeiro iter do tiro
  add $4, $0, $9
  jal ataquePinhaFlor
  
  # checa colisao do tiro com o cuphead
  add $5, $0, $24
  jal checarColisaoPinhaCupheadFlor
  beq $3, $0, acertouCupheadAtaquePinhaFlor
  
  j posCdTestAtqPinhaFlor
  
  
acertouCupheadAtaquePinhaFlor:
  jal ajustarHpCuphead
  j desfazerAtaquePinhaFlorLogica
  
desfazerAtaquePinhaFlorLogica:
  # Recupera a posiçao do ataque
  lui $8, 0x1001
  addi $8, $8, 65576
  lw $4, 0($8)
  
  jal desfazerAtaquePinhaFlor
  
  # reset do timer de cooldown
  addi $8, $8, -4
  lw $9, 0($8)
  
  addi $9, $0, 0
  sw $9, 0($8)
  
  # reset da posicao do ataque
  addi $8, $8, 4
  sw $0, 0($8)
  j posCdTestAtqPinhaFlor
  



######################################
# Ataque missel flor

aparecerSeguraMisselFlor:
  # desenha o segura missel
  add $9, $0, $24 # canto superior esquerdo do cuphead
  
  # Para evitar de parar de atacar ao sair da tela pra cima
  blt $9, $0, posCdTestAtqMisselFlor
  
  # pega a distancia do personagem pra o teto
  addi $11, $0, 512
  div $9, $11 # pos do cuphead / 512 => lo = distancia do cuphead pro teto
  mflo $9
  
  # Pega a distancia horizontal do cuphead
  mul $11, $11, $9
  sub $9, $24, $11
  
  # atualiza a posiçao do segura missel
  addi $8, $8, 8 # 65592
  sw $9, 0($8)
  
  add $4, $0, $9 # posiçao do segura missel
  jal seguraMisselFlor
  
  # desenha na copia TEMPORARIAMENTE pra caso o jogador passe por cima
  add $4, $9, 32768
  jal seguraMisselFlor
  
  # Define a posiçao inicial do tiro
  addi $8, $8, -8
  addi $9, $9, 3092 # embaixo do segura missel
  sw $9, 0($8)
  
  j retornoLogicaFlor
  
  
  
continueAtaqueMisselFlor:
  # Recupera a posiçao que esta o ataque
  lui $8, 0x1001
  addi $8, $8, 65584
  lw $4, 0($8)
  
  # se a posicao do tiro for -1 ele nao esta na tela
  blt $4, $0, aparecerSeguraMisselFlor
  
  # Recupera o contador pra o segura missel soltar o missel
  addi $8, $8, 4 # 65588
  lw $9, 0($8)
  
  # cooldown pra soltar o missel
  addi $10, $0, 128
  blt $9, $10, perseguirSeguraMisselFlor
  addi $10, $0, 256
  blt $9, $10, emCooldownSoltarMisselFlor
  
  # se continuar aqui e para o tiro cair
  lui $8, 0x1001
  addi $8, $8, 65584
  # atualiza a posicao do ataque
  addi $4, $4, 512
  sw $4, 0($8) # atualiza a posicao do ataque
  
  # checa colisao do ataque com o chao
  jal checarColisaoAtqMisselChaoFlor
  beq $3, $0, desfazerAtaqueMisselFlorLogica
  
  # checa colisao da posicao que o ataque vai se mover com o cuphead
  lw $4, 0($8)
  add $5, $0, $24
  jal checarColisaoMisselCupheadFlor
  beq $3, $0, acertouCupheadAtaqueMisselFlor
  
  # caso continue, o ataque deve continuar se movendo
  lw $4, 0($8) # endereço do ataque
  addi $4, $4, -512
  jal desfazerAtaqueMisselFlor
  
  addi $4, $4, 512
  jal ataqueMisselFlor
  
  j posCdTestAtqMisselFlor
  
  
  
perseguirSeguraMisselFlor:
  # Recupera a posiçao do solta missel
  lui $8, 0x1001
  addi $8, $8, 65592
  lw $4, 0($8)
  
  # remoçao da copia
  add $4, $4, 32768
  jal desfazerSeguraMisselFlor
  # remoçao da tela principal
  add $4, $4, -32768
  jal desfazerSeguraMisselFlor
  
  # desenha o segura missel
  add $9, $0, $24 # canto superior esquerdo do cuphead
  
  # Para evitar de parar de atacar ao sair da tela pra cima
  blt $9, $0, posCdTestAtqMisselFlor
  
  # pega a distancia do personagem pra o teto
  addi $11, $0, 512
  div $9, $11 # pos do cuphead / 512 => lo = distancia do cuphead pro teto
  mflo $9
  
  # Pega a distancia horizontal do cuphead
  mul $11, $11, $9
  sub $9, $24, $11
  
  # atualiza a posiçao do segura missel
  sw $9, 0($8)
  
  add $4, $0, $9 # posiçao do segura missel
  jal seguraMisselFlor
  
  # desenha na copia TEMPORARIAMENTE pra caso o jogador passe por cima
  add $4, $9, 32768
  jal seguraMisselFlor
  
  # Define a posiçao inicial do tiro
  addi $8, $8, -8 # 65584
  addi $9, $9, 3092 # embaixo do segura missel
  sw $9, 0($8)
  
  # incremento contador de cooldown
  addi $8, $8, 4 # 65588
  lw $9, 0($8)
  addi $9, $9, 1
  sw $9, 0($8)
  j posCdTestAtqMisselFlor

  
emCooldownAtaqueMisselFlor:
  # incremento contador de cooldown
  addi $9, $9, 1
  sw $9, 0($8)
  j posCdTestAtqMisselFlor
  
  
emCooldownSoltarMisselFlor:
  # incremento contador de cooldown
  addi $9, $9, 1
  sw $9, 0($8)
  j posCdTestAtqMisselFlor
  
  
acertouCupheadAtaqueMisselFlor:
  jal ajustarHpCuphead
  j desfazerAtaqueMisselFlorLogica
  
desfazerAtaqueMisselFlorLogica:
  # Recupera a posiçao do solta missel
  lui $8, 0x1001
  addi $8, $8, 65592
  lw $4, 0($8)
  # remoçao da copia
  add $4, $4, 32768
  jal desfazerSeguraMisselFlor
  # remoçao da tela principal
  add $4, $4, -32768
  jal desfazerSeguraMisselFlor
  
  # remoçao do tiro
  addi $8, $8, -8 # 65584
  lw $4, 0($8)
  addi $4, $4, -512 # necessario pra desfazer completamente
  jal desfazerAtaqueMisselFlor
  
  # reset do timer de cooldown para aparecer o solta missel
  addi $8, $8, -4 # 65580
  sw $0, 0($8)
  
  # reset da posicao do ataque
  addi $8, $8, 4 # 65584
  addi $9, $0, -1
  sw $9, 0($8)
  
  # reset do timer de cooldown de soltar o missel
  addi $8, $8, 4 # 65588
  sw $0, 0($8)
  j posCdTestAtqMisselFlor
  
  
  

retornoLogicaFlor:
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  j continueAtaqueFlor
  
  
  
  
  
  
  
#########################################
# Fun�ao para reduzir a vida do boss
# Reg utilizados: $8, $9

reduzirVidaFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $8, 0x1001
  addi $8, $8, 65596
  lw $9, 0($8) # endere�o da vida do boss
  
  addi $9, $9, -1 
  # checa se o boss morreu
  ble $9, $0, derrotouBossFlor
  
  sw $9, 0($8)
  j retornoReduzirVidaFlor
  
derrotouBossFlor:
  j faseSereia # TODO - implementar tela de derrota do boss 
  
retornoReduzirVidaFlor:
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
