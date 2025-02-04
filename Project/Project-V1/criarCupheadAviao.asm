.text
.globl criarCupheadAviao, desfazerCupheadAviao

# $4 -> canto superior esquerdo do cuphead aviao
# Regs utilizados: $8, $9, $10, $11, $13, $14, $15
criarCupheadAviao:
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
  
  
  lui $8, 0x1001
  add $8, $8, $4
  
  # Canudo
  addi $8, $8, 24
  # vermelho
  ori $9, $0, 0xde4538
  sw $9, 0($8)
  sw $9, 8($8)
  sw $9, 524($8)
  # branco
  ori $9, $0, 0xffffff
  sw $9, 4($8)
  sw $9, 12($8)
  
  # cabeça cuphead aviao
  addi $8, $8, 1032
  ori $9, $0, 0xcccccc
  
  # tamanho das linhas
  addi $10, $0, 8
  addi $11, $0, 0
forCabecaCupheadAviao:
  beq $10, $11, restoCabecaCupheadAviao
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCabecaCupheadAviao
  
  
restoCabecaCupheadAviao:
  # parte de baixo da cabeça
  addi $8, $8, 2040
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, -12($8)
  sw $9, -16($8)
  sw $9, -20($8)
  sw $9, -24($8)
  addi $8, $8, 508
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, -12($8)
  sw $9, -16($8)
  
  # Parte de segurar a xicara
  addi $8, $8, -536
  sw $9, 0($8)
  sw $9, -516($8)
  sw $9, -1028($8)
  sw $9, -1536($8)
  
  # Boca do cuphead aviao
  addi $8, $8, 24
  ori $9, $0, 0xffffff
  sw $9, -8($8)
  sw $9, -4($8)
  sw $9, 0($8)
  
  # Olhos cuphead aviao
  addi $8, $8, -1024
  # parte branca
  # direita
  sw $9, 0($8)
  sw $9, -512($8)
  sw $9, -1024($8)
  sw $9, -1020($8)
  # esquerda
  sw $9, -12($8)
  sw $9, -524($8)
  sw $9, -1036($8)
  sw $9, -1032($8)
  
  # parte preta
  ori $9, $0, 0x000000
  # direita
  sw $9, 4($8)
  sw $9, -508($8)
  # esquerda
  sw $9, -8($8)
  sw $9, -520($8)
  
  
  # Parte vermelha clara do aviao
  addi $8, $8, 2520
  add $15, $0, $8
  ori $9, $0, 0xe64830
  
  # tamanho das linhas
  addi $10, $0, 13
  addi $11, $0, 0
forInteriorCupheadAviao:
  beq $10, $11, caudaCupheadAviao
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forInteriorCupheadAviao
  
  
  
caudaCupheadAviao:
  addi $8, $15, -1548
  # Contorno
  ori $9, $0, 0xaca5a5
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  sw $9, 512($8)
  sw $9, 524($8)
  sw $9, 528($8)
  sw $9, 1024($8)
  sw $9, 1040($8)
  sw $9, 1044($8)
  sw $9, 1536($8)
  # Parte branca
  ori $9, $0, 0xffffff
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  sw $9, 1548($8)
  sw $9, 2048($8)
  sw $9, 2052($8)
  sw $9, 2564($8)
  
  
  # Contorno vermelho escuro aviao
  addi $8, $8, 3080
  ori $9, $0, 0x990000
  sw $9, -2000($8)
  sw $9, -1996($8)
  sw $9, -1492($8)
  sw $9, -1496($8)
  sw $9, -1500($8)
  sw $9, -1504($8)
  sw $9, -2020($8)
  sw $9, -2024($8)
  sw $9, -2028($8)
  sw $9, -2032($8)
  sw $9, -1528($8)
  sw $9, -1524($8)
  sw $9, -1020($8)
  sw $9, -1024($8)
  sw $9, -512($8)
  sw $9, -472($8)
  sw $9, -468($8)
  sw $9, -464($8)
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  sw $9, 16($8)
  sw $9, 20($8)
  sw $9, 24($8)
  sw $9, 28($8)
  sw $9, 32($8)
  sw $9, 48($8)
  sw $9, 52($8)
  sw $9, 556($8)
  sw $9, 1052($8)
  sw $9, 1056($8)
  sw $9, 1060($8)
  sw $9, 1064($8)
  
  # Resto do vermelho claro la embaixo do aviao
  ori $9, $0, 0xe64830
  sw $9, 36($8)
  sw $9, 40($8)
  sw $9, 44($8)
  sw $9, 544($8)
  sw $9, 548($8)
  sw $9, 552($8)
  
  # Detalhe preto abaixo da cabeça do cuphead aviao
  ori $9, $0, 0x000000
  sw $9, -2004($8)
  sw $9, -2008($8)
  sw $9, -2012($8)
  sw $9, -2016($8)
  
  # Contorno cinza bico do aviao
  addi $8, $8, -1992
  ori $9, $0, 0xaca5a5
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 520($8)
  sw $9, 1032($8)
  sw $9, 1544($8)
  sw $9, 2048($8)
  sw $9, 2052($8)
  
  # parte branca do bico do aviao e helice
  ori $9, $0, 0xffffff
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1536($8)
  sw $9, 1540($8)
  # helice
  sw $9, -500($8)
  sw $9, 12($8)
  sw $9, 524($8)
  sw $9, 1036($8)
  sw $9, 1548($8)
  sw $9, 2060($8)
  sw $9, 2572($8)
  
  
  
  
retornoCriarCupheadAviao:
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
  
  
  
  
################################################################
# Funçao para refazer o cenario atras do cuphead aviao
# Regs utilizados: $8, $9, $10, $11, $13, $14, $15, $16, $17
# $4 -> canto superio esquerdo do cuphead aviao a ser desfeito

desfazerCupheadAviao:
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
  
  sw $16, 0($sp)
  addi $sp, $sp, -4
  
  sw $17, 0($sp)
  addi $sp, $sp, -4
  
  
  # endereço na tela principal
  lui $8, 0x1001
  add $8, $8, $4
  
  # endereço na copia
  lui $15, 0x1001
  add $15, $15, $4
  addi $15, $15, 32768
  
  # qtd de linhas cuphead aviao
  addi $10, $0, 15
  addi $11, $0, 0
  # tamanho da linha do cuphead aviao
  addi $13, $0, 21
  addi $14, $0, 0
forDesfazerCupheadAviao:
  beq $10, $11, retornoDesfazerCupheadAviao
  
  # salva o inicio da linha a cada iter
  add $17, $0, $8  # tela principal
forLinhaDesfazerCupheadAviao:
  beq $13, $14, proxLinhaDesfazerCupheadAviao
  
  # puxa cor da copia
  lw $16, 0($15)
  # pinta na tela principal
  sw $16, 0($8)
  
  addi $15, $15, 4
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhaDesfazerCupheadAviao
  
  
proxLinhaDesfazerCupheadAviao:
  addi $14, $0, 0
  
  # prox linha
  addi $8, $17, 512   # principal
  addi $15, $8, 32768 # copia
  
  addi $11, $11, 1
  j forDesfazerCupheadAviao
  


retornoDesfazerCupheadAviao:
  addi $sp, $sp, 4
  lw $17, 0($sp)

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
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
