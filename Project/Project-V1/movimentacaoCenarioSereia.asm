.text
.globl andarEsquerdaCenarioSereia, andarDireitaCenarioSereia, andarBaixoCenarioSereia, andarCimaCenarioSereia

# Regs utilizados: $8, $9, $10
andarEsquerdaCenarioSereia:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  
  # Pega a velocidade do jogador
  lui $8, 0x1001
  addi $8, $8, 65544
  lw $9, 0($8)
  
  addi $10, $0, 4
  mul $9, $9, $10 # velocidade x 4 = pixels que o personagem ira andar
  addi $10, $0, -1
  mul $9, $9, $10 # negativa pq e pra esquerda
  
  addi $5, $0, 1 # indo pra esquerda
  jal checarColisaoCupheadAviaoBordas
  bne $3, $0, retornoAndarEsquerdaCenarioSereia

  jal desfazerCupheadAviao
  
  # atualiza a posicao
  add $24, $4, $9
  add $4, $0, $24
  jal criarCupheadAviao
  
  j retornoAndarEsquerdaCenarioSereia
  
retornoAndarEsquerdaCenarioSereia:
  addi $sp, $sp, 4
  lw $10, 0($sp)

  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  j continueMovCenarioSereia
  
  
  
  
##################################################
# Funçao pra andar pra direita cuphead aviao
# Regs utilizados: $8, $9, $10
andarDireitaCenarioSereia:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  
  # Pega a velocidade do jogador
  lui $8, 0x1001
  addi $8, $8, 65544
  lw $9, 0($8)
  
  addi $10, $0, 4
  mul $9, $9, $10 # velocidade x 4 = pixels que o personagem ira andar
  
  addi $5, $0, 0 # indo pra direita
  jal checarColisaoCupheadAviaoBordas
  bne $3, $0, retornoAndarDireitaCenarioSereia

  jal desfazerCupheadAviao
  
  # atualiza a posicao
  add $24, $4, $9
  add $4, $0, $24
  jal criarCupheadAviao
  
  j retornoAndarDireitaCenarioSereia
  
  
  
retornoAndarDireitaCenarioSereia:
  addi $sp, $sp, 4
  lw $10, 0($sp)

  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  j continueMovCenarioSereia
  
  
  
##################################################
# Funçao pra andar pra cima cuphead aviao
# Regs utilizados: $8, $9, $10
andarCimaCenarioSereia:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  
  # Pega a velocidade do jogador
  lui $8, 0x1001
  addi $8, $8, 65544
  lw $9, 0($8)
  
  addi $10, $0, -512
  mul $9, $9, $10 # velocidade x -512 = pixels que o personagem ira andar
  
  addi $5, $0, 3 # indo pra cima
  jal checarColisaoCupheadAviaoBordas
  bne $3, $0, retornoAndarCimaCenarioSereia
  
  jal desfazerCupheadAviao
  
  # atualiza a posicao
  add $24, $24, $9
  add $4, $0, $24
  jal criarCupheadAviao
  
  j retornoAndarCimaCenarioSereia
  
  
  
retornoAndarCimaCenarioSereia:
  addi $sp, $sp, 4
  lw $10, 0($sp)

  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  j continueMovCenarioSereia
  
  
  
  
##################################################
# Funçao pra andar pra baixo cuphead aviao
# Regs utilizados: $8, $9, $10
andarBaixoCenarioSereia:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  
  # Pega a velocidade do jogador
  lui $8, 0x1001
  addi $8, $8, 65544
  lw $9, 0($8)
  
  addi $10, $0, 512
  mul $9, $9, $10 # velocidade x 512 = pixels que o personagem ira andar
  
  addi $5, $0, 2 # indo pra baixo
  jal checarColisaoCupheadAviaoBordas
  bne $3, $0, retornoAndarBaixoCenarioSereia

  jal desfazerCupheadAviao
  
  # atualiza a posicao
  add $24, $24, $9
  add $4, $0, $24
  jal criarCupheadAviao
  
  j retornoAndarBaixoCenarioSereia
  
  
  
retornoAndarBaixoCenarioSereia:
  addi $sp, $sp, 4
  lw $10, 0($sp)

  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  j continueMovCenarioSereia
  
  
