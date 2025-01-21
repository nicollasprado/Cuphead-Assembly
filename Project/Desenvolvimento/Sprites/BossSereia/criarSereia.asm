.text

.globl criarSereia

# $4 -> Canto superior esquerdo da sereia
criarSereia:
  lui $8, 0x1001
  add $8, $8, $4

cabeloSereia:
  addi $8, $8, 1064
  ori $9, $0, 0xd147ff # roxo
  
  addi $10, $0, 13
  addi $11, $0, 0
forCabeloSereia:
  beq $10, $11, detalhesCabeloSereia

  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4

  addi $11, $11, 1
  j forCabeloSereia


detalhesCabeloSereia:
  sw $9, 4($8)
  sw $9, 512($8)
  sw $9, -508($8)
  sw $9, -512($8)
  sw $9, -520($8)
  sw $9, -1024($8)
  sw $9, -1028($8)
  
  sw $9, 456($8)
  sw $9, 968($8)
  sw $9, 1480($8)
  
  # detalhes rosa mais claro
  ori $9, $0, 0xcc82e5
  # direita
  sw $9, -12($8)
  sw $9, -20($8)
  sw $9, 492($8)
  sw $9, 496($8)
  sw $9, 1000($8)
  sw $9, 1004($8)
  sw $9, 1008($8)
  sw $9, 1516($8)
  sw $9, 1512($8)
  # esquerda
  sw $9, -44($8)
  sw $9, -52($8)
  sw $9, 460($8)
  sw $9, 464($8)
  sw $9, 968($8)
  sw $9, 972($8)
  sw $9, 976($8)
  sw $9, 1480($8)
  sw $9, 1484($8)
  
  # detalhes rosa mais claro ainda
  ori $9, $0, 0xffb8fd
  # direita
  sw $9, -16($8)
  sw $9, -28($8)
  sw $9, 488($8)
  sw $9, 1508($8)
  sw $9, 1520($8)
  #esquerda
  sw $9, -48($8)
  sw $9, 456($8)
  sw $9, 468($8)
  sw $9, 1488($8)
  
  # detalhes preto
  ori $9, $0, 0x000000
  sw $9, 0($8)
  sw $9, -516($8)

  # Cabelo nas laterais
  ori $9, $0, 0xd147ff # roxo
  addi $8, $8, 2552
  
  # detalhes mais especificos
  sw $9, -4($8)
  sw $9, -44($8)

  # laterais em si
  addi $10, $0, 8
  addi $11, $0, 0
forLateraisCabeloSereia:
  beq $10, $11, restoLateraisCabeloSereia

  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, -48($8)
  sw $9, -52($8)
  addi $8, $8, 512

  addi $11, $11, 1
  j forLateraisCabeloSereia


restoLateraisCabeloSereia:
  addi $8, $8, -512
  # roxo embaixo
  sw $9, 464($8)
  sw $9, 468($8)
  sw $9, 980($8)
  sw $9, 516($8)
  
  # roxo em cima
  sw $9, -4140($8)
  sw $9, -4100($8)
  sw $9, -4096($8)
  sw $9, -4092($8)

  # detalhes rosa mais claro embaixo
  ori $9, $0, 0xcc82e5
  sw $9, 512($8)
  sw $9, 1024($8)
  
  # rosa mais claro ainda embaixo
  ori $9, $0, 0xcc82e5
  sw $9, -4144($8)

  
rostoSereia:
  addi $8, $8, -4136
  addi $9, $0, 0xe8d1b0

  addi $10, $0, 9
  addi $11, $0, 0
forTopoBaseRostoSereia:
  beq $10, $11, restoRostoSereia

  sw $9, 0($8)
  sw $9, 4608($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forTopoBaseRostoSereia
  
  
restoRostoSereia:
  addi $8, $8, 472
  
  # qtd de linhas
  addi $10, $0, 8
  addi $11, $0, 0
  # tamanho das linhas
  addi $12, $0, 11
  addi $13, $0, 0
forRestoRostoSereia:
  beq $10, $11, detalhesRostoSereia

  add $14, $0, $8
forLinhasRestoRostoSereia:
  beq $12, $13, proxLinhaRestoRostoSereia
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $13, $13, 1
  j forLinhasRestoRostoSereia
  
proxLinhaRestoRostoSereia:
  addi $13, $0, 0
  addi $11, $11, 1
  addi $8, $14, 512
  j forRestoRostoSereia
  
  
detalhesRostoSereia:
  # detalhes em preto
  ori $9, $0, 0x000000
  
  # sombrancelha
  sw $9, -4084($8)
  sw $9, -4068($8)
  sw $9, -3568($8)
  sw $9, -3560($8)
  
  # olhos
  # esquerda
  sw $9, -2548($8)
  sw $9, -2036($8)
  # direita
  sw $9, -2532($8)
  sw $9, -2020($8)
  # parte branca dos olhos
  ori $9, $0, 0xffffff
  # esquerda
  sw $9, -2544($8)
  sw $9, -2032($8)
  sw $9, -1520($8)
  sw $9, -1524($8)
  # direita
  sw $9, -2528($8)
  sw $9, -2016($8)
  sw $9, -1504($8)
  sw $9, -1508($8)
  
  # boca
  ori $9, $0, 0xffb8fd
  
  sw $9, -496($8)
  sw $9, -492($8)
  sw $9, -488($8)

pescocoSereia:
  ori $9, $0, 0xc9b69b
  addi $8, $8, 524
  # sombra
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  # resto
  ori $9, $0, 0xe8d1b0
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 524($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1040($8)
  
ombrosSereia:
  addi $8, $8, 1520
  
  addi $10, $0, 13
  addi $11, $0, 0
forOmbrosSereia:
  beq $10, $11, bracoDireitoSereia
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forOmbrosSereia


bracoDireitoSereia:
  addi $8, $8, 512
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1544($8)
  sw $9, 1548($8)
  sw $9, 2056($8)
  sw $9, 2060($8)
  sw $9, 2044($8)
  sw $9, 2552($8)
  sw $9, 2556($8)
  sw $9, 2560($8)
  sw $9, 2564($8)
  sw $9, 2568($8)
  sw $9, 2572($8)
  sw $9, 3068($8)
  sw $9, 3072($8)
  sw $9, 3076($8)
  sw $9, 3080($8)
  # sombras
  ori $9, $0, 0xc9b69b
  sw $9, 1020($8)
  sw $9, 1540($8)
  sw $9, 2052($8)
  sw $9, 2548($8)
  sw $9, 3060($8)
  sw $9, 3064($8)
  sw $9, 3576($8)
  sw $9, 3580($8)
  sw $9, 3584($8)
  sw $9, 3588($8)
  sw $9, 3592($8)
  
bracoEsquerdoSereia:
  addi $8, $8, -56
  ori $9, $0, 0xe8d1b0
  sw $9, -4($8)
  sw $9, 0($8)
  sw $9, 480($8)
  sw $9, 484($8)
  sw $9, 488($8)
  sw $9, 492($8)
  sw $9, 496($8)
  sw $9, 500($8)
  sw $9, 504($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 1004($8)
  sw $9, 1008($8)
  sw $9, 1012($8)
  sw $9, 1016($8)
  sw $9, 1020($8)
  sw $9, -20($8)
  sw $9, -24($8)
  
  # sombras
  ori $9, $0, 0xc9b69b
  sw $9, -28($8)
  sw $9, 996($8)
  sw $9, 1000($8)
  sw $9, 1516($8)
  sw $9, 1520($8)
  sw $9, 1524($8)
  sw $9, 1528($8)
  sw $9, 1532($8)
  

end:
  addi $2, $0, 10
  syscall
