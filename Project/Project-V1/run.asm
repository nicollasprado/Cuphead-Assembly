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
  lui $12, 0xffff # Armazena o endereco de memoria que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  addi $13, $0, 65 # A ascii
  addi $14, $0, 68 # D ascii
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
  
  j continueMovCenarioFlor
  
  
andarEsquerdaCenarioFlor:
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
  j movimentacaoCenarioFlor
  
  
andarDireitaCenarioFlor:
  # salvar fundo atras do personagem
  addi $4, $0, 0     # 0 = pintar
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  addi $6, $0, 1     # 1 = andou pra direita
  jal refazerFundoCenarioFlor
  
  # salvar fundo atras do personagem
  addi $4, $0, 1     # 1 = salvar
  add $5, $0, $24   # 1 pixel antes do canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  

  addi $4, $24, 4     # endereço do cuphead
  addi $5, $0, 0      # 0 = olhando pra direita
  jal desenharCuphead
  
  add $24, $0, $4     # atualiza a posiçao do jogador
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
  j continueBuild



end:
  addi $2, $0, 10
  syscall



#####################
# funçao para desenhar o cenario atras quando o personagem se move
# Essa funçao pinta o fundo com o que era o cenario, depois disso e necessario chamar a funcao que pinta o persongaem novamente na nova posicao
# $5 => canto superior esquerdo do personagem
# $6 => 0 = andou pra esquerda,  1 = andou pra direita
refazerFundoCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  # Inicio do cenario copiado na memoria
  lui $23, 0x1001
  addi $23, $23, 32768
  add $23, $23, $5
  
  # endereço da posicao a ser refeita
  add $21, $0, $5
  lui $5, 0x1001
  add $5, $5, $21
  
  beq $6, $0, andouEsquerdaPintarFundoCenarioFlor
  addi $5, $5, 0
  
continuePintarFundoCenarioFlor:
  # qtd de linhas
  addi $10, $0, 22
  addi $11, $0, 0
  # tamanho das linhas
  addi $13, $0, 18
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


andouEsquerdaPintarFundoCenarioFlor:
  addi $5, $5, 0
  j continuePintarFundoCenarioFlor
  
  
retornoFundoCenarioFlor:
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
