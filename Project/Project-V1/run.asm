.text
.globl loopPrincipalCenarioFlor, refazerFundoCenarioFlor, timer, continueMovCenarioFlor, posMovHorizontalFlor
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
  
  
#----------------------------------------------#
#  Definiçao de variaveis iniciais na memoria  #
  lui $12, 0x1001
  addi $12, $12, 65540
  
  # Dano
  addi $13, $0, 3
  sw $13, 0($12)
  
  # Velocidade
  addi $12, $12, 4
  addi $13, $0, 3 # velocidade
  sw $13, 0($12)
  
  # Direçao que esta olhando
  addi $12, $12, 4
  sw $0, 0($12) # 0, direita
  
  # Estado de pulo do jogador
  addi $12, $12, 4
  addi $13, $0, 1 # nao esta pulando
  sw $13, 0($12)
  
  # Contador da altura do pulo
  addi $12, $12, 4
  sw $0, 0($12)
  
  # Canto superior esquerdo do tiro index 0
  addi $12, $12, 4
  sw $0, 0($12)
  
  # Canto superior esquerdo do tiro index 1
  addi $12, $12, 4
  sw $0, 0($12)
  
  # Canto superior esquerdo do tiro index 2
  addi $12, $12, 4
  sw $0, 0($12)
  
  
  # movimentaçao do personagem
  addi $24, $0, 15360 # $24 => canto superior esquerdo do player
  
#----------------------------------------------#
  
loopPrincipalCenarioFlor:
  
movimentacaoCenarioFlor:
  lui $12, 0xffff  # Armazena o endereco de memoria que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  beq $13, $0, posMovHorizontalFlor
  
  lw $13, 4($12) # Armazena no $12 a tecla pressionada
  
  addi $15, $0, 65 # A ascii
  beq $13, $15, andarEsquerdaCenarioFlor
  addi $15, $0, 97 # a ascii
  beq $13, $15, andarEsquerdaCenarioFlor
  
  addi $15, $0, 68 # D ascii
  beq $13, $15, andarDireitaCenarioFlor
  addi $15, $0, 100 # d ascii
  beq $13, $15, andarDireitaCenarioFlor
  
  # checa se ja esta descendo de uma plataforma
  jal checarPuloCenarioFlor
  addi $15, $0, 3
  beq $3, $15, posMovHorizontalFlor
  
  addi $15, $0, 83 # S ascii
  beq $13, $15, sPressionadoCenarioFlor
  addi $15, $0, 115 # s ascii
  beq $13, $15, sPressionadoCenarioFlor
  
  # checa se ja esta pulando
  jal checarPuloCenarioFlor
  beq $3, $0, posMovHorizontalFlor
  # checa se ja esta descendo de um pulo
  jal checarPuloCenarioFlor
  addi $15, $0, 2
  beq $3, $15, posMovHorizontalFlor
  
  addi $15, $0, 87 # W ascii
  beq $13, $15, pularCenarioFlor
  addi $15, $0, 119 # w ascii
  beq $13, $15, pularCenarioFlor
  
# --------------------------------------#
posMovHorizontalFlor:
  # checa se esta pulando
  jal checarPuloCenarioFlor
  beq $3, $0, pularCenarioFlor
  # checa se esta em queda
  addi $15, $0, 2
  beq $3, $15, descerPularCenarioFlor
  # checa se esta descendo uma plataforma
  addi $15, $0, 3
  beq $3, $15, descerPlataformaCenarioFlor
  # ataque normal index 0
  add $4, $0, $24
  j atacarCenarioFlor
  
  j loopPrincipalCenarioFlor
 
  
sPressionadoCenarioFlor:
  add $4, $0, $24
  j descerPlataformaCenarioFlor
  
  
continueMovCenarioFlor:
  jal timer
  j loopPrincipalCenarioFlor
  
  
  
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
  
  # velocidade dos ticks do jogo
  addi $20, $0, 15000
  
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
  addi $5, $0, 0

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
 
