.text

.globl desenharCuphead, refazerFundoCenarioFlor
  
# $4 -> endereço de inicio do desenho, canto superior esquerdo
# $5 -> 0 == olhando pra direita,  1 == olhando pra esquerda
# Implementar aqui com $5 as animaçoes
# registradores usados: $9, $10, $11, $13, $14, $15, $16
desenharCuphead:
  sw $31, 0($sp)
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
  
  sw $16, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $8, 0x1001
  add $8, $8, $4
  
  beq $5, $0, desenharCupheadDireita
  
  # desenhar pra esquerda
  add $25, $0, $8
  
  # Canudo
  # branco
  ori $9, $0, 0xffffff
  addi $8, $8, 56
  sw $9, 0($8)
  sw $9, 8($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 524($8)
  # vermelho
  ori $9, $0, 0xac3232
  sw $9, 4($8)
  sw $9, 520($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  
# Cabeça
  addi $8, $8, 1544
  ori $9, $0, 0xc6c6c6
  # qtd de linhas
  addi $10, $0, 8
  addi $11, $0, 0
  # tamanho da linha
  addi $13, $0, 14
  addi $14, $0, 0
forCabecaCupheadEsquerda:
  beq $10, $11, camisaCupheadEsquerda
  
  add $15, $0, $8 # inicio de cada linha
forLinhasCabecaCupheadEsq:
  beq $13, $14, proxLinhaCabecaCupheadEsq
  
  sw $9, 0($8)
  addi $8, $8, -4
  
  addi $14, $14, 1
  j forLinhasCabecaCupheadEsq
  
proxLinhaCabecaCupheadEsq:
  addi $14, $0, 0
  addi $11, $11, 1
  
  addi $16, $0, 6
  beq $11, $16, ajusteBaseCabecaCupheadEsq
  addi $16, $0, 7
  beq $11, $16, ajusteUltimaLinhaBaseCabecaCupheadEsq
  
  addi $8, $15, 512
  j forCabecaCupheadEsquerda
  
ajusteBaseCabecaCupheadEsq:
  addi $13, $13, -2
  addi $8, $15, 508
  j forCabecaCupheadEsquerda

ajusteUltimaLinhaBaseCabecaCupheadEsq:
  addi $13, $13, -4
  addi $8, $15, 504
  j forCabecaCupheadEsquerda
  
  
camisaCupheadEsquerda:
  ori $9, $0, 0x000000
  addi $8, $8, -40
  
  addi $10, $0, 12
  addi $11, $0, 0
forCamisaCupheadEsq:
  beq $10, $11, restoCamisaCupheadEsq
  
  sw $9, 0($8)
  sw $9, 516($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCamisaCupheadEsq
  
  
restoCamisaCupheadEsq:
  sw $9, 464($8)
  
  sw $9, 1024($8)
  sw $9, 1020($8)
  
  # luvas
  ori $9, $0, 0xffffff
  sw $9, 1536($8)
  sw $9, 1532($8)
  sw $9, 2048($8)
  sw $9, 2044($8)
  
  sw $9, 460($8)
  sw $9, 456($8)
  sw $9, -52($8)
  sw $9, -56($8)
  sw $9, -60($8)
  sw $9, -564($8)
  
  # resto da camisa
  addi $8, $8, 1012
  ori $9, $0, 0x000000
  
  addi $10, $0, 6
  addi $11, $0, 0
forRestoCamisaCupheadEsq:
  beq $10, $11, calcaCupheadEsq
  
  sw $9, 0($8)
  sw $9, 512($8)
  addi $8, $8, -4
  
  addi $11, $11, 1
  j forRestoCamisaCupheadEsq

  
calcaCupheadEsq:
  ori $9, $0, 0xac3232
  addi $8, $8, 1048
  
  # tamanho da linha
  addi $10, $0, 6
  addi $11, $0, 0
forCalcaCupheadEsq:
  beq $10, $11, restoCalcaCupheadEsq
  
  sw $9, 0($8)
  sw $9, 512($8)
  addi $8, $8, -4
  
  addi $11, $11, 1
  j forCalcaCupheadEsq
  
  
restoCalcaCupheadEsq:
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1040($8)
  sw $9, 1044($8)
  sw $9, 1048($8)

  # Pernas
  ori $9, $0, 0xc6c6c6
  sw $9, 1540($8)
  sw $9, 1544($8)
  sw $9, 1556($8)
  sw $9, 1560($8)
  sw $9, 2052($8)
  sw $9, 2056($8)
  sw $9, 2068($8)
  sw $9, 2072($8)
  
  # Sapatos
  ori $9, $0, 0x663931
  addi $8, $8, 2564
  sw $9, -4($8)
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 16($8)
  sw $9, 20($8)
  sw $9, 24($8)
  sw $9, 504($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 528($8)
  sw $9, 532($8)
  sw $9, 536($8)
  sw $9, 540($8)
  
  
rostoCupheadEsquerda:
  # Olho esquerdo
  ori $9, $0, 0xffffff
  addi $8, $8, -8720
  
  addi $10, $0, 5
  addi $11, $0, 0
forOlhoEsqCupheadEsq:  
  beq $10, $11, olhoDirCupheadEsq

  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forOlhoEsqCupheadEsq
  

olhoDirCupheadEsq:
  addi $8, $8, 4
  
  addi $10, $0, 7
  addi $11, $0, 0
forOlhoDirCupheadEsq:
  beq $10, $11, restoRostoCupheadEsq
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j  forOlhoDirCupheadEsq

  
restoRostoCupheadEsq:
  addi $8, $8, 1504
  
  # nariz
  ori $9, $0, 0xac3232
  sw $9, 0($8)
  sw $9, 4($8)  
  sw $9, -512($8)  
  sw $9, -508($8)
  
  # detalhes olho
  ori $9, $0, 0xc6c6c6
  sw $9, 508($8)
  sw $9, 516($8)
  sw $9, 540($8)
  
  # parte preta olho esquerdo
  ori $9, $0, 0x000000
  sw $9, -8($8)
  sw $9, -12($8)
  sw $9, -524($8)
  sw $9, -1036($8)
  sw $9, -1032($8)
  
  # parte preta olho direito
  sw $9, -500($8)
  sw $9, -1008($8)
  sw $9, -1012($8)
  sw $9, 12($8)
  sw $9, 16($8)
  
  # boca
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1040($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  ori $9, $0, 0xac3232
  sw $9, 1548($8)
  sw $9, 1552($8)
  
  
  
  j retornoDesenharCuphead
  
  
  
  
  
  
  
  
  
  
  
  
  
  
desenharCupheadDireita:
  # Canudo
  # branco
  ori $9, $0, 0xffffff
  sw $9, 4($8)
  sw $9, 12($8)
  sw $9, 512($8)
  sw $9, 520($8)
  sw $9, 524($8)
  # vermelho
  ori $9, $0, 0xac3232
  sw $9, 8($8)
  sw $9, 516($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  
  # Cabeça
  addi $8, $8, 1540
  ori $9, $0, 0xc6c6c6
  # qtd de linhas
  addi $10, $0, 8
  addi $11, $0, 0
  # tamanho da linha
  addi $13, $0, 14
  addi $14, $0, 0
forCabecaCupheadDireita:
  beq $10, $11, camisaCupheadDireita
  
  add $15, $0, $8 # inicio de cada linha
forLinhasCabecaCupheadDir:
  beq $13, $14, proxLinhaCabecaCupheadDir
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhasCabecaCupheadDir
  
proxLinhaCabecaCupheadDir:
  addi $14, $0, 0
  addi $11, $11, 1
  
  addi $16, $0, 6
  beq $11, $16, ajusteBaseCabecaCupheadDir
  addi $16, $0, 7
  beq $11, $16, ajusteUltimaLinhaBaseCabecaCupheadDir
  
  addi $8, $15, 512
  j forCabecaCupheadDireita
  
ajusteBaseCabecaCupheadDir:
  addi $13, $13, -2
  addi $8, $15, 516
  j forCabecaCupheadDireita

ajusteUltimaLinhaBaseCabecaCupheadDir:
  addi $13, $13, -4
  addi $8, $15, 520
  j forCabecaCupheadDireita
  
  
camisaCupheadDireita:
  ori $9, $0, 0x000000
  addi $8, $8, -4
  
  addi $10, $0, 12
  addi $11, $0, 0
forCamisaCupheadDir:
  beq $10, $11, restoCamisaCupheadDir
  
  sw $9, 0($8)
  sw $9, 508($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCamisaCupheadDir
  
  
restoCamisaCupheadDir:
  sw $9, 508($8)
  sw $9, 972($8)
  sw $9, 976($8)
  
  # luvas
  ori $9, $0, 0xffffff
  # direita
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, -512($8)
  sw $9, 512($8)
  sw $9, 516($8)
  # esquerda
  sw $9, 1484($8)
  sw $9, 1488($8)
  sw $9, 1996($8)
  sw $9, 2000($8)
  
  # resto da camisa
  ori $9, $0, 0x000000
  addi $8, $8, 984
  
  # tamanho da linha
  addi $10, $0, 6
  addi $11, $0, 0
forRestoCamisaCupheadDir:
  beq $10, $11, calcaCupheadDir
  
  sw $9, 0($8)
  sw $9, 512($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoCamisaCupheadDir
  

calcaCupheadDir:
  ori $9, $0, 0xac3232
  addi $8, $8, 1000
  
  # tamanho da linha
  addi $10, $0, 6
  addi $11, $0, 0
forCalcaCupheadDir:
  beq $10, $11, restoCalcaCupheadDir
  
  sw $9, 0($8)
  sw $9, 512($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCalcaCupheadDir
  
  
restoCalcaCupheadDir:
  addi $8, $8, 1000
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 16($8)
  sw $9, 20($8)
  
sapatosCupheadDir:
  # Pernas
  ori $9, $0, 0xc6c6c6
  addi $8, $8, 512
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 16($8)
  sw $9, 20($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 528($8)
  sw $9, 532($8)
  
  # Sapatos
  ori $9, $0, 0x663931
  addi $8, $8, 1024
  sw $9, -4($8)
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 16($8)
  sw $9, 20($8)
  sw $9, 24($8)
  sw $9, 504($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 528($8)
  sw $9, 532($8)
  sw $9, 536($8)
  sw $9, 540($8)
  

rostoCupheadDireita:
  # Olho esquerdo
  ori $9, $0, 0xffffff
  addi $8, $8, -8716
  
  # tamanho das linhas
  addi $10, $0, 7
  addi $11, $0, 0
forOlhoEsquerdoCupheadDir:
  beq $10, $11, restoOlhoEsquerdoCupheadDir
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forOlhoEsquerdoCupheadDir


restoOlhoEsquerdoCupheadDir:
  sw $9, 2024($8)
  sw $9, 2028($8)
  sw $9, 2032($8)
  sw $9, 2036($8)
  sw $9, 2040($8)
  # parte preta do olho
  ori $9, $0, 0x000000
  sw $9, 496($8)
  sw $9, 500($8)
  sw $9, 1012($8)
  sw $9, 1524($8)
  sw $9, 1520($8)
  
narizCupheadDir:
  ori $9, $0, 0xac3232
  addi $8, $8, 1532
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -512($8)
  sw $9, -508($8)
  
  # olho direito
  ori $9, $0, 0xffffff
  addi $8, $8, -1528
  
  addi $10, $0, 5
  addi $11, $0, 0
forOlhoDireitoCupheadDir:
  beq $10, $11, restoOlhoDireitoCupheadDir
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forOlhoDireitoCupheadDir
  
restoOlhoDireitoCupheadDir:
  ori $9, $0, 0xc6c6c6
  sw $9, 2028($8)
  
  # parte preta do olho
  ori $9, $0, 0x000000
  sw $9, 500($8)
  sw $9, 496($8)
  sw $9, 1012($8)
  sw $9, 1524($8)
  sw $9, 1520($8)
  
  # boca
  sw $9, 2520($8)
  sw $9, 2524($8)
  sw $9, 2528($8)
  sw $9, 2532($8)
  sw $9, 3040($8)
  sw $9, 3044($8)
  # lingua
  ori $9, $0, 0xac3232
  sw $9, 3032($8)
  sw $9, 3036($8)
  


retornoDesenharCuphead:
  addi $5, $0, 0

  addi $sp, $sp, 4
  lw $16, 0($sp)
  
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
