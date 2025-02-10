.text
.globl checarColisaoCupheadAviaoBordas, checarColisaoFantasmaCuphead

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
  beq $5, $0, checarColisaoCupheadAviaoDireita
  # checa se esta indo pra esquerda
  addi $8, $0, 1
  beq $5, $8, checarColisaoCupheadAviaoEsquerda
  # checa se esta indo pra baixo
  addi $8, $0, 2
  beq $5, $8, checarColisaoCupheadAviaoBaixo
  
  
  # Continuando aqui sera checagem pra cima
  # Se a posicao do canto superior esquerdo do personagem for menor que 412 (canto superior direito do teto antes da sereia)
  addi $8, $0, 412
  addi $9, $4, -1024
  
  blt $9, $8, colisaoDetectadaCupheadAviaoBordas

  j retornoChecarColisaoCupheadAviaoBordas
  

checarColisaoCupheadAviaoDireita:
  # vai pro canto superior direito do personagem
  addi $15, $4, 84

  addi $8, $0, 408
  
  # altura da parede invisivel
  addi $10, $0, 64
  addi $11, $0, 0
forChecarColisaoCupheadAviaoDireita:
  beq $10, $11, retornoChecarColisaoCupheadAviaoBordas
  
  beq $8, $15, colisaoDetectadaCupheadAviaoBordas
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forChecarColisaoCupheadAviaoDireita
  
  
checarColisaoCupheadAviaoEsquerda:
  addi $8, $0, 0 # para garantir que começara com zero
  
  # altura da parede invisivel
  addi $10, $0, 64
  addi $11, $0, 0
forChecarColisaoCupheadAviaoEsquerda:
  beq $10, $11, retornoChecarColisaoCupheadAviaoBordas
  
  beq $8, $4, colisaoDetectadaCupheadAviaoBordas
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forChecarColisaoCupheadAviaoEsquerda
  
  
checarColisaoCupheadAviaoBaixo:
  addi $8, $0, 26624 # topo do mar
  addi $9, $4, 8704  # um pixel abaixo do aviao
  
  bge $9, $8, colisaoDetectadaCupheadAviaoBordas
  
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
  
  
  
  
#####################
# funçao para checar as colisoes dos ataques de fantasma da sereia com o cuphead
# $4 => canto superior esquerdo do ataque
# $5 => canto superior esquerdo do cuphead
# Retorno: $3 => 0 = encostou no cuphead, 1 = nao encostou
# Registradores usados: $10, $11

checarColisaoFantasmaCuphead:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  addi $3, $0, 1 # começa negado
  
  addi $5, $5, 80 # ajuste pra pegar o canto superior direito do cuphead
  
  # tamanho do cuphead
  addi $10, $0, 16
  addi $11, $0, 0
forChecarColisaoFantasmaSereia:
  beq $10, $11, retornoChecarColisaoFantasmaSereia
  
  beq $4, $5, colisaoDetectadaFantasmaSereia
  addi $5, $5, 512
  
  addi $11, $11, 1
  j forChecarColisaoFantasmaSereia
  
colisaoDetectadaFantasmaSereia:
  add $3, $0, $0
  j retornoChecarColisaoFantasmaSereia
  
retornoChecarColisaoFantasmaSereia:
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
