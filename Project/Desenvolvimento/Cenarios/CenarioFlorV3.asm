.text

.globl main, end # Exporta as labels para outros arquivos do diretorio

main:
  lui $8, 0x1001 # Endereço inicial do cenario
    
  # Criaçao do ceu
  ori $9, $0, 0x5fcde4 # cor
  addi $10, $0, 32768   # qtd de pixels
  addi $11, $0, 0      # somador
forCeu: 
  beq $11, $10, criarChao
     
  # Substitui o endereço de memoria de $8 para a cor que esta no $9
  sw $9, 0($8)
  # Muda o ponteiro do $8 para o proximo endereço de memoria
  addi $8, $8, 4
     
  addi $11, $11, 1
  j forCeu
     
     
     
criarChao:
  lui $8, 0x1001
  addi $8, $8, 17408
  # Manda pro $12 o inicio do topo do chao
  lw $12, 0($8)
  
  ori $9, $0, 0xd9a066
  addi $10, $0, 15360
  addi $11, $0, 0
forChao:
  beq $11, $10, criarMar
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forChao
  
  
  
criarMar:
  lui $8, 0x1001
  addi $8, $8, 10752
  
  ori $9, $0, 0x639bff
  
  addi $10, $0, 1664
  addi $11, $0, 0
forCriarMar:
  beq $10, $11, criarMontanhas
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCriarMar
  
  
  
criarMontanhas:
  lui $8, 0x1001
  addi $8, $8, 5632
  
  ori $9, $0, 0x6abe30
  
  # montanha da esquerda
  addi $10, $0, 45 # qtd de colunas
  addi $11, $0, 0  # somador da qtd de colunas
  
  addi $14, $0, 23 # tamanho da coluna
  addi $15, $0, 0  # somador do tamanho da coluna
  addi $16, $0, -1 # se for 0 deve criar coluna dupla
forMontanhaEsq:
  beq $10, $11, montanhasCentro
  
  blt $16, $0, inicioMontanhaEsq
  
  beq $16, $0, forColunaDupla
forColunaTripla:
  beq $14, $15, fimColunaTripla
  
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  addi $8, $8, 512
  
  addi $15, $15, 1
  j forColunaTripla
  
forColunaDupla:
  beq $14, $15, fimColunaDupla
  
  sw $9, 0($8)
  sw $9, 4($8)
  addi $8, $8, 512
  
  addi $15, $15, 1
  j forColunaDupla
  
  
inicioMontanhaEsq:
  addi $24, $0, 9 # qtd de colunas iniciais - 1
  addi $25, $0, 0
forColunaInicioMontanhaEsq:
  beq $14, $15, fimColunaInicioMontanhaEsq
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $15, $15, 1
  j forColunaInicioMontanhaEsq
  
fimColunaInicioMontanhaEsq:
  beq $24, $25, fimInicioMontanhaEsq
  
  addi $25, $25, 1    # qtd de colunas ++
  addi $15, $0, 0     # reseta o contador do tamanho da coluna
  addi $8, $8, -11772 # muda o ponteiro $8 para o proximo pixel do inicio
  j forColunaInicioMontanhaEsq
  
fimInicioMontanhaEsq:
  addi $15, $0, 0   # reseta o contador do tamanho da coluna
  addi $14, $14, -1 # reduz em 1 o tamanho das colunas
  addi $8, $8, -11264
  addi $16, $0, 1   # determina que começara com coluna tripla
  j forMontanhaEsq
  
  
fimColunaTripla:
  addi $11, $11, 3  # soma o contador de colunas
  addi $15, $0, 0   # reseta o tamanho da coluna
  addi $14, $14, -1 # reduz o tamanho da coluna
  addi $16, $0, 0   # define em 0 para a proxima coluna ser unica
  
  # define a proxima coluna pro inicio da proxima com 1 bit abaixo
  addi $25, $0, -512
  mul $25, $25, $14
  addi $25, $25, 12
  add $8, $8, $25
  j forMontanhaEsq

fimColunaDupla:
  addi $11, $11, 2  # soma o contador de colunas
  addi $15, $0, 0   # reseta o tamanho da coluna
  addi $14, $14, -1 # reduz o tamanho da coluna
  addi $16, $0, 1   # define em 1 para a proxima coluna ser dupla
  
  # define a proxima coluna pro inicio da proxima com 1 bit abaixo
  addi $25, $0, -512
  mul $25, $25, $14
  addi $25, $25, 8
  add $8, $8, $25
  j forMontanhaEsq
  
  
  
montanhasCentro:
  addi $8, $8, -512
  
  # Loop criador da linha
  addi $10, $0, 22 # largura da linha
  addi $11, $0, 0
  
  # Loop da qtd de linhas
  addi $14, $0, 5
  addi $15, $0, 0
forCriarLinhaMontanhaCentro:
  beq $14, $15, montanhaDireita
  beq $10, $11, proxLinhaMontanhaCentro
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forCriarLinhaMontanhaCentro
  
proxLinhaMontanhaCentro:
  addi $15, $15, 1
  addi $11, $0, 0
  addi $8, $8, 424 # inicio da linha de baixo
  j forCriarLinhaMontanhaCentro
  
  
  
montanhaDireita:
  lui $8, 0x1001
  addi $8, $8, 10236 # inicio das colunas da montanha da direita
  
  # Loop da criaçao das colunas
  addi $10, $0, 15 # altura das colunas
  addi $11, $0, 0
  
  # Loop da qtd de colunas
  addi $14, $0, 42
  addi $15, $0, 0
  
  addi $16, $0, -1 # Define qual o tipo da coluna a ser feita;  -1 = inicial; 0 == tripla; 1 == quadrupla
forMontanhaDireita:
  beq $14, $15, criarArvore
  
  blt $16, $0, inicioMontanhaDireita
  
  beq $16, $0, forColunaTriplaMontanhaDireita
forColunaQuadruplaMontanhaDireita:
  beq $10, $11, fimColunaQuadruplaMontanhaDireita
  
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  sw $9, -12($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forColunaQuadruplaMontanhaDireita
  
fimColunaQuadruplaMontanhaDireita:
  addi $11, $0, 0
  addi $15, $15, 4
  addi $16, $0, 0
  addi $10, $10, -1
  # define a proxima coluna pro inicio da proxima com 1 bit abaixo
  addi $25, $0, -512
  mul $25, $25, $10
  addi $25, $25, -16
  add $8, $8, $25
  j forMontanhaDireita
  
  
forColunaTriplaMontanhaDireita:
  beq $10, $11, fimColunaTriplaMontanhaDireita
  
  sw $9, 0($8)
  sw $9, -4($8)
  sw $9, -8($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forColunaTriplaMontanhaDireita
  
fimColunaTriplaMontanhaDireita:
  addi $11, $0, 0
  addi $15, $15, 3
  addi $16, $0, 1
  addi $10, $10, -1
  # define a proxima coluna pro inicio da proxima com 1 bit abaixo
  addi $25, $0, -512
  mul $25, $25, $10
  addi $25, $25, -12
  add $8, $8, $25
  j forMontanhaDireita
  
  
inicioMontanhaDireita:
  addi $24, $0, 13 # qtd de colunas iniciais
  addi $25, $0, 0
forColunasInicioMontanhaDireita:
  beq $11, $10, proximaColunaInicioMontanhaDireita
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forColunasInicioMontanhaDireita
  
proximaColunaInicioMontanhaDireita:
  beq $24, $25, fimInicioMontanhaDireita
  
  addi $25, $25, 1
  addi $8, $8, -7684
  addi $11, $0, 0
  j forColunasInicioMontanhaDireita
  
fimInicioMontanhaDireita:
  addi $11, $0, 0
  addi $16, $0, 0
  addi $8, $8, -7684
  j forMontanhaDireita


criarArvore:
  lui $8, 0x1001
  addi $8, $8, 8152 # posiçao inicial da arvore de cima pra baixo
  ori $9, $0, 0x6a5f3d
  
  # primeiro loop
  addi $10, $0, 39
  addi $11, $0, 0
  
  # loop interior
  addi $14, $0, 7
  addi $15, $0, 0
  
forCriarArvore:
  beq $10, $11, proximaColunaCriarArvore
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forCriarArvore
  
proximaColunaCriarArvore:
  beq $14, $15, baseDaArvore
  
  addi $11, $0, 0
  addi $15, $15, 1
  addi $8, $8, -19964
  j forCriarArvore
  
baseDaArvore:
  lui $8, 0x1001
  addi $8, $8, 27604
  
forBaseDaArvore:
  j end



end:
  addi $2, $0, 10
  syscall
