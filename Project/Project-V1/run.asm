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
  jal cenarioFlor
  
  # salvar fundo atras do personagem
  addi $4, $0, 0     # 0 salvar
  addi $5, $0, 15360 # canto superior esquerdo do personagem
  jal refazerFundoCenarioFlor
  
  # desenhar personagem
  addi $4, $0, 15360 # endereço do cuphead
  addi $5, $0, 0    # 0 = olhando pra direita
  jal desenharCuphead
  
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
  add $5, $0, $24   # canto superior esquerdo do personagem
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
# $4 => 0 salvar, 1 pintar
# $5 => canto superior esquerdo do personagem
# $6 => 0 = andou pra esquerda,  1 = andou pra direita
refazerFundoCenarioFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  lui $23, 0x1001
  addi $23, $23, 32772
  
  add $21, $0, $5
  lui $5, 0x1001
  add $5, $5, $21
  
  beq $4, $0, salvarFundoAntigoCenarioFlor
  
  # se continuar e para desenhar o fundo
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
  
  add $21, $0, $5 # salva o inicio da linha
forPintarLinhasFundoAntigoCenarioFlor:
  beq $13, $14, proxLinhaPintarFundoAntigoCenarioFlor
  
  sw $23, 0($5)
  addi $5, $5, 4
  addi $23, $23, 4
  
  addi $14, $14, 1
  j forPintarLinhasFundoAntigoCenarioFlor
  
proxLinhaPintarFundoAntigoCenarioFlor:
  addi $14, $0, 0
  addi $5, $21, 512
  addi $11, $11, 1
  j forPintarFundoAntigoCenarioFlor


andouEsquerdaPintarFundoCenarioFlor:
  addi $5, $5, 0
  j continuePintarFundoCenarioFlor
  
  
salvarFundoAntigoCenarioFlor:
  # qtd de linhas
  addi $10, $0, 22
  addi $11, $0, 0
  # tamanho das linhas
  addi $13, $0, 18
  addi $14, $0, 0
forSalvarFundoAntigoCenarioFlor:
  beq $10, $11, retornoFundoCenarioFlor
  
  add $21, $0, $5 # salva o inicio da linha
forSalvarLinhaFundoAntigoCenarioFlor:
  beq $13, $14, proxLinhaFundoAntigoCenarioFlorSalvar
  
  sw $5, 0($23)
  addi $23, $23, 4
  addi $5, $5, 4
  
  addi $14, $14, 1
  j forSalvarLinhaFundoAntigoCenarioFlor
  
proxLinhaFundoAntigoCenarioFlorSalvar:
  addi $14, $0, 0
  addi $5, $21, 512
  addi $11, $11, 1
  
  j forSalvarFundoAntigoCenarioFlor
  
  
  
retornoFundoCenarioFlor:
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31