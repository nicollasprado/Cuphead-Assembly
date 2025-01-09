.text

.globl desenharCuphead

# $4 -> endereço de inicio do personagem, canto superior esquerdo do personagem
desenharCuphead:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
desenharCabeca:
  ori $9, $0, 0x000000
  lui $8, 0x1001
  add $8, $8, $4
  addi $8, $8, 2592
  add $24, $0, $8
  
  # Quantidade de linhas
  addi $10, $0, 7
  addi $11, $0, 0
  # tamanho das linhas
  addi $13, $0, 14
  addi $14, $0, 0
forDesenharCabeca:
  beq $10, $11, desenharCabecaBaixo
  
  add $16, $0, $8
forLinhaDesenharCabeca:
  beq $13, $14, proxLinhaDesenharCabeca
  
  addi $15, $13, -1
  beq $14, $15, corContornoLinhaCabeca
  beq $14, $0, corContornoLinhaCabeca
  beq $11, $0, corContornoLinhaCabeca
  
  ori $9, $0, 0xc6c6c6

continueLinhaCabeca:
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhaDesenharCabeca
  
corContornoLinhaCabeca:
  ori $9, $0, 0x000000
  j continueLinhaCabeca
  
  
proxLinhaDesenharCabeca:
  addi $14, $0, 0
  addi $11, $11, 1
  
  addi $15, $0, 14
  beq $13, $15, cabecaLinhaTamanhoQuatorze
  
  addi $15, $0, 16
  beq $13, $15, cabecaLinhaTamanhoDezesseis
  
  addi $8, $16, 512
  j forDesenharCabeca
  
cabecaLinhaTamanhoQuatorze:
  addi $13, $0, 16
  addi $8, $16, 508
  j forDesenharCabeca
  
cabecaLinhaTamanhoDezesseis:
  addi $15, $0, 2
  bgt $11, $15, fimLinhaCabecaTamDezesseisCima
  
  addi $8, $16, 512
  j forDesenharCabeca
  
fimLinhaCabecaTamDezesseisCima:
  addi $13, $0, 18
  addi $8, $16, 508
  j forDesenharCabeca
  
  
desenharCabecaBaixo:
  addi $8, $8, 4
  
  # qtd de linhas
  addi $10, $0, 4
  addi $11, $0, 0
  
  # tamanho das linhas
  addi $13, $0, 16
  addi $14, $0, 0
forDesenharCabecaBaixo:
  beq $10, $11, desenharCamisa
  
  add $16, $0, $8
forLinhasCabecaBaixo:
  beq $13, $14, proxLinhaCabecaBaixo

  addi $15, $13, -1
  beq $14, $15, corContornoCabecaBaixo
  beq $14, $0, corContornoCabecaBaixo
  
  ori $9, $0, 0xc6c6c6 # cor do preenchimento
continueLinhasCabecaBaixo:
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhasCabecaBaixo


corContornoCabecaBaixo:
  ori $9, $0, 0x000000
  j continueLinhasCabecaBaixo
  
proxLinhaCabecaBaixo:
  addi $14, $0, 0
  addi $11, $11, 1
  
  addi $15, $0, 2
  beq $11, $15, corrigirTamanhoLinhaCabecaBaixo
  
  addi $8, $16, 512
  j forDesenharCabecaBaixo
  
corrigirTamanhoLinhaCabecaBaixo:
  addi $13, $13, -2
  addi $8, $16, 516
  j forDesenharCabecaBaixo
  
  
  
desenharCamisa:
  addi $8, $8, -516
  add $16, $0, $8
  sw $9, 0($8)
  
  addi $8, $8, 60
  addi $10, $0, 6
  addi $11, $0, 0
forDesenharCamisa:
  beq $10, $11, continuacaoCamisa
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forDesenharCamisa


continuacaoCamisa:
  addi $8, $16, 508
  add $16, $0, $8
  
  # qtd de linhas
  addi $10, $0, 2
  addi $11, $0, 0
  
  # tamanho das linhas
  addi $13, $0, 22
  addi $14, $0, 0
forContCamisa:
  beq $10, $11, restoCamisa

forLinhasContCamisa:
  beq $13, $14, proxLinhaContCamisa

  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhasContCamisa
  
proxLinhaContCamisa:
  beq $11, $0, desenharLuvaDireita
  
continueProxLinhaContCamisa:
  ori $9, $0, 0x000000
  addi $8, $16, 508
  addi $13, $0, 16
  addi $14, $0, 0
  
  addi $11, $11, 1
  j forContCamisa
  
desenharLuvaDireita:
  ori $9, $0, 0xffffff
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -512($8)
  sw $9, -508($8)
  sw $9, -504($8)
  sw $9, -1024($8)
  j continueProxLinhaContCamisa
  
  
restoCamisa:
  addi $8, $16, 1020
  # manga esquerda
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  # Luva esquerda
  ori $9, $0, 0xffffff
  sw $9, 1536($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  sw $9, 2048($8)
  sw $9, 2052($8)
  
  addi $17, $8, 1548 # referencia para fazer a calça

  ori $9, $0, 0x000000
  addi $8, $16, 1036
  # tamanho das linhas
  addi $10, $0, 12
  addi $11, $0, 0
forRestoCamisa:
  beq $10, $11, desenharCalca
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoCamisa
  
  
desenharCalca:
  add $8, $0, $17
  ori $9, $0, 0xb30d0d
  
  # tamanho das linhas
  addi $10, $0, 14
  addi $11, $0, 0
forDesenharCalca:
  beq $10, $11, restoCalca
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forDesenharCalca
  

restoCalca:
  addi $8, $17, 2052
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  sw $9, 516($8)
  sw $9, 520($8)
  
  sw $9, 32($8)
  sw $9, 36($8)
  sw $9, 40($8)
  sw $9, 44($8)
  sw $9, 548($8)
  sw $9, 552($8)
  
desenharPernasSapatos:
  # pernas
  ori $9, $0, 0xffffff
  addi $8, $17, 3080
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 32($8)
  sw $9, 36($8)
  
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 544($8)
  sw $9, 548($8)
  
  # sapatos
  ori $9, $0, 0x482721
  addi $8, $17, 4104
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 524($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  
  sw $9, 32($8)
  sw $9, 36($8)
  sw $9, 544($8)
  sw $9, 548($8)
  sw $9, 552($8)
  sw $9, 556($8)
  sw $9, 1056($8)
  sw $9, 1060($8)
  sw $9, 1064($8)
  sw $9, 1068($8)
  

desenharCanudo:
  add $8, $0, $24
  
  # Preenchimento
  # vermelho
  ori $9, $0, 0xb30d0d
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -512($8)
  sw $9, -508($8)
  sw $9, -1544($8)
  sw $9, -1548($8)
  sw $9, -2056($8)
  sw $9, -2060($8)
  # branco
  ori $9, $0, 0xffffff
  sw $9, -1020($8)
  sw $9, -1024($8)
  sw $9, -1028($8)
  sw $9, -1536($8)
  sw $9, -1540($8)
  sw $9, -2048($8)
  sw $9, -2052($8)
  
  sw $9, -528($8)
  sw $9, -532($8)
  sw $9, -1040($8)
  sw $9, -1044($8)
  sw $9, -1552($8)
  sw $9, -1556($8)
  sw $9, -2064($8)
  
  # Contorno
  ori $9, $0, 0x000000
  sw $9, -4($8)
  sw $9, -16($8)
  sw $9, -20($8)
  sw $9, -504($8)
  sw $9, -516($8)
  sw $9, -524($8)
  sw $9, -536($8)
  sw $9, -1016($8)
  sw $9, -1032($8)
  sw $9, -1036($8)
  sw $9, -1048($8)
  sw $9, -1532($8)
  sw $9, -1560($8)
  sw $9, -2044($8)
  sw $9, -2068($8)
  sw $9, -2560($8)
  sw $9, -2564($8)
  sw $9, -2568($8)
  sw $9, -2572($8)
  sw $9, -2576($8)
  

desenharRosto:
  addi $8, $24, 1044
  
  # tamanho das colunas
  addi $10, $0, 4
  addi $11, $0, 0
forDesenharOlhos:
  beq $10, $11, restoRosto
  
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 24($8)
  sw $9, 28($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forDesenharOlhos
  
  
restoRosto:
  # pontos brancos olhos
  ori $9, $0, 0xffffff
  sw $9, -1532($8)
  sw $9, -1508($8)
  
  # nariz
  ori $9, $0, 0xb30d0d
  sw $9, 528($8)
  sw $9, 532($8)
  sw $9, 1040($8)
  sw $9, 1044($8)
  
  # boca
  sw $9, 1020($8)
  sw $9, 1016($8)
  sw $9, 1532($8)
  sw $9, 1536($8)
  sw $9, 1540($8)
  
  ori $9, $0, 0x000000
  sw $9, 504($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1544($8)

desenharAlca:
  addi $8, $24, 1016
  
  # tamanho da linha
  addi $10, $0, 5
  addi $11, $0, 0
forLinhasAlca:
  beq $10, $11, continuacaoAlca
  
  sw $9, 0($8)
  sw $9, 3072($8)
  addi $8, $8, -4 
  
  addi $11, $11, 1
  j forLinhasAlca
  
continuacaoAlca:
  addi $8, $24, 1016
  
  # linha interior
  ori $9, $0, 0xc6c6c6
  # tamanho da linha
  
  addi $10, $0, 4
  addi $11, $0, 0
forLinhasInterioresAlca:
  beq $10, $11, restoAlca
  
  sw $9, 508($8)
  sw $9, 2556($8)
  addi $8, $8, -4 
  
  addi $11, $11, 1
  j forLinhasInterioresAlca
  
restoAlca:
  addi $8, $24, 1016
  ori $9, $0, 0x000000 
  
  # contorno
  sw $9, 1020($8)
  sw $9, 1016($8)
  sw $9, 1012($8)
  sw $9, 1520($8)
  sw $9, 2044($8)
  sw $9, 2040($8)
  sw $9, 2036($8)
  
  
  sw $9, 492($8)
  sw $9, 1000($8)
  sw $9, 1512($8)
  sw $9, 2024($8)
  sw $9, 2540($8)
  
  # inteiror
  ori $9, $0, 0xc6c6c6
  sw $9, 1008($8)
  sw $9, 1004($8)
  sw $9, 1516($8)
  sw $9, 2032($8)
  sw $9, 2028($8)
  sw $9, 2560($8)

  
retorno:
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
