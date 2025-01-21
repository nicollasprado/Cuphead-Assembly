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
  addi $12, $0, 18
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
  addi $15, $0, 9
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
  addi $17, $17, 2692
  
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
  addi $8, $8, 116
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
  beq $10, $11, end #continueDetalhesFundoCabecaFlor
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forLinhaBaseFundoCabecaFlor
  
  

end:
  addi $2, $0, 10
  syscall