.text

.globl cenarioFlor # Exporta as labels para outros arquivos do diretorio

cenarioFlor:
  lui $8, 0x1001 # Endereço inicial do cenario
    
  # Criaçao do ceu
  ori $9, $0, 0x5fcde4  # cor
  addi $10, $0, 32768   # qtd de pixels
  addi $11, $0, 0       # somador
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
  add $12, $0, $8

  ori $9, $0, 0xd9a066
  addi $10, $0, 3208
  addi $11, $0, 0
forChao:
  beq $11, $10, chaoArredondamento
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forChao
  
  
  
chaoArredondamento:
  lui $8, 0x1001
  addi $8, $8, 17408 
  # Arredondamento
  ori $9, $0, 0x8bbe67
  
  # Loop da qtd de linhas
  addi $10, $0, 6
  addi $11, $0, 0
  
  # Loop preenchedor de linhas
  addi $14, $0, 24
  addi $15, $0, 0
forArredondamento:
  beq $10, $11, chaoArredondamentoDireita

forLinhasArredondamento:
  beq $14, $15, fimLinhaArredondamento

  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $15, $15, 1
  j forLinhasArredondamento
  
fimLinhaArredondamento:
  addi $11, $11, 1
  addi $14, $14, -4
  addi $15, $0, 0
  
  # Endereço de memoria do inicio da proxima linha
  add $8, $0, $12
  mul $24, $11, 512
  add $8, $8, $24
  j forArredondamento
 
   

chaoArredondamentoDireita:
  lui $8, 0x1001
  addi $8, $8, 17916
  add $23, $0, $8
  
  # Loop da qtd de linhas
  addi $10, $0, 6
  addi $11, $0, 0
  
  # Loop preenchedor de linhas
  addi $14, $0, 24
  addi $15, $0, 0
forArredondamentoDireita:
  beq $10, $11, criarMar

forLinhasArredondamentoDireita:
  beq $14, $15, fimLinhaArredondamentoDireita

  sw $9, 0($8)
  addi $8, $8, -4
  
  addi $15, $15, 1
  j forLinhasArredondamentoDireita
  
fimLinhaArredondamentoDireita:
  addi $11, $11, 1
  addi $14, $14, -4
  addi $15, $0, 0
  
  # Endereço de memoria do inicio da proxima linha
  add $8, $0, $23
  mul $24, $11, 512
  add $8, $8, $24
  j forArredondamentoDireita
  
  
  
criarMar:
  lui $8, 0x1001
  addi $8, $8, 10752
  
  ori $9, $0, 0x9aa4e1
  
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
  
  ori $9, $0, 0x8bbe67
  
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
 
  
    
gramaEmbaixo:
  lui $8, 0x1001
  addi $8, $8, 30208
  
  ori $9, $0, 0x395023
  
  addi $10, $0, 128
  addi $11, $0, 0
forGramaEmbaixo:
  beq $10, $11, detalhesGramaEmbaixo
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forGramaEmbaixo
  
detalhesGramaEmbaixo:
  lui $8, 0x1001
  addi $8, $8, 30148
  
  # Parte da direita embaixo da arvore
  addi $10, $0, 15
  addi $11, $0, 0
  # Loop para desenhar as linhas
  addi $13, $0, 15
  addi $14, $0, 0
forDetalheDireitaGramaEmbaixo:
  beq $10, $11, detalheEsquerdaGramaEmbaixo
  
forLinhasDetalheDireitaGramaEmbaixo:
  beq $13, $14, fimLinhaDetalheDireitaEmbaixo
    
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  
  j forLinhasDetalheDireitaGramaEmbaixo
 
fimLinhaDetalheDireitaEmbaixo: 
  addi $11, $11, 1
  addi $13, $13, -1 # reduz o tamanho da linha
  addi $14, $0, 0   # reset do somador
  
  # Retorno pro pixel de cima
  addi $8, $8, -512
  addi $25, $0, -4
  mul $25, $13, $25
  add $8, $8, $25
  j forDetalheDireitaGramaEmbaixo
  
  
  
detalheEsquerdaGramaEmbaixo:
  lui $8, 0x1001
  addi $8, $8, 29696
  
  addi $10, $0, 5
  addi $11, $0, 0
forDetalheEsquerdaGramaEmbaixo:
  beq $10, $11, continueDetalheEsquerdaGramaEmbaixo
  
  sw $9, 0($8)
  sw $9, -512($8)
  sw $9, -1024($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forDetalheEsquerdaGramaEmbaixo
  
continueDetalheEsquerdaGramaEmbaixo:
  # Detalhes mais especificos da parte de baixo
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, -512($8)
  sw $9, -1024($8)
  sw $9, -3072($8)
  
  sw $9, 12($8)
  sw $9, 24($8)
  sw $9, -500($8)
  sw $9, -496($8)
  sw $9, -1008($8)
  
  sw $9, 32($8)
  sw $9, -480($8)
  sw $9, 36($8)
  sw $9, 40($8)
  sw $9, 44($8)
  
  sw $9, 52($8)
  sw $9, 60($8)
  sw $9, -452($8)
  
  sw $9, 68($8)
  sw $9, -444($8)
  sw $9, -440($8)
  
  sw $9, 80($8)
  sw $9, 84($8)
  sw $9, 88($8)
  sw $9, 92($8)
  sw $9, -428($8)
  sw $9, -424($8)
  sw $9, -940($8)
  
  sw $9, 100($8)
  sw $9, 104($8)
  sw $9, 108($8)
  sw $9, 112($8)
  sw $9, 116($8)
  sw $9, 120($8)
  sw $9, 124($8)
  sw $9, -408($8)
  sw $9, -404($8)
  sw $9, -400($8)
  sw $9, -916($8)
  sw $9, -912($8)
  sw $9, -908($8)
  sw $9, -1424($8)
  sw $9, -1420($8)
  sw $9, -1416($8)
  
  sw $9, 132($8)
  sw $9, 136($8)
  sw $9, 140($8)
  sw $9, -380($8)
  sw $9, -376($8)
  sw $9, -892($8)
  sw $9, -1404($8)
  sw $9, -1916($8)
  
  sw $9, 148($8)
  sw $9, 152($8)
  sw $9, 160($8)
  sw $9, 164($8)
  sw $9, -360($8)
  sw $9, -356($8)
  sw $9, -868($8)
  sw $9, -864($8)
  
  sw $9, 176($8)
  sw $9, -336($8)
  sw $9, -332($8)
  sw $9, -848($8)
  sw $9, -844($8)
  sw $9, -1360($8)
  
  sw $9, 192($8)
  sw $9, -320($8)
  sw $9, -316($8)
  sw $9, -312($8)
  sw $9, -832($8)
  sw $9, -824($8)
  sw $9, -820($8)
  sw $9, -1344($8)
  sw $9, -1348($8)
  
  sw $9, 212($8)
  sw $9, 216($8)
  sw $9, 220($8)
  sw $9, -300($8)
  sw $9, -292($8)
  sw $9, -804($8)
  sw $9, -800($8)
  sw $9, -1316($8)
  
  sw $9, 236($8)
  sw $9, -276($8)
  sw $9, -280($8)
  sw $9, -788($8)
  
  sw $9, 244($8)
  sw $9, -268($8)
  sw $9, -264($8)
  
  sw $9, 260($8)
  sw $9, 264($8)
  sw $9, -252($8)
  sw $9, -248($8)
  sw $9, -244($8)
  sw $9, -764($8)
  sw $9, -768($8)
  
  sw $9, 284($8)
  sw $9, -228($8)
  sw $9, -224($8)
  sw $9, -736($8)
  sw $9, -732($8)
  sw $9, -232($8)
  sw $9, -744($8)
  sw $9, -748($8)
  
  sw $9, 304($8)
  sw $9, 308($8)
  sw $9, 312($8)
  sw $9, 316($8)
  sw $9, 320($8)
  sw $9, 324($8)
  sw $9, 328($8)
  sw $9, 332($8)
  sw $9, 336($8)
  sw $9, 340($8)
  sw $9, -208($8)
  sw $9, -200($8)
  sw $9, -196($8)
  sw $9, -192($8)
  sw $9, -184($8)
  sw $9, -180($8)
  sw $9, -176($8)
  sw $9, -696($8)
  
  sw $9, 356($8)
  sw $9, 360($8)
  sw $9, 364($8)
  sw $9, 368($8)
  sw $9, 372($8)
  sw $9, 376($8)
  sw $9, 380($8)
  sw $9, 384($8)
  sw $9, 388($8)
  sw $9, 392($8)
  sw $9, -160($8)
  sw $9, -156($8)
  sw $9, -152($8)
  sw $9, -148($8)
  sw $9, -144($8)
  sw $9, -140($8)
  sw $9, -136($8)
  sw $9, -132($8)
  sw $9, -128($8)
  sw $9, -652($8)
  sw $9, -656($8)
  
  sw $9, 404($8)
  sw $9, 408($8)
  sw $9, 412($8)
  sw $9, -108($8)
  sw $9, -104($8)
  sw $9, -100($8)
  sw $9, -620($8)
  sw $9, -612($8)
  sw $9, -608($8)
  
  #########################
  
  lui $8, 0x1001
  addi $8, $8, 28164
  
  addi $10, $0, 4
  addi $11, $0, 0
  
  # Para o loop criador de linhas
  addi $13, $0, 4
  addi $14, $0, 0
forContinueDetalheEsquerdaGramaEmbaixo:
  beq $10, $11, retorno
  
forLinhasDetalheEsquerdaGramaEmbaixo:
  beq $13, $14, fimLinhaDetalheEsquerdaGramaEmbaixo
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $14, $14, 1
  j forLinhasDetalheEsquerdaGramaEmbaixo
  
fimLinhaDetalheEsquerdaGramaEmbaixo:
  addi $11, $11, 1
  addi $13, $13, -1
  addi $14, $0, 0
  
  addi $8, $8, -512
  addi $25, $0, -4
  mul $25, $25, $13
  add $8, $8, $25
  
  j forContinueDetalheEsquerdaGramaEmbaixo
  


retorno:
  jr $31
