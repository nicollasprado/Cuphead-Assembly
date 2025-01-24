.text
.globl checarColisaoCenarioFlor, checarColisaoPlataformaCenarioFlor

#####################
# funçao para checar as colisoes do personagem principal
# $4 => canto superior esquerdo do personagem
# $5 => 0 = andou pra esquerda,  1 = andou pra direita
# Retorno: $3 => 0 se pode andar, 1 se nao pode andar
# Registradores usados: $10, $11, $13, $15

checarColisaoCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  sw $15, 0($sp)
  addi $sp, $sp, -4
  
  
  addi $3, $0, 0 # pode andar por padrao, o loop que ira modificar caso nao possa
  
  beq $5, $0, checarColisaoCenarioFlorEsquerda
  
  # se continuar e para checar a direita
  addi $15, $0, -27372
  
  # Ajuste para funcionar com diferentes velocidades
  lui $10, 0x1001
  addi $10, $10, 65544
  lw $11, 0($10)    # pega a velocidade do jogador
  
  # se o valor da velocidade for par, e necessario dividir por 2 o valor da velocidade antes de multiplicar por 4
  addi $13, $0, 2
  div $11, $13
  mfhi $13
  
  beq $13, $0, parColisaoCenarioFlorDireita
  
continueColisaoCenarioFlorDireita:
  mul $11, $11, 4   # ajusta pra qtd de pixels
  add $4, $4, $11
  
  # checa toda a coluna da tela, se estiver no ultimo pixel da direita, nao pode andar
  addi $10, $0, 128
  addi $11, $0, 0
forChecarColisaoCenarioFlorDireita:
  beq $10, $11, retornoChecarColisao
  
  beq $15, $4, colisaoDetectadaCenarioFlor
  addi $15, $15, 512
  
  addi $11, $11, 1
  j forChecarColisaoCenarioFlorDireita
  

## TODO - Arrumar, provavelmente $13 == 2x($11 / 2)
parColisaoCenarioFlorDireita:
  addi $13, $0, 2
  div $11, $13
  mflo $13
  
  addi $10, $0, -1
  mul $13, $13, $10
  add $11, $11, $13
  j continueColisaoCenarioFlorDireita
  
  
checarColisaoCenarioFlorEsquerda:
  addi $15, $0, -32768
  
  # checa toda a coluna da tela, se estiver no ultimo pixel da direita, nao pode andar
  addi $10, $0, 128
  addi $11, $0, 0
forChecarColisaoCenarioFlorEsquerda:
  beq $10, $11, retornoChecarColisao
  
  beq $15, $4, colisaoDetectadaCenarioFlor
  addi $15, $15, 512
  
  addi $11, $11, 1
  j forChecarColisaoCenarioFlorEsquerda

  
colisaoDetectadaCenarioFlor:
  addi $3, $0, 1
  j retornoChecarColisao
  
retornoChecarColisao:
  # reset das propriedades da funçao
  addi $4, $0, 0
  addi $5, $0, 0
  
  addi $sp, $sp, 4
  lw $15, 0($sp)
  
  addi $sp, $sp, 4
  lw $13, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
  
  
  

#####################
# Checar colisao plataforma
# Essa funçao retorna 0 caso o player subiu em uma plataforma e 1 se nao
# $4 => canto superior esquerdo do personagem
# Retorno: $3 => 0 se subiu na plataforma, 1 se nao subiu
# Registradores usados: $10, $11, $14
checarColisaoPlataformaCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $14, 0($sp)
  addi $sp, $sp, -4
  
  # checagem
  addi $3, $0, 1    # começa negado
  addi $4, $4, 9240 # meio entre os pes do personagem
  
  addi $14, $0, 12544 # inicio da plataforma da direita
  
  addi $10, $0, 10 # qtd de pixels do pe esquerdo ao direito
  addi $11, $0, 0
forChecarColisaoPlataformaDireita:
  beq $10, $11, checarColisaoPlataformaMeio
  
  beq $14, $4, subiuPlataforma
  addi $14, $14, 4
  
  addi $11, $11, 1
  j forChecarColisaoPlataformaDireita
  
  
checarColisaoPlataformaMeio:
  addi $14, $0, 12444 # inicio da plataforma do meio
  
  addi $11, $0, 0
forChecarColisaoPlataformaMeio:
  beq $10, $11, checarColisaoPlataformaEsquerda
  
  beq $14, $4, subiuPlataforma
  addi $14, $14, 4
  
  addi $11, $11, 1
  j forChecarColisaoPlataformaMeio
  

checarColisaoPlataformaEsquerda:
  addi $14, $0, 12344 # inicio da plataforma do meio
  
  addi $11, $0, 0
forChecarColisaoPlataformaEsquerda:
  beq $10, $11, retornoChecarColisaoPlataformaCenarioFlor
  
  beq $14, $4, subiuPlataforma
  addi $14, $14, 4
  
  addi $11, $11, 1
  j forChecarColisaoPlataformaEsquerda
  
  
  
subiuPlataforma:
  addi $3, $0, 0
  j retornoChecarColisaoPlataformaCenarioFlor
  
retornoChecarColisaoPlataformaCenarioFlor:
  addi $sp, $sp, 4
  lw $14, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
