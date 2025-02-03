.text
.globl checarColisaoCupheadAviaoBordas

# $4 -> canto superior esquerdo do cuphead aviao
# $5 -> direçao que o jogador esta indo, 0 = direita, 1 = esquerda, 2 = baixo, 3 = cima
# Retorno -> $3, 0 = pode continuar andando, 1 = colisao detectada
# Regs utilizados: $8, $9, $10, $11, $13, $14, $15
checarColisaoCupheadAviaoBordas:
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
  
  sw $15, 0($sp)
  addi $sp, $sp, -4
  
  addi $3, $0, 0 # so pra garantir que o $3 começa com 0
  
  # checa se esta indo pra direita
  #beq $5, $0, checarColisaoCupheadAviaoDireita
  # checa se esta indo pra esquerda
  #addi $8, $0, 1
  #beq $5, $8, checarColisaoCupheadAviaoEsquerda
  # checa se esta indo pra baixo
  #addi $8, $0, 2
  #beq $5, $8, checarColisaoCupheadAviaoBaixo
  
  
  # Continuando aqui sera checagem pra cima
  # Se a posicao do canto superior esquerdo do personagem for menor que 76 (canto superior direito do teto antes da sereia)
  addi $8, $0, 76
  blt $4, $8, colisaoDetectadaCupheadAviaoBordas

  j retornoChecarColisaoCupheadAviaoBordas
  
  
  
  
colisaoDetectadaCupheadAviaoBordas:
  addi $3, $0, 1
  j retornoChecarColisaoCupheadAviaoBordas
  
retornoChecarColisaoCupheadAviaoBordas:
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
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  