.text
.globl logicaFlor

# Reg utilizados: $8, $9, $10, $11
logicaFlor:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  # Recupera o contador para utilizar o ataque de pinha novamente
  lui $8, 0x1001
  addi $8, $8, 65572
  lw $9, 0($8)
  
  # cooldown padrao
  addi $10, $0, 32
  blt $9, $10, emCooldownAtaquePinhaFlor
  
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
  
  addi $4, $4, -4
  jal ataquePinhaFlor
  
  j retornoLogicaFlor
  
  
emCooldownAtaquePinhaFlor:
  # incremento contador de cooldown
  addi $9, $9, 1
  sw $9, 0($8)
  j retornoLogicaFlor
  
  
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
  
  j retornoLogicaFlor
  
  
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
  j retornoLogicaFlor


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
