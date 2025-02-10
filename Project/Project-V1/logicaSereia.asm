.text
.globl logicaSereia, reduzirVidaSereia

logicaSereia:
  sw $4, 0($sp)
  addi $sp, $sp, -4
  

  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  # Recupera o contador para utilizar o ataque do fantasma
  lui $8, 0x1001
  addi $8, $8, 65572
  lw $9, 0($8)
  
  # cooldown do ataque do fantasma
  addi $10, $0, 192
  blt $9, $10, emCooldownAtaqueFantasmaSereia
  beq $9, $10, continueAtaqueFantasmaSereia
posCdTestAtqFantasmaSereia:
  j retornoLogicaSereia
  

emCooldownAtaqueFantasmaSereia:
  # incremento contador de cooldown
  addi $9, $9, 1
  sw $9, 0($8)
  j posCdTestAtqFantasmaSereia
  
  
continueAtaqueFantasmaSereia:
  # Recupera a posiçao que esta o ataque
  addi $8, $8, 4 # 65576
  lw $4, 0($8)
  
  # se a posicao do tiro for 0 ele nao esta na tela
  beq $4, $0, primeiroIterAtaqueFantasmaSereia
  
  # atualiza a posicao do ataque
  addi $4, $4, -4
  sw $4, 0($8) # atualiza a posicao do ataque
  
  # checa colisao do ataque com a parede invisivel na esquerda
  jal checarColisaoAtqHorizFlor
  beq $3, $0, desfazerAtaqueFantasmaSereiaLogica
  
  # checa colisao da posicao que o ataque vai se mover com o cuphead
  lw $4, 0($8)
  add $5, $0, $24
  jal checarColisaoFantasmaCuphead
  beq $3, $0, acertouCupheadAtaqueFantasmaSereia
  
  # caso continue, o ataque deve continuar se movendo
  lw $4, 0($8) # endereço do ataque
  jal desfazerFantasma
  
  jal desenharFantasma
  
  j posCdTestAtqFantasmaSereia
  
  
  
primeiroIterAtaqueFantasmaSereia: 
  addi $9, $24, 1512 # centro do cuphead
  
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
  jal desenharFantasma
  
  # checa colisao do tiro com o cuphead
  add $5, $0, $24
  jal checarColisaoFantasmaCuphead
  beq $3, $0, acertouCupheadAtaqueFantasmaSereia
  
  j retornoLogicaSereia
  
  
acertouCupheadAtaqueFantasmaSereia:
  jal ajustarHpCuphead
  j desfazerAtaqueFantasmaSereiaLogica
  
  
desfazerAtaqueFantasmaSereiaLogica:
  # Recupera a posiçao do ataque
  lui $8, 0x1001
  addi $8, $8, 65576
  lw $4, 0($8)
  
  jal desfazerFantasma
  
  # reset do timer de cooldown
  addi $8, $8, -4
  lw $9, 0($8)
  
  addi $9, $0, 0
  sw $9, 0($8)
  
  # reset da posicao do ataque
  addi $8, $8, 4
  sw $0, 0($8)
  j posCdTestAtqFantasmaSereia
  
  
retornoLogicaSereia:
  addi $sp, $sp, 4
  lw $4, 0($sp)

  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  j continueAtaqueLogicaCenarioSereia
  
  
  
#########################################
# Fun�ao para reduzir a vida do boss
# Reg utilizados: $8, $9

reduzirVidaSereia:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $8, 0x1001
  addi $8, $8, 65596
  lw $9, 0($8) # endere�o da vida do boss
  
  # pega o dano do jogador
  #addi $8, $8, -56
  #lw $10, 0($8)
  
  addi $9, $9, -1
  # checa se o boss morreu
  ble $9, $0, derrotouBossSereia
  
  sw $9, 0($8)
  j retornoReduzirVidaSereia
  
derrotouBossSereia:
  j main # TODO - implementar tela de derrota do boss 
  
retornoReduzirVidaSereia:
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31