.text
.globl checarColisaoCenarioFlor, checarColisaoPlataformaCenarioFlor, checarColisaoLateraisPlataformasCenarioFlor, checarColisaoTirosParedesCenarioFlor

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
# Checar colisao dos vaos entre as plataformas
# $4 => canto superior esquerdo do personagem
# Retorno: $3 => 0 nao encostou no vao, 1 encostou no vao
# Registradores usados: $10, $11, $13
checarColisaoLateraisPlataformasCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
 
  addi $3, $0, 0 # começa como se nao tivesse encostado e checamos se o meio dos pes do personagem esta fora
  
  addi $4, $4, 10800  # ponta do sapato direito do jogador
  addi $10, $0, 14140 # segundo pixel a direita da plataforma da direita
  bge $4, $10, foraDePlataformaChecarLateraisPlatCenarioFlor # se o jogador estiver depois do ultimo pixel das plataformas nem tem pra que fazer a checagem
  
  addi $4, $4, -16 # meio entre os pes do personagem
  addi $13, $0, 13824 # inicio do espaço a esquerda da plataforma da esquerda
  
  addi $10, $0, 10 # qtd de pixels ate a plataforma
  addi $11, $0, 0
forChecarColisaoLateraisPlatEsqCenarioFlor:
  beq $10, $11, checarColisaoLateraisPlatCentroCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, foraDePlataformaChecarLateraisPlatCenarioFlor
  addi $13, $13, 4
  
  addi $11, $11, 1
  j forChecarColisaoLateraisPlatEsqCenarioFlor
  

checarColisaoLateraisPlatCentroCenarioFlor:
  addi $13, $0, 13932 # inicio do espaço entre a plataforma esquerda e a do centro
  
  addi $10, $0, 9 # qtd de pixels ate a plataforma
  addi $11, $0, 0
forChecarColisaoLateraisPlatCentroCenarioFlor:
  beq $10, $11, checarColisaoLateraisPlatDireitaCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, foraDePlataformaChecarLateraisPlatCenarioFlor
  addi $13, $13, 4
  
  addi $11, $11, 1
  j forChecarColisaoLateraisPlatCentroCenarioFlor
  
  
checarColisaoLateraisPlatDireitaCenarioFlor:
  addi $13, $0, 14032 # inicio do espaço entre a plataforma do centro e a da direita
  
  addi $10, $0, 9 # qtd de pixels ate a plataforma
  addi $11, $0, 0
forChecarColisaoLateraisPlatDireitaCenarioFlor:
  beq $10, $11, retornoChecarColisaoLateraisPlataformaCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, foraDePlataformaChecarLateraisPlatCenarioFlor
  addi $13, $13, 4
  
  addi $11, $11, 1
  j forChecarColisaoLateraisPlatDireitaCenarioFlor
  
  
foraDePlataformaChecarLateraisPlatCenarioFlor:
  addi $3, $0, 1
  j retornoChecarColisaoLateraisPlataformaCenarioFlor
  
retornoChecarColisaoLateraisPlataformaCenarioFlor:
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
# $4 => canto superior esquerdo do personagem
# Retorno: $3 => 0 se subiu na plataforma, 1 se nao subiu
# Registradores usados: $10, $11, $13, $14, $15
checarColisaoPlataformaCenarioFlor:
  sw $31, 0($sp)
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
  
 
  addi $3, $0, 1 # começa negado e checamos se o meio dos pes do personagem esta na plataforma
  
  addi $4, $4, 10800  # ponta do sapato direito do jogador
  addi $10, $0, 14140 # primeiro pixel a direita da plataforma da direita
  bge $4, $10, retornoChecarColisaoPlataformaCenarioFlor # se o jogador estiver depois do ultimo pixel das plataformas nem tem pra que fazer a checagem
  
  addi $4, $4, -20 # pe esquerdo do personagem
  addi $13, $0, 13876 # esquerda da plataforma esquerda
  
  # qtd de pixels ate o outro pe do personagem
  addi $10, $0, 5
  addi $11, $0, 0
  # qtd de pixels ate a direita da plataforma
  addi $14, $0, 12
  addi $15, $0, 0
forChecarColisaoPlatEsqCenarioFlor:
  beq $10, $11, checarColisaoPlatCentroCenarioFlor
  
forIterPeChecColPlatEsqCenarioFlor:
  beq $14, $15, proxPixelPeChecColPlatEsqCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, dentroDePlataformaCenarioFlor
  addi $13, $13, 4
  
  addi $15, $15, 1
  j forChecarColisaoPlatEsqCenarioFlor
  
proxPixelPeChecColPlatEsqCenarioFlor:
  addi $13, $0, 13876 # esquerda da plataforma esquerda
  addi $15, $0, 0
  addi $11, $11, 1
  addi $4, $4, 4 # proximo pixel do pe
  j forChecarColisaoPlatEsqCenarioFlor
  
  

checarColisaoPlatCentroCenarioFlor:  
  addi $13, $0, 13976 # esquerda da plataforma do centro
  addi $4, $4, -20 # pe esquerdo do personagem
  
  # qtd de pixels ate o outro pe do personagem
  addi $10, $0, 5
  addi $11, $0, 0
  # qtd de pixels ate a direita da plataforma
  addi $14, $0, 12
  addi $15, $0, 0
forChecarColisaoPlatCentroCenarioFlor:
  beq $10, $11, checarColisaoPlatDireitaCenarioFlor
  
forIterPeChecColPlatCentroCenarioFlor:
  beq $14, $15, proxPixelPeChecColPlatCentroCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, dentroDePlataformaCenarioFlor
  addi $13, $13, 4
  
  addi $15, $15, 1
  j forChecarColisaoPlatCentroCenarioFlor
  
proxPixelPeChecColPlatCentroCenarioFlor:
  addi $13, $0, 13976 # esquerda da plataforma esquerda
  addi $15, $0, 0
  addi $11, $11, 1
  addi $4, $4, 4 # proximo pixel da base do jogador
  j forChecarColisaoPlatCentroCenarioFlor
  
  
  
checarColisaoPlatDireitaCenarioFlor:
  addi $13, $0, 14076 # esquerda da plataforma do centro
  addi $4, $4, -20 # pe esquerdo do personagem  
  
  # qtd de pixels ate o outro pe do personagem
  addi $10, $0, 5
  addi $11, $0, 0
  # qtd de pixels ate a direita da plataforma
  addi $14, $0, 12
  addi $15, $0, 0
forChecarColisaoPlatDireitaCenarioFlor:
  beq $10, $11, retornoChecarColisaoPlataformaCenarioFlor
  
forIterPeChecColPlatDireitaCenarioFlor:
  beq $14, $15, proxPixelPeChecColPlatDireitaCenarioFlor
  
  # checa se o centro dos pes do jogador esta na area fora da plataforma
  beq $4, $13, dentroDePlataformaCenarioFlor
  addi $13, $13, 4
  
  addi $15, $15, 1
  j forChecarColisaoPlatDireitaCenarioFlor
  
proxPixelPeChecColPlatDireitaCenarioFlor:
  addi $13, $0, 14076 # esquerda da plataforma esquerda
  addi $15, $0, 0
  addi $11, $11, 1
  addi $4, $4, 4 # proximo pixel da base do jogador
  j forChecarColisaoPlatDireitaCenarioFlor
  
  
  
dentroDePlataformaCenarioFlor:
  addi $3, $0, 0
  j retornoChecarColisaoPlataformaCenarioFlor
  
retornoChecarColisaoPlataformaCenarioFlor:
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
  lw $31, 0($sp)
  jr $31
  
  
  
#####################
# funçao para checar as colisoes dos tiros normais
# $4 => canto superior esquerdo do tiro
# $5 => 1 = indo pra esquerda,  0 = indo pra direita
# Retorno: $3 => 0 ainda nao colidiu com nenhuma parede, 1 colidiu em uma parede
# Registradores usados: $10, $11, $15

checarColisaoTirosParedesCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $15, 0($sp)
  addi $sp, $sp, -4
  
  
  addi $3, $0, 0 # pode se deslocar por padrao, o loop que ira modificar caso nao possa
  
  bne $5, $0, checarColisaoTirosParedesCenarioFlorEsquerda
  
  # se continuar e para checar a direita
  addi $15, $0, 340 # coluna em relacao ao 0x10010000
  
  # checa toda a coluna da tela da direita, se detectar colisao, evita de se mover e retorna 1
  addi $10, $0, 128 # qtd de pixels (aumentando de 1 em 1, se fosse de 4 em 4 seria 512)
  addi $11, $0, 0
forChecarColisaoTirosCenarioFlorDireita:
  beq $10, $11, retornoChecarColisaoTirosCenarioFlor
  
  beq $4, $15, colisaoTirosDetectadaCenarioFlor
  addi $15, $15, 512
  
  addi $11, $11, 1
  j forChecarColisaoTirosCenarioFlorDireita
  
  
  
  
checarColisaoTirosParedesCenarioFlorEsquerda:
  addi $15, $0, -12 # coluna em relacao ao 0x10010000
  
  # checa toda a coluna da tela, se estiver no ultimo pixel da direita, nao pode continuar
  addi $10, $0, 128
  addi $11, $0, 0
forChecarColisaoTirosCenarioFlorEsquerda:
  beq $10, $11, retornoChecarColisaoTirosCenarioFlor
  
  beq $4, $15, colisaoTirosDetectadaCenarioFlor
  addi $15, $15, 512
  
  addi $11, $11, 1
  j forChecarColisaoTirosCenarioFlorEsquerda

  
colisaoTirosDetectadaCenarioFlor:
  addi $3, $0, 1
  j retornoChecarColisaoTirosCenarioFlor
  
retornoChecarColisaoTirosCenarioFlor:
  addi $sp, $sp, 4
  lw $15, 0($sp)
  
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
  
  
  
#####################
# funçao para checar as colisoes dos ataques horizontais da flor com a parede invisivel da esquerda
# $4 => canto superior esquerdo do ataque
# Retorno: $3 => 0 = encostou na parede invisivel, 1 = nao encostou
# Registradores usados: $9, $10, $11

checarColisaoAtqHorizFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  addi $3, $0, 1 # começa negado
  
  addi $9, $0, 0 # endereço inicial da coluna esquerda
  
  # altura da coluna
  addi $10, $0, 128
  addi $11, $0, 0
forChecarColisaoAtqHorizFlor:
  beq $10, $11, retornoChecarColisaoAtqHorizFlor
  
  beq $4, $9, colisaoDetectadaAtqHorizFlor
  addi $9, $9, 512
  
  addi $11, $11, 1
  j forChecarColisaoAtqHorizFlor
  
colisaoDetectadaAtqHorizFlor:
  add $3, $0, $0,
  j retornoChecarColisaoAtqHorizFlor
  
retornoChecarColisaoAtqHorizFlor:
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
  
  
  
#####################
# funçao para checar as colisoes dos ataques de pinha da flor com o cuphead
# $4 => canto superior esquerdo do ataque
# $5 => canto superior esquerdo do cuphead
# Retorno: $3 => 0 = encostou no cuphead, 1 = nao encostou
# Registradores usados: $10, $11

checarColisaoPinhaCupheadFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  addi $3, $0, 1 # começa negado
  
  addi $5, $5, 72 # ajuste pra pegar o canto superior direito do cuphead
  
  # tamanho do cuphead
  addi $10, $0, 22
  addi $11, $0, 0
forChecarColisaoPinhaCupheadFlor:
  beq $10, $11, retornoChecarColisaoAtqHorizFlor
  
  beq $4, $5, colisaoDetectadaAtqPinhaCupheadFlor
  addi $5, $5, 512
  
  addi $11, $11, 1
  j forChecarColisaoAtqHorizFlor
  
colisaoDetectadaAtqPinhaCupheadFlor:
  add $3, $0, $0,
  j retornoChecarColisaoAtqPinhaCupheadFlor
  
retornoChecarColisaoAtqPinhaCupheadFlor:
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  