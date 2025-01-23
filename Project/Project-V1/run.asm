.data
.align 4
fundoCenarioFlor: .space 396 # armazena 396 bytes para armazenar o fundo antigo, que e exatamente o 18x22 proporcao do personagem

.text
main: 
  jal telaInicial
  #beq $3, $0, outroBotaoTelaInicial falta implementar o botao de baixo
      
  # Jogar selecionado
  jal telaSelecaoFase
  beq $3, $0, faseSereia
      
  # cenario da flor
  addi $4, $0, 0
  jal cenarioFlor
  # salvamento da copia do mapa
  addi $4, $0, 32768 # um endereço abaixo do primeiro bloco da ultima linha
  jal cenarioFlor
  
  # desenhar o boss
  addi $4, $0, 5472
  jal criarFlor
  
  # desenhar personagem
  addi $4, $0, 15360 # endereço do cuphead
  addi $5, $0, 0    # 0 = olhando pra direita
  jal desenharCuphead
  
  lui $10, 0x1001
  addi $10, $10, 65548 # endereço que guarda a direçao que esta olhando
  sw $0, 0($10)
  
  
  jal criarIndicadorHP
  
  
loopPrincipalCenarioFlor:
  addi $24, $0, 15360 # $24 => canto superior esquerdo do player
  
  # movimentaçao do personagem
  lui $12, 0xffff  # Armazena o endereco de memoria que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  addi $15, $0, 65 # A ascii
  addi $16, $0, 68 # D ascii
  addi $17, $0, 87 # W ascii
  addi $18, $0, 83 # S ascii
movimentacaoCenarioFlor:
  lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  beq $13, $0, continueMovCenarioFlor
  
  lw $13, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $13, $15, andarEsquerdaCenarioFlor
  addi $15, $0, 97 # a ascii
  beq $13, $15, andarEsquerdaCenarioFlor
  addi $15, $0, 65 # A ascii
  
  beq $13, $14, andarDireitaCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $13, $14, andarDireitaCenarioFlor
  addi $14, $0, 68 # D ascii
  
  beq $13, $17, pularCenarioFlor
  addi $17, $0, 119 # w ascii
  beq $13, $17, pularCenarioFlor
  addi $17, $0, 87 # W ascii
  
  beq $13, $18, sPressionadoCenarioFlor
  addi $18, $0, 115 # w ascii
  beq $13, $18, sPressionadoCenarioFlor
  addi $18, $0, 83 # W ascii
  
  j continueMovCenarioFlor
  
  
andarEsquerdaCenarioFlor:
  add $4, $0, $24
  addi $5, $0, 0
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continueMovCenarioFlor # se o retorno da checagem de colisao diferente de 0 nao pode andar

  # salvar fundo atras do personagem
  addi $4, $0, 0     # 0 = pintar
  add $5, $0, $24    # canto superior esquerdo do personagem
  addi $6, $0, 0     # 0 = andou pra esquerda
  jal refazerFundoCenarioFlor
  
  # pintar fundo atras do personagem
  addi $4, $0, 1     # 1 = salvar
  add $5, $0, $24   # canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  # desenha o personagem
  addi $4, $24, -4  # endereço do cuphead
  addi $5, $0, 1    # 1 = olhando pra esquerda
  jal desenharCuphead
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  addi $23, $0, 1     # esquerda
  sw $23, 0($22)
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  jal checarColisaoPlataformaCenarioFlor
  
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  
  j movimentacaoCenarioFlor
  
  
  
andarDireitaCenarioFlor:
  add $4, $0, $24
  addi $5, $0, 1
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continueMovCenarioFlor # se o retorno da checagem de colisao diferente de 0 nao pode andar
  
  # salvar fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 4     # endereço do cuphead
  addi $5, $0, 0      # 0 = olhando pra direita
  jal desenharCuphead
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  sw $0, 0($22)
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  jal checarColisaoPlataformaCenarioFlor
  
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  
  j movimentacaoCenarioFlor
  
  
descerPlataformaCenarioFlor:
  # checa se o player esta na altura das plataformas
  addi $10, $0, 14332 # ultimo pixel a direita na altura das plataformas
  bgt $24, $10, naoEstaEmPlataformaCenarioFlor
  
  # desce o player da plataforma
  addi $10, $0, 24
  addi $11, $0, 0
forDescerPlataformaCenarioFlor:
  beq $10, $11, movimentacaoCenarioFlor
  
  # salvar fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 512 # endereço do cuphead
  lui $23, 0x1001
  addi $23, $23, 65548 # endereço que guarda a direçao que esta olhando
  lw $5, 0($23)     # direçao que esta olhando
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  jal timer
  addi $11, $11, 1
  j forDescerPlataformaCenarioFlor
  
naoEstaEmPlataformaCenarioFlor:
  j movimentacaoCenarioFlor
  
  
pularCenarioFlor:
  #add $4, $0, $24
  #addi $5, $0, 1
  #jal checarColisaoCenarioFlor
  
  #bne $3, $0, continueMovCenarioFlor # se o retorno da checagem de colisao diferente de 0 nao pode andar
  
  # PULO
  addi $10, $0, 25 # qtd de pixels pra cima
  addi $11, $0, 0
  
forPularCenarioFlor:
  beq $10, $11, descerPularCenarioFlor
  
  # para poder se mover em quanto pula
  lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  lw $13, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $13, $15, andarEsquerdaEmPuloCenarioFlor
  addi $15, $0, 97 # a ascii
  beq $13, $15, andarEsquerdaEmPuloCenarioFlor
  addi $15, $0, 65 # A ascii
  
  beq $13, $14, andarDireitaEmPuloCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $13, $14, andarDireitaEmPuloCenarioFlor
  addi $14, $0, 68 # D ascii
  
continuePuloCenarioFlor:
  # salvar fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, -512    # endereço do cuphead
  lui $23, 0x1001
  addi $23, $23, 65548
  lw $5, 0($23)        # para onde esta olhando
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  jal timer
  addi $11, $11, 1
  j forPularCenarioFlor
  
  
andarEsquerdaEmPuloCenarioFlor:
  addi $4, $24, 512
  addi $5, $0, 0
  jal checarColisaoCenarioFlor

  bne $3, $0, continuarPuloCenarioFlor
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  addi $23, $0, 1
  sw $23, 0($22)

  addi $24, $24, -4
  
  jal timer
  j continuePuloCenarioFlor
  
andarDireitaEmPuloCenarioFlor:
  addi $4, $24, 512
  addi $5, $0, 1
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continuarPuloCenarioFlor
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  sw $0, 0($22)

  addi $24, $24, 4
  
  jal timer
  j continuePuloCenarioFlor
  
continuarPuloCenarioFlor:
  j continuePuloCenarioFlor
  
  

descerPularCenarioFlor:
  addi $11, $0, 0
forDescerPularCenarioFlor:
  beq $10, $11, fimQuedaCenarioFlor
  
  # Para poder se mover em quanto cai
  lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  lw $13, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $13, $15, andarEsquerdaEmQuedaCenarioFlor
  addi $15, $0, 97 # a ascii
  beq $13, $15, andarEsquerdaEmQuedaCenarioFlor
  addi $15, $0, 65 # A ascii
  
  beq $13, $14, andarDireitaEmQuedaCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $13, $14, andarDireitaEmQuedaCenarioFlor
  addi $14, $0, 68 # D ascii
  
continueQuedaCenarioFlor:
  # salvar fundo atras do personagem
  addi $4, $0, 1     # 1 = salvar
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 512     # endereço do cuphead
  lui $23, 0x1001
  addi $23, $23, 65548
  lw $5, 0($23)      # direçao que esta olhando
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
  
  # reg 4 ja esta sendo alterado na funcao entao nao tem que especificar
  jal checarColisaoPlataformaCenarioFlor
  
  beq $3, $0, subiuPlataformaPulo
  
  jal timer
  addi $11, $11, 1
  j forDescerPularCenarioFlor
  
  
subiuPlataformaPulo:
  j movimentacaoCenarioFlor
  
  
andarEsquerdaEmQuedaCenarioFlor:
  addi $4, $24, -512
  addi $5, $0, 0
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continuarQuedaCenarioFlor
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  addi $23, $0, 1     # esquerda
  sw $23, 0($22)

  addi $24, $24, -4
  
  jal timer
  j continueQuedaCenarioFlor
  
andarDireitaEmQuedaCenarioFlor:
  addi $4, $24, -512
  addi $5, $0, 1
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continuarQuedaCenarioFlor
  
  lui $22, 0x1001
  addi $22, $22, 65548 # endereço que guarda a direçao que esta olhando
  sw $0, 0($22)

  addi $24, $24, 4
  
  jal timer
  j continueQuedaCenarioFlor
  
continuarQuedaCenarioFlor:
  j continueQuedaCenarioFlor
  
fimQuedaCenarioFlor:
  jal checarColisaoPlataformaCenarioFlor
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  j movimentacaoCenarioFlor
  
  
  
sPressionadoCenarioFlor:
  jal checarColisaoPlataformaCenarioFlor
  bne $3, $0, descerPlataformaCenarioFlor # se retornar 1 o personagem nao esta em uma plataforma
  j movimentacaoCenarioFlor
  
  
continueMovCenarioFlor:
  j movimentacaoCenarioFlor
  
  
  
  # Loop que mantem o jogo funcionando
  j loopPrincipalCenarioFlor
      
      
      
      
continueBuild:
  jal criarIndicadorHP
  j end
      
faseSereia:
  jal cenarioSereia
  addi $4, $0, 32768 # um endereço abaixo do primeiro bloco da ultima linha
  jal cenarioSereia
  
  # desenhar o boss
  addi $4, $0, 8604
  jal criarSereia
  
  j continueBuild



end:
  addi $2, $0, 10
  syscall
  
  
######################
# função Timer

timer: 
  sw $31, 0($sp)
  addi $sp, $sp, -4
       
  sw $20, 0($sp)
  addi $sp, $sp, -4
  
       
  addi $20, $0, 20000
  
forT:  
  beq $20, $0, fimT
  nop
  nop
  addi $20, $20, -1      
  j forT    
                
fimT:  
  addi $sp, $sp, 4                                                    
  lw $20, 0($sp)

  addi $sp, $sp, 4                                                    
  lw $31, 0($sp)          
  jr $31

#####################
# funçao para desenhar o cenario atras quando o personagem se move
# Essa funçao pinta o fundo com o que era o cenario, depois disso e necessario chamar a funcao que pinta o persongaem novamente na nova posicao
# $5 => canto superior esquerdo do personagem
# Registradores usados: $10, $11, $13, $14, $20, $21, $23

refazerFundoCenarioFlor:
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
  
  sw $20, 0($sp)
  addi $sp, $sp, -4
  
  sw $21, 0($sp)
  addi $sp, $sp, -4
  
  sw $23, 0($sp)
  addi $sp, $sp, -4
  
  # Inicio do cenario copiado na memoria
  lui $23, 0x1001
  addi $23, $23, 32764
  add $23, $23, $5
  
  # endereço da posicao a ser refeita
  add $21, $5, -4
  lui $5, 0x1001
  add $5, $5, $21
  
continuePintarFundoCenarioFlor:
  # qtd de linhas
  addi $10, $0, 23
  addi $11, $0, 0
  # tamanho das linhas
  addi $13, $0, 20
  addi $14, $0, 0
forPintarFundoAntigoCenarioFlor:
  beq $10, $11, retornoFundoCenarioFlor
  
  add $20, $0, $23 # salva o inicio da linha do mapa copiado
  add $21, $0, $5 # salva o inicio da linha da posicao a ser refeita
forPintarLinhasFundoAntigoCenarioFlor:
  beq $13, $14, proxLinhaPintarFundoAntigoCenarioFlor
  
  lw $9, 0($23)
  sw $9, 0($5)
  addi $5, $5, 4
  addi $23, $23, 4
  
  addi $14, $14, 1
  j forPintarLinhasFundoAntigoCenarioFlor
  
proxLinhaPintarFundoAntigoCenarioFlor:
  addi $14, $0, 0
  
  # proxima linha
  addi $5, $21, 512
  addi $23, $20, 512
  
  addi $11, $11, 1
  j forPintarFundoAntigoCenarioFlor
  
  
retornoFundoCenarioFlor:
  addi $sp, $sp, 4
  lw $23, 0($sp)
  
  addi $sp, $sp, 4
  lw $21, 0($sp)
  
  addi $sp, $sp, 4
  lw $20, 0($sp)
  
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
