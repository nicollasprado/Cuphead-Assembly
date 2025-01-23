.text

.globl criarFlor

# $4 -> Canto superior esquerdo da flor
criarFlor:
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
  
  sw $12, 0($sp)
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
  

  lui $8, 0x1001
  add $8, $8, $4
  
fundoCabecaFlor:
  addi $8, $8, 1080
  ori $9, $0, 0xff5100 # laranja base
  
  # qtd de linhas
  addi $10, $0, 26
  addi $11, $0, 0
  # tamanho das linhas
  addi $12, $0, 17
  addi $13, $0, 0
forFundoCabecaFlor:
  beq $10, $11, lateraisFundoCabecaFlor
  
  add $14, $0, $8
forLinhaFundoCabecaFlor:
  beq $12, $13, proxLinhaFundoCabecaFlor
  
  beq $11, $0, testePontoTransparenteFlor

  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $13, $13, 1
  j forLinhaFundoCabecaFlor
  
  
proxLinhaFundoCabecaFlor:
  addi $13, $0, 0
  addi $11, $11, 1
  
  addi $8, $14, 512
  j forFundoCabecaFlor
  
  
testePontoTransparenteFlor:
  addi $15, $0, 8
  beq $13, $15, pontoTransparenteFlor
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $13, $13, 1
  j forLinhaFundoCabecaFlor
  
pontoTransparenteFlor:
  addi $8, $8, 4
  
  addi $13, $13, 1
  j forLinhaFundoCabecaFlor
  
  
  
lateraisFundoCabecaFlor:
  addi $8, $8, -11780
  # para pintar a direita ao mesmo tempo
  lui $17, 0x1001
  add $17, $17, $4
  addi $17, $17, 2684
  
  # qtd de colunas
  addi $10, $0, 7
  addi $11, $0, 0
  # tamanho das colunas
  addi $12, $0, 20
  addi $13, $0, 0
forLateraisFundoCabecaFlor:
  beq $10, $11, sombrasCabecaFlor
  
  add $14, $0, $8
  add $15, $0, $17
forColunaLateraisFundoCabecaFlor:
  beq $12, $13, proxColunaLateraisFundoCabecaFlor

  sw $9, 0($8)
  sw $9, 0($17)
  addi $8, $8, 512
  addi $17, $17, 512
  
  addi $13, $13, 1
  j forColunaLateraisFundoCabecaFlor
  
  
proxColunaLateraisFundoCabecaFlor:
  addi $13, $0, 0
  
  beq $11, $0, pularTresColunaLateraisFundoCabecaFlor
  
  addi $16, $0, 2
  beq $11, $16, pularDoisColunaLateraisFundoCabecaFlor
  
  addi $16, $0, 3
  beq $11, $16, pularDoisColunaLateraisFundoCabecaFlor
  
  
  addi $12, $12, -2
  addi $8, $14, 508
  addi $17, $15, 516
  
continueProxColunaLateraisFundoCabecaFlor:
  addi $11, $11, 1
  j forLateraisFundoCabecaFlor
  
  
pularTresColunaLateraisFundoCabecaFlor:
  addi $12, $12, -6
  addi $8, $14, 1532
  addi $17, $15, 1540
  j continueProxColunaLateraisFundoCabecaFlor
  
pularDoisColunaLateraisFundoCabecaFlor:
  addi $12, $12, -4
  addi $8, $14, 1020
  addi $17, $15, 1028
  j continueProxColunaLateraisFundoCabecaFlor
  
  
sombrasCabecaFlor:
  add $12, $0, $8
  ori $9, $0, 0xe54800
  # laterais
  # esquerda
  addi $8, $8, -1016
  sw $9, -504($8)
  sw $9, -508($8)
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  # direita
  addi $8, $8, 112
  sw $9, -516($8)
  sw $9, -520($8)
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, 512($8)
  sw $9, 508($8)
  sw $9, 504($8)
  sw $9, 1016($8)
  sw $9, 1020($8)
  # superior
  addi $8, $8, -3088
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, -12($8)
  sw $9, -16($8)
  
  sw $9, -64($8)
  sw $9, -68($8)
  sw $9, -72($8)
  sw $9, -76($8)
  sw $9, -80($8)
  sw $9, -84($8)
  # inferior
  addi $8, $8, 6656
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, -12($8)
  sw $9, -16($8)
  
  sw $9, -64($8)
  sw $9, -68($8)
  sw $9, -72($8)
  sw $9, -76($8)
  sw $9, -80($8)
  sw $9, -84($8)

  addi $8, $12, -8164
  # Pontas da flor
  # superior esquerdo
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  # superior direito
  sw $9, 68($8)
  sw $9, 72($8)
  sw $9, 576($8)
  sw $9, 580($8)
  sw $9, 584($8)
  sw $9, 1088($8)
  sw $9, 1092($8)
  # inferior esquerdo
  addi $8, $8, 14336
  
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -504($8)
  sw $9, -508($8)
  sw $9, -512($8)
  sw $9, -1016($8)
  sw $9, -1020($8)
  # inferior direito
  sw $9, 68($8)
  sw $9, 72($8)
  sw $9, -440($8)
  sw $9, -444($8)
  sw $9, -448($8)
  sw $9, -956($8)
  sw $9, -960($8)
  
  
detalhesFundoCabecaFlor:
  addi $8, $8, 12
  ori $9, $0, 0xff5100
  
  addi $10, $0, 13
  addi $11, $0, 0
forLinhaBaseFundoCabecaFlor:
  beq $10, $11, detalhesClarosCabecaFlor
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forLinhaBaseFundoCabecaFlor
  
  
  
detalhesClarosCabecaFlor:
  addi $8, $8, -1048
  
  # inferior esquerdo
  lui $14, 0x1001
  add $14, $14, $4
  addi $14, $8, -8
  # superior direito
  lui $15, 0x1001
  add $15, $15, $4
  addi $15, $8, -9216
  # superior esquerdo
  lui $16, 0x1001
  add $16, $16, $4
  addi $16, $15, -8
  
  ori $9, $0, 0xff8629
  # qtd de colunas
  addi $10, $0, 7
  addi $11, $0, 0
  # tamanho das colunas
  addi $12, $0, 6
  addi $13, $0, 0
forDetalhesClarosCabecaFlor:
  beq $10, $11, lateraisDetalhesClarosCabecaFlor
  
  add $17, $0, $8
  add $18, $0, $14
  add $19, $0, $15
  add $20, $0, $16
forColunasDetalhesClarosCabecaFlor:
  beq $12, $13, proxColunaDetalhesClarosCabecaFlor

  sw $9, 0($8)
  sw $9, 0($14)
  sw $9, 0($15)
  sw $9, 0($16)
  addi $8, $8, -512
  addi $14, $14, -512
  addi $15, $15, -512
  addi $16, $16, -512
  
  addi $13, $13, 1
  j forColunasDetalhesClarosCabecaFlor
  
  
proxColunaDetalhesClarosCabecaFlor:
  addi $13, $0, 0
  
  # testes de mudanças especificas de tamanho
  beq $11, $0, regOnzeZeroDetalhesClarosCabecaFlor
  
  addi $21, $0, 2
  beq $11, $21, regOnzeDoisDetalhesClarosCabecaFlor
  
  addi $21, $0, 4
  beq $11, $21, regOnzeQuatroDetalhesClarosCabecaFlor
  
  
  addi $8, $17, -508
  addi $14, $18, -516
  addi $15, $19, 4
  addi $16, $20, -4
  
  addi $12, $12, -1
continueProxColunaDetalhesClarosCabecaFlor:
  addi $11, $11, 1
  j forDetalhesClarosCabecaFlor
  
  
regOnzeZeroDetalhesClarosCabecaFlor:
  addi $12, $12, 1
  
  addi $8, $17, 516
  addi $14, $18, 508
  
  addi $15, $19, 4
  addi $16, $20, -4
  j continueProxColunaDetalhesClarosCabecaFlor
  
regOnzeDoisDetalhesClarosCabecaFlor:
  addi $12, $12, -1
  
  addi $8, $17, -1020
  addi $14, $18, -1028
  
  addi $15, $19, 516
  addi $16, $20, 508
  j continueProxColunaDetalhesClarosCabecaFlor
  
regOnzeQuatroDetalhesClarosCabecaFlor:
  addi $12, $12, -2
  
  addi $8, $17, 4
  addi $14, $18, -4
  
  addi $15, $19, -1020
  addi $16, $20, -1028
  j continueProxColunaDetalhesClarosCabecaFlor
  
  
lateraisDetalhesClarosCabecaFlor:
  addi $8, $8, -512
  # esquerda
  lui $16, 0x1001
  add $16, $16, $4
  addi $16, $8, -64
  
  # qtd de colunas
  addi $10, $0, 3
  addi $11, $0, 0
  # tamanho das colunas
  addi $12, $0, 3
  addi $13, $0, 0
forLateraisDetalhesClarosCabecaFlor:
  beq $10, $11, faceFlor
  
  add $14, $0, $8
  add $15, $0, $16
forColunasLateraisDetalhesClarosCabecaFlor:
  beq $12, $13, proxColunaLateraisDetalhesClarosCabecaFlor
  
  sw $9, 0($8)
  sw $9, 0($16)
  addi $8, $8, -512
  addi $16, $16, -512
  
  addi $13, $13, 1
  j forColunasLateraisDetalhesClarosCabecaFlor
  
  
proxColunaLateraisDetalhesClarosCabecaFlor:
  addi $13, $0, 0
  
  beq $11, $0, regOnzeZeroLateraisDetalhesClarosCabecaFlor
  
  addi $12, $12, -2
  addi $8, $14, -516
  addi $16, $15, -508
continueProxColunaLateraisDetalhesClarosCabecaFlor:
  addi $11, $11, 1
  j forLateraisDetalhesClarosCabecaFlor
  
  
regOnzeZeroLateraisDetalhesClarosCabecaFlor:
  # parte de cima
  sw $9, -3072($8)
  sw $9, -3072($16)
  sw $9, -3584($8)
  sw $9, -3584($16)
  sw $9, -4096($8)
  sw $9, -4096($16)
  
  # ajuste pra proxima coluna
  addi $12, $12, 9
  addi $8, $14, -4
  addi $16, $15, 4
  j continueProxColunaLateraisDetalhesClarosCabecaFlor
  
  
  
faceFlor:
  addi $8, $8, 1016
  ori $9, $0, 0xffd738
  
  # qtd de linhas
  addi $10, $0, 12
  addi $11, $0, 0
  # tamanho das linhas
  addi $12, $0, 7
  addi $13, $0, 0
forFaceFlor:
  beq $10, $11, detalhesFaceFlor
  
  add $14, $0, $8
forLinhaFaceFlor:
  beq $12, $13, proxLinhaFaceFlor
  
  sw $9, 0($8)
  addi $8, $8, -4
  
  addi $13, $13, 1
  j forLinhaFaceFlor
  
  
proxLinhaFaceFlor:
  addi $13, $0, 0
  
  beq $11, $0, linhaMaisDoisFaceFlor
  addi $15, $0, 1
  beq $11, $15, linhaMaisDoisFaceFlor
  
  addi $15, $0, 9
  beq $11, $15, linhaMenosDoisFaceFlor
  addi $15, $0, 10
  beq $11, $15, linhaMenosDoisFaceFlor
  
  
  addi $8, $14, -512
continueProxLinhaFaceFlor:
  addi $11, $11, 1
  j forFaceFlor
  
  
linhaMaisDoisFaceFlor:
  addi $12, $12, 2
  
  addi $8, $14, -508
  j continueProxLinhaFaceFlor
  
linhaMenosDoisFaceFlor:
  addi $12, $12, -2
  
  addi $8, $14, -516
  j continueProxLinhaFaceFlor
  
  
detalhesFaceFlor:
  addi $8, $8, 1536
  ori $9, $0, 0xe5c132
  # sombrancelha
  # direita
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, 504($8)
  #esquerda
  sw $9, -28($8)
  sw $9, -24($8)
  sw $9, 492($8)
  
  # olhos
  ori $9, $0, 0x000000
  #direita
  sw $9, 1528($8)
  sw $9, 2040($8)
  # esquerda
  sw $9, 1516($8)
  sw $9, 2028($8)
  
  # nariz
  ori $9, $0, 0xf1c232
  sw $9, 2032($8)
  sw $9, 2544($8)
  sw $9, 2552($8)
  
  # boca
  addi $8, $8, 2048
  # branco
  ori $9, $0, 0xffffff
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  
  sw $9, 1016($8)
  sw $9, 1528($8)
  
  sw $9, 1008($8)
  sw $9, 1520($8)
  
  sw $9, 488($8)
  sw $9, 1000($8)
  sw $9, 1512($8)
  # cinza
  ori $9, $0, 0xd9d9d9
  sw $9, 508($8)
  sw $9, 1020($8)
  sw $9, 1532($8)
  
  sw $9, 1524($8)
  
  sw $9, 1004($8)
  sw $9, 1516($8)
  
  sw $9, -28($8)
  sw $9, 484($8)
  sw $9, 996($8)
  
  # detalhe especifico la do topo da cabeca da flor
  ori $9, $0, 0xff5100
  addi $8, $8, -7168
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -4($8)
  
  sw $9, -20($8)
  sw $9, -24($8)
  sw $9, -28($8)
  
  

cauleFlor:
  addi $8, $8, 13300
  ori $9, $0, 0x2aa800
  
  sw $9, 0($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 1020($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1536($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  
  addi $8, $8, 2052
  
  # tamanho das colunas
  addi $10, $0, 7
  addi $11, $0, 0
forCauleEspecificoFlor:
  beq $10, $11, continuacaoCauleFlor
  
  sw $9, 0($8)
  sw $9, 4($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forCauleEspecificoFlor


continuacaoCauleFlor:
  addi $8, $8, -2052
  
  # qt de colunas
  addi $10, $0, 7
  addi $11, $0, 0
  # tamanho das colunas
  addi $12, $0, 7
  addi $13, $0, 0
forCauleFlor:
  beq $10, $11, detalhesCauleFlor
  
  add $14, $0, $8
forColunaCauleFlor:
  beq $12, $13, proxColunaCauleFlor
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $13, $13, 1
  j forColunaCauleFlor
  
  
  
proxColunaCauleFlor:
  addi $13, $0, 0
  
  # colunas especificas
  beq $11, $0, regOnzeZeroColunaCauleFlor
  
  addi $15, $0, 1
  beq $11, $15, regOnzeUmColunaCauleFlor
  
  addi $15, $0, 2
  beq $11, $15, regOnzeDoisColunaCauleFlor
  
  addi $15, $0, 3
  beq $11, $15, regOnzeTresColunaCauleFlor

  # default
  addi $12, $12, -1
  addi $8, $14, 508
continueProxColunaCauleFlor:
  addi $11, $11, 1
  j forCauleFlor


regOnzeZeroColunaCauleFlor:
  addi $8, $14, 1020
  j continueProxColunaCauleFlor
  
regOnzeUmColunaCauleFlor:
  addi $12, $12, -2
  addi $8, $14, 1020
  j continueProxColunaCauleFlor

regOnzeDoisColunaCauleFlor:
  addi $12, $12, 1
  addi $8, $14, 508
  j continueProxColunaCauleFlor
  
regOnzeTresColunaCauleFlor:
  addi $12, $12, -2
  addi $8, $14, 1020
  j continueProxColunaCauleFlor
  
  
  
detalhesCauleFlor:
  ori $9, $0, 0xffd738
  sw $9, -1000($8)
  sw $9, -1016($8)
  sw $9, -3052($8)
  sw $9, -3548($8)
  sw $9, -5092($8)
  sw $9, -6104($8)
  
  
  
maoDireitaFlor:
  addi $8, $8, -11196
  # verde claro
  ori $9, $0, 0x2aa800
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 524($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1040($8)
  sw $9, 1552($8)
  sw $9, 1556($8)
  sw $9, 2060($8)
  sw $9, 2064($8)
  sw $9, 2068($8)
  sw $9, 2568($8)
  sw $9, 2572($8)
  sw $9, 2576($8)
  sw $9, 2580($8)
  sw $9, 3076($8)
  sw $9, 3080($8)
  sw $9, 3084($8)
  sw $9, 3088($8)
  sw $9, 3588($8)
  sw $9, 3592($8)
  # verde escuro
  ori $9, $0, 0x259600
  addi $8, $8, 2564
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -520($8)
  sw $9, -516($8)
  sw $9, 508($8)
  sw $9, 1012($8)
  sw $9, 1016($8)
  sw $9, 1020($8)
  sw $9, 1032($8)
  
  # tanto mao esquerda quanto mao direita
  addi $8, $8, 1520 # direita
  addi $17, $8, 916 # esquerda
  
  # qtd de linhas
  addi $10, $0, 5
  addi $11, $0, 0
  # tamanho das linhas
  addi $12, $0, 6
  addi $13, $0, 0
forVerdeEscuroMaosFlor:
  beq $10, $11, maoEsquerdaFlor
  
  add $14, $0, $8
  add $15, $0, $17
forLinhasVerdeEscuroMaosFlor:
  beq $12, $13, proxLinhaVerdeEscuroMaosFlor
  
  sw $9, 0($8)
  sw $9, 0($17)
  addi $8, $8, 4
  addi $17, $17, 4
  
  addi $13, $13, 1
  j forLinhasVerdeEscuroMaosFlor
  
  
proxLinhaVerdeEscuroMaosFlor:
  addi $13, $0, 0
  
  # linhas especificas
  addi $16, $0, 1
  beq $11, $16, regOnzeUmVerdeEscuroMaosFlor
  bgt $11, $16, ultimasLinhasVerdeEscuroMaosFlor

  # default
  addi $12, $12, 1
  addi $8, $14, 508
  addi $17, $15, 508
continueProxLinhaVerdeEscuroMaosFlor:
  addi $11, $11, 1
  j forVerdeEscuroMaosFlor
  
  
regOnzeUmVerdeEscuroMaosFlor:
  addi $8, $14, 508
  addi $17, $15, 508
  j continueProxLinhaVerdeEscuroMaosFlor
  
ultimasLinhasVerdeEscuroMaosFlor:
  addi $12, $12, -2
  addi $8, $14, 512
  addi $17, $15, 512
  j continueProxLinhaVerdeEscuroMaosFlor
  
  

maoEsquerdaFlor:
  addi $8, $17, -6608
  # verde claro
  ori $9, $0, 0x2aa800
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1532($8)
  sw $9, 1536($8)
  sw $9, 2040($8)
  sw $9, 2044($8)
  sw $9, 2048($8)
  sw $9, 2544($8)
  sw $9, 2548($8)
  sw $9, 2552($8)
  sw $9, 2556($8)
  sw $9, 3052($8)
  sw $9, 3056($8)
  sw $9, 3060($8)
  sw $9, 3064($8)
  sw $9, 3068($8)
  sw $9, 3564($8)
  sw $9, 3568($8)
  # verde escuro
  ori $9, $0, 0x259600
  addi $8, $8, 3560
  sw $9, -8($8)
  sw $9, -4($8)
  sw $9, 0($8)
  sw $9, 12($8)
  sw $9, 520($8)
  sw $9, 1032($8)
  sw $9, -512($8)
  sw $9, -1020($8)
  sw $9, -1024($8)
  sw $9, -1536($8)
  sw $9, -1540($8)
  
  
peFlor:
  addi $8, $8, 6176
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 16($8)
  sw $9, 20($8)
  sw $9, 24($8)
  sw $9, 28($8)
  sw $9, 32($8)
  sw $9, 508($8)
  sw $9, 512($8)
  sw $9, 524($8)
  sw $9, 532($8)
  sw $9, 544($8)
  sw $9, 548($8)
  sw $9, 1020($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1060($8)
  sw $9, 1568($8)
  sw $9, 1572($8)
  sw $9, 1544($8)
  sw $9, 2056($8)
  sw $9, 2572($8)
  # verde claro
  ori $9, $0, 0x2aa800
  sw $9, 12($8)
  sw $9, 516($8)
  sw $9, 536($8)
  sw $9, 540($8)
  sw $9, 1040($8)
  sw $9, 1044($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1052($8)
  sw $9, 1056($8)
  sw $9, 1532($8)
  sw $9, 1536($8)
  sw $9, 1548($8)
  sw $9, 1552($8)
  sw $9, 2060($8)
  sw $9, 2064($8)
  
  

retornoCriarFlor:
  # reset do argumento
  addi $4, $0, 0

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
  lw $12, 0($sp)
  
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
