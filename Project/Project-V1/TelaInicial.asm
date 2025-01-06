.text
.globl telaInicial

# Preenche o fundo
telaInicial:
  sw $31, 0($sp)    # Armazena na pilha o endereço de retorno do RUN
  addi $sp, $sp, -4 # Atualiza o ponteiro do endereço de memoria da pilha


  lui $8, 0x1001
  ori $9, $0, 0x1E90FF
  
  addi $10, $0, 8192
  addi $11, $0, 0
forTelaInicial:
  beq $10, $11, titulo
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forTelaInicial
  
  
  
titulo:
  ori $9, $0, 0xffffff
  
  lui $8, 0x1001
  addi $8, $8, 1128
  add $25, $0, $8
  
  addi $10, $0, 6
  addi $11, $0, 0
forLetraC:
  beq $10, $11, lateralLetraC
  
  sw $9, 0($8)    # Parte de cima
  sw $9, 5120($8) # parte de baixo
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forLetraC
  
lateralLetraC:
  addi $8, $25, 512 # Recupera o valor debaixo do inicio do C
  
  addi $10, $0, 9
  addi $11, $0, 0
forLateralLetraC:
  beq $10, $11, letraU
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralLetraC
  
  
letraU:
  addi $8, $25, 44
  add $25, $0, $8
  
  addi $10, $0, 10
  addi $11, $0, 0
forLateraisLetraU:
  beq $10, $11, baseLetraU
  
  sw $9, 0($8)
  sw $9, 24($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateraisLetraU
  
baseLetraU:
  addi $8, $25, 5120 # recupera o valor da base do U
  
  addi $10, $0, 7
  addi $11, $0, 0
forBaseLetraU:
  beq $10, $11, letraP
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBaseLetraU
  
  
letraP:
  addi $8, $25, 44
  add $25, $0, $8
  
  addi $10, $0, 11
  addi $11, $0, 0
forLetraP: # lateral da letra p
  beq $10, $11, curvaLetraP
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLetraP
  
curvaLetraP:
  addi $8, $25, 4
  add $25, $0, $8
  
  addi $10, $0, 5
  addi $11, $0, 0
forBaixoCimaCurvaLetraP:
  beq $10, $11, lateralCurvaLetraP
  
  sw $9, 0($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBaixoCimaCurvaLetraP
  
lateralCurvaLetraP:
  addi $8, $8, 512
  
  addi $10, $0, 3
  addi $11, $0, 0
forLateralCurvaLetraP:
  beq $10, $11, letraH
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralCurvaLetraP
  
  
letraH:
  addi $8, $25, 40
  add $25, $0, $8
  
  addi $10, $0, 11
  addi $11, $0, 0
forLateraisLetraH:
  beq $10, $11, meioLetraH
  
  sw $9, 0($8)
  sw $9, 24($8)
  addi $8, $8, 512

  addi $11, $11, 1
  j forLateraisLetraH
  
meioLetraH:
  addi $8, $25, 2564
  
  addi $10, $0, 5
  addi $11, $0, 0
forMeioLetraH:
  beq $10, $11, letraE
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forMeioLetraH
  
  
letraE:
  addi $8, $25, 44
  add $25, $0, $8
  
  addi $10, $0, 11
  addi $11, $0, 0
forLateralLetraE:
  beq $10, $11, restoLetraE
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralLetraE
        
restoLetraE:
  add $8, $0, $25
  addi $10, $0, 6
  addi $11, $0, 0
forRestoLetraE:
  beq $10, $11, letraA
  
  sw $9, 0($8)
  sw $9, 2560($8)
  sw $9, 5120($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoLetraE
  

letraA:
  addi $8, $25, 44
  add $25, $0, $8
  
  addi $8, $8, 512
  addi $10, $0, 10
  addi $11, $0, 0
forLetraA:
  beq $10, $11, meioLetraA
  
  sw $9, 0($8)
  sw $9, 24($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLetraA
  
meioLetraA:
  addi $8, $25, 4
  addi $10, $0, 5
  addi $11, $0, 0
forMeioLetraA:
  beq $10, $11, letraD
  
  sw $9, 0($8)
  sw $9, 2560($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forMeioLetraA
  
  
letraD:
  addi $8, $25, 44
  add $25, $0, $8
  
  addi $10, $0, 11
  addi $11, $0, 0
forLateralLetraD:
  beq $10, $11, meioLetraD
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralLetraD
  
meioLetraD:
  add $8, $0, $25
  addi $10, $0, 6
  addi $11, $0, 0
forMeioLetraD:
  beq $10, $11, restoLetraD
  
  sw $9, 0($8)
  sw $9, 5120($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forMeioLetraD
  
restoLetraD:
  addi $8, $8, 512
  addi $10, $0, 9
  addi $11, $0, 0
forRestoLetraD:
  beq $10, $11, botaoJogar
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forRestoLetraD
  
  
  
botaoJogar:
  ori $9, $0, 0xffffff
  
  lui $8, 0x1001
  addi $8, $8, 11392 # define o inicio do botao jogar
  add $25, $0, $8   # armazena o inicio do botao jogar no reg 25
  add $26, $0, $8
  
  addi $10, $0, 64
  addi $11, $0, 0
  
forBotaoJogar:
  beq $10, $11, lateraisBotaoJogar
  
  sw $9, 0($8)
  sw $9, 6656($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBotaoJogar
  
  
lateraisBotaoJogar:
  addi $8, $25, 508 # recupera o valor do anterior ao inicio do botao
  
  addi $10, $0, 12
  addi $11, $0, 0
  
forLateraisBotaoJogar:
  beq $10, $11, preencherBotaoJogar
  
  sw $9, 0($8)     # esquerda
  sw $9, 260($8)   # direita
  addi $8, $8, 512 # proxima linha
  
  addi $11, $11, 1
  j forLateraisBotaoJogar
  
  
preencherBotaoJogar:
  addi $23, $25, 512
  addi $4, $0, 1
  addi $5, $0, 0
  jal preencherBotao
  
jal letrasBotaoJogar
  
  
botaoSkins:
  ori $9, $0, 0xffffff
  
  lui $8, 0x1001
  addi $8, $26, 10240 # define o inicio do botao jogar
  add $25, $0, $8   # armazena o inicio do botao jogar no reg 25
  
  addi $10, $0, 64
  addi $11, $0, 0
  
forBotaoSkins:
  beq $10, $11, lateraisBotaoSkins
  
  sw $9, 0($8)
  sw $9, 6656($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBotaoSkins
  
  
lateraisBotaoSkins:
  addi $8, $25, 508 # recupera o valor do anterior ao inicio do botao
  
  addi $10, $0, 12
  addi $11, $0, 0
  
forLateraisBotaoSkins:
  beq $10, $11, preencherBotaoSkins
  
  sw $9, 0($8)     # esquerda
  sw $9, 260($8)   # direita
  addi $8, $8, 512 # proxima linha
  
  addi $11, $11, 1
  j forLateraisBotaoSkins
  
  
preencherBotaoSkins:
  ori $9, $0, 0xD2691E
  addi $8, $25, 512 # recupera o valor do inicio da parte interna do botao
  add $24, $0, $8   # salva o inicio da parte interna do botao skins
  
  addi $10, $0, 64
  addi $11, $0, 0
  
  addi $12, $0, 11
  addi $13, $0, 0
 
forPreencherBotaoSkins:
  addi $24, $25, 512
  addi $4, $0, 0
  addi $5, $0, 1
  jal preencherBotao
  
  
escolherBotao:
  lui $19, 0xffff # Armazena o   endereco de memoria     que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  addi $16, $0, 32 # espaco ascii
  addi $17, $0, 87 # W ascii
  addi $18, $0, 83 # S ascii
  addi $22, $0, 0 # botao selecionado -  0 = jogar; 1 = skin
  
forEscolherBotao:
  lw $20, 0($19) # armazena no $20 o que esta no endereço de memoria apontado por $19
  beq $20, $0, continue
  lw $21, 4($19) # Armazena no $21 a tecla pressionada
  
  beq $21, $17, wPressionado
  addi $17, $0, 119 # w ascii
  beq $21, $17, wPressionado
  addi $17, $0, 87 # W ascii
  
  beq $21, $18, sPressionado
  addi $18, $0, 115 # s ascii
  beq $21, $18, sPressionado
  addi $18, $0, 83 # S ascii
  
  beq $21, $16, espacoPressionado
  
  j continue
  
  
espacoPressionado:
  bne $22, $0, botaoDeBaixo # botao de baixo selecionado, ainda falta implementar
  
  addi $3, $0, 1 # 1 = jogar selecionado
  j retorno
  
botaoDeBaixo:
  addi $3, $0, 0
  j retorno
  
  
wPressionado:
  beq $22, $0, continue # Jogar ja esta selecionado
  
  # selecionar botao jogar
  addi $4, $0, 1
  addi $5, $0, 0
  jal preencherBotao
  
  # tirar a selecao do botao skins
  addi $4, $0, 0
  addi $5, $0, 1
  jal preencherBotao
  
  addi $22, $0, 0
  j continue
  
  
sPressionado:
  bne $22, $0, continue # Skins ja esta selecionado
  
  # selecionar botao skins
  addi $4, $0, 1
  addi $5, $0, 1
  jal preencherBotao
  
  # tirar a selecao do botao jogar
  addi $4, $0, 0
  addi $5, $0, 0
  jal preencherBotao
  
  addi $22, $0, 1
  j continue
  
continue:
  j forEscolherBotao
  
retorno:
  addi $sp, $sp, 4 # recupera o endereço de retorno da funçao na pilha
  lw $31, 0($sp)
  jr $31
  
  
  
  
  
  
  
#####################################################
# Functions

# Preencher Botao
# $4 = esta selecionado - 0 se nao; 1 se sim
# $5 = index do botao - 0 botao jogar; 1 botao de skins
# retorno = void

preencherBotao:
  sw $31, 0($sp) # Armazena na pilha o endereço de retorno da funcao
  addi $sp, $sp, -4 # Atualiza o ponteiro do endereço de memoria da pilha

  beq $4, $0, botaoNaoSelecionado
  ori $9, $0, 0xeb984e # botao selecionado
  j preencherBotaoIndex
 
botaoNaoSelecionado:
  ori $9, $0, 0xD2691E
  j preencherBotaoIndex
  
preencherBotaoIndex:
  beq $5, $0, botaoJogarEscolhido
  add $8, $0, $24
  j preencherBotaoEscolhido
  
botaoJogarEscolhido:
  add $8, $0, $23
  j preencherBotaoEscolhido

preencherBotaoEscolhido:
  addi $10, $0, 64
  addi $11, $0, 0
  
  addi $12, $0, 11
  addi $13, $0, 0
 
forPreencherBotao:
  beq $10, $11, nextLine
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherBotao
  
# itera as linhas do interior do botao
nextLine:
  beq $12, $13, fimPreenchimento
  
  addi $11, $0, 0
  addi $8, $8, 256 # pula pra proxima linha
  
  addi $13, $13, 1
  j forPreencherBotao
  
fimPreenchimento:
  bne $5, $0, escreverLetrasSkins # ainda nao tem
  
  jal letrasBotaoJogar
  
  addi $4, $0, 0
  addi $5, $0, 0
  addi $sp, $sp, 4 # recupera o endereço de retorno da funçao na pilha
  lw $31, 0($sp)
  jr $31
  
escreverLetrasSkins:
  #jal letrasBotaoSkins
  
  addi $4, $0, 0
  addi $5, $0, 0
  addi $sp, $sp, 4 # recupera o endereço de retorno da funçao na pilha
  lw $31, 0($sp)
  jr $31
  
  
  
  
# Letras Botao Jogar
# retorno void

letrasBotaoJogar:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  ori $9, $0, 0x000000
  addi $8, $23, 1076
  add $25, $0, $8
   
bjLetraJ:
  addi $8, $8, 1536
  
  addi $10, $0, 4
  addi $11, $0, 0
forBjLateralLetraJ:
  beq $10, $11, bjRestoLetraJ
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjLateralLetraJ
  
bjRestoLetraJ:
  sw $9, 4($8) # base
  sw $9, 8($8) # base
  addi $8, $25, 12
  
  addi $10, $0, 7
  addi $11, $0, 0
forBjRestoLetraJ:
  beq $10, $11, bjLetraO
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjRestoLetraJ
  

bjLetraO:
  addi $8, $25, 24
  add $25, $0, $8
  
bjLateraisLetraO:
  addi $8, $8, 512
  addi $10, $0, 6
  addi $11, $0, 0
forBjLateraisLetraO:
  beq $10, $11, bjMeioLetraO
  
  sw $9, 0($8)
  sw $9, 16($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjLateraisLetraO
  
bjMeioLetraO:
  addi $8, $25, 4
  addi $10, $0, 3
  addi $11, $0, 0
forBjMeioLetraO:
  beq $10, $11, bjLetraG
  
  sw $9, 0($8)
  sw $9, 3584($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBjMeioLetraO
  
bjLetraG:
  addi $8, $25, 28
  add $25, $0, $8
  
  addi $8, $8, 4 # inicio do meio do G
  addi $10, $0, 4
  addi $11, $0, 0
forBjMeioLetraG:
  beq $10, $11, bjLateralLetraG
  
  sw $9, 0($8)
  sw $9, 3584($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBjMeioLetraG
  
bjLateralLetraG:
  addi $8, $25, 512
  addi $10, $0, 6
  addi $11, $0, 0
forBjLateralLetraG:
  beq $10, $11, bjRestoLetraG
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjLateralLetraG
  
bjRestoLetraG:
  add $8, $0, $25
  sw $9, 3092($8)
  sw $9, 2580($8)
  sw $9, 2068($8)
  sw $9, 2064($8)
  sw $9, 2060($8)
  j bjLetraA
  

bjLetraA:
  add $8, $25, 32
  add $25, $0, $8
  
  addi $8, $8, 512 # inicio dos laterais do A
  addi $10, $0, 7
  addi $11, $0, 0
forBjLetraA:
  beq $10, $11, bjMeioLetraA
  
  sw $9, 0($8)
  sw $9, 20($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjLetraA
  
bjMeioLetraA:
  addi $8, $25, 4
  addi $10, $0, 4
  addi $11, $0, 0
forBjMeioLetraA:
  beq $10, $11, bjLetraR
  
  sw $9, 0($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBjMeioLetraA
  
  
bjLetraR:
  add $8, $25, 32
  add $25, $0, $8
  
  addi $8, $8, 512 # inicio dos laterais do A
  addi $10, $0, 7
  addi $11, $0, 0
forBjEsquerdaLetraR:
  beq $10, $11, bjDireitaLetraR
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjEsquerdaLetraR
  
bjDireitaLetraR:
  add $8, $25, 508
  addi $10, $0, 3
  addi $11, $0, 0
forBjDireitaLetraR:
  beq $10, $11, bjDireitaRestoLetraR
  
  sw $9, 20($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forBjDireitaLetraR
  
bjDireitaRestoLetraR:
  add $8, $25, 2560
  sw $9, 16($8)
  sw $9, 532($8)
  sw $9, 1044($8)
  
bjMeioLetraR:
  addi $8, $25, 4
  addi $10, $0, 3
  addi $11, $0, 0
forBjMeioLetraR:
  beq $10, $11, fimLetrasBotaoJogar
  
  sw $9, 0($8)
  sw $9, 2048($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forBjMeioLetraR
  
  
fimLetrasBotaoJogar:
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
