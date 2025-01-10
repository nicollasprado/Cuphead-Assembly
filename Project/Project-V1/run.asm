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
  
  # desenhar personagem
  addi $4, $0, 15360 # endereço do cuphead
  addi $5, $0, 0    # 0 = olhando pra direita
  jal desenharCuphead
  
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
  lw $15, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  beq $15, $0, continueMovCenarioFlor
  
  lw $15, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $15, $13, andarEsquerdaCenarioFlor
  addi $13, $0, 97 # a ascii
  beq $15, $13, andarEsquerdaCenarioFlor
  addi $13, $0, 65 # A ascii
  
  beq $15, $14, andarDireitaCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $15, $14, andarDireitaCenarioFlor
  addi $14, $0, 68 # D ascii
  
  beq $15, $17, pularCenarioFlor
  addi $17, $0, 119 # w ascii
  beq $15, $17, pularCenarioFlor
  addi $17, $0, 87 # W ascii
  
  beq $15, $18, sPressionadoCenarioFlor
  addi $18, $0, 115 # w ascii
  beq $15, $18, sPressionadoCenarioFlor
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
  addi $4, $24, -4    # endereço do cuphead
  addi $5, $0, 0      # 0 = olhando pra direita
  jal desenharCuphead
  
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
  
  addi $4, $24, 512     # endereço do cuphead
  addi $5, $0, 0      # 0 = olhando pra direita
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
  lw $15, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  lw $15, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $15, $13, andarEsquerdaEmPuloCenarioFlor
  addi $13, $0, 97 # a ascii
  beq $15, $13, andarEsquerdaEmPuloCenarioFlor
  addi $13, $0, 65 # A ascii
  
  beq $15, $14, andarDireitaEmPuloCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $15, $14, andarDireitaEmPuloCenarioFlor
  addi $14, $0, 68 # D ascii
  
continuePuloCenarioFlor:
  # salvar fundo atras do personagem
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, -512    # endereço do cuphead
  addi $5, $0, 0        # 0 = olhando pra direita
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

  addi $24, $24, -4
  
  jal timer
  j continuePuloCenarioFlor
  
andarDireitaEmPuloCenarioFlor:
  addi $4, $24, 512
  addi $5, $0, 1
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continuarPuloCenarioFlor

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
  lw $15, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  lw $15, 4($12) # Armazena no $12 a tecla pressionada
  
  beq $15, $13, andarEsquerdaEmQuedaCenarioFlor
  addi $13, $0, 97 # a ascii
  beq $15, $13, andarEsquerdaEmQuedaCenarioFlor
  addi $13, $0, 65 # A ascii
  
  beq $15, $14, andarDireitaEmQuedaCenarioFlor
  addi $14, $0, 100 # d ascii
  beq $15, $14, andarDireitaEmQuedaCenarioFlor
  addi $14, $0, 68 # D ascii
  
continueQuedaCenarioFlor:
  # salvar fundo atras do personagem
  addi $4, $0, 1     # 1 = salvar
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  addi $4, $24, 512     # endereço do cuphead
  addi $5, $0, 0      # 0 = olhando pra direita
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

  addi $24, $24, -4
  
  jal timer
  j continueQuedaCenarioFlor
  
andarDireitaEmQuedaCenarioFlor:
  addi $4, $24, -512
  addi $5, $0, 1
  jal checarColisaoCenarioFlor
  
  bne $3, $0, continuarQuedaCenarioFlor

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
  
  
  
#####################
# funçao para checar as colisoes do personagem principal
# $4 => canto superior esquerdo do personagem
# $5 => 0 = andou pra esquerda,  1 = andou pra direita
# Retorno: $3 => 0 se pode andar, 1 se nao pode andar
# Registradores usados: $10, $11, $15

checarColisaoCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  sw $15, 0($sp)
  addi $sp, $sp, -4
  
  
  
  addi $3, $0, 0 # pode andar por padrao, o loop que ira modificar caso nao possa
  
  beq $5, $0, checarColisaoCenarioFlorEsquerda
  
  # se continuar e para checar a direita
  addi $15, $0, -32368
  
  # checa toda a coluna da tela, se estiver no ultimo pixel da direita, nao pode andar
  addi $10, $0, 128
  addi $11, $0, 0
forChecarColisaoCenarioFlorDireita:
  beq $10, $11, retornoChecarColisao
  
  beq $15, $4, colisaoDetectadaCenarioFlor
  addi $15, $15, 512
  
  addi $11, $11, 1
  j forChecarColisaoCenarioFlorDireita
  
  
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
  addi $4, $4, 9244 # meio entre os pes do personagem
  
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
