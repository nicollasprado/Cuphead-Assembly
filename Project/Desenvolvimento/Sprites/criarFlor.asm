.text

.globl criarFlor

# $4 -> Canto superior esquerdo da flor
criarFlor:
  lui $8, 0x1001
  add $8, $8, $4
  
fundoCabecaFlor:
  addi $8, $8, 1084
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
  addi $17, $17, 2688
  
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
  sw $9, 72($8)
  sw $9, 76($8)
  sw $9, 580($8)
  sw $9, 584($8)
  sw $9, 588($8)
  sw $9, 1092($8)
  sw $9, 1096($8)
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
  sw $9, 72($8)
  sw $9, 76($8)
  sw $9, -436($8)
  sw $9, -440($8)
  sw $9, -444($8)
  sw $9, -952($8)
  sw $9, -956($8)
  
  
detalhesFundoCabecaFlor:
  addi $8, $8, 12
  ori $9, $0, 0xff5100
  
  addi $10, $0, 14
  addi $11, $0, 0
forLinhaBaseFundoCabecaFlor:
  beq $10, $11, detalhesClarosCabecaFlor
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forLinhaBaseFundoCabecaFlor
  
  
  
detalhesClarosCabecaFlor:
  addi $8, $8, -1052
  
  # inferior esquerdo
  lui $14, 0x1001
  addi $14, $8, -8
  # superior direito
  lui $15, 0x1001
  addi $15, $8, -9216
  # superior esquerdo
  lui $16, 0x1001
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
  beq $10, $11, end
  
  sw $9, 0($8)
  sw $9, 4($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forCauleEspecificoFlor



  

end:
  addi $2, $0, 10
  syscall
