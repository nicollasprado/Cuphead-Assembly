.text
.globl telaInicial

.main: j telaInicial


# Preenche o fundo
telaInicial:
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
  
  addi $10, $0, 11
  addi $11, $0, 0
forLetraA:
  beq $10, $11, meioLetraA
  
  sw $9, 0($8)
  sw $9, 24($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLetraA
  
meioLetraA:
  add $8, $0, $25
  addi $10, $0, 6
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
  ori $9, $0, 0xD2691E
  addi $8, $25, 512 # recupera o valor do inicio da parte interna do botao
  add $23, $0, $8   # salva o inicio da parte interna do botao jogar
  
  addi $10, $0, 64
  addi $11, $0, 0
  
  addi $12, $0, 11
  addi $13, $0, 0
 
forPreencherBotaoJogar:
  beq $10, $11, nextLine
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherBotaoJogar
  
# itera as linhas do interior do botao
nextLine:
  beq $12, $13, botaoSkins
  
  addi $11, $0, 0
  addi $8, $8, 256 # pula pra proxima linha
  
  addi $13, $13, 1
  j forPreencherBotaoJogar
  
  
  
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
  beq $10, $11, nextLineBotaoSkins
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherBotaoSkins
  
# itera as linhas do interior do botao
nextLineBotaoSkins:
  beq $12, $13, escolherBotao
  
  addi $11, $0, 0
  addi $8, $8, 256 # pula pra proxima linha
  
  addi $13, $13, 1
  j forPreencherBotaoSkins
  
  
  
escolherBotao:
  addi $10, $0
  addi $20, $0, 1 # inicialmente começa no botao jogar
  
  
  
  
  
end:
  addi $2, $0, 10
  syscall
  
  
  
  
  
  
  
  
#####################################################
# Functions

# Preencher Botao
# $4 = esta selecionado - 0 se nao; 1 se sim
# $5 = index do botao - 0 botao jogar; 1 botao de skins
# retorno = void

preencherBotaoJogar:
  beq $4, $0, botaoNaoSelecionado
  ori $9, $0, 0xeb984e # botao selecionado
  j preencherBotaoJogarIndex
  
botaoNaoSelecionado:
  ori $9, $0, 0xD2691E
  j preencherBotaoJogarIndex
  
preencherBotaoJogarIndex:
  beq $5, $0, botaoEscolhido
  addi $8, $0, $24
  j preencherBotaoEscolhido
  
botaoEscolhido:
  addi $8, $0, $23
  j preencherBotaoEscolhido

preencherBotaoEscolhido:
  addi $10, $0, 64
  addi $11, $0, 0
  
  addi $12, $0, 11
  addi $13, $0, 0
 
forPreencherBotaoJogar:
  beq $10, $11, nextLine
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forPreencherBotaoJogar
  
# itera as linhas do interior do botao
nextLine:
  beq $12, $13, fimPreenchimento
  
  addi $11, $0, 0
  addi $8, $8, 256 # pula pra proxima linha
  
  addi $13, $13, 1
  j forPreencherBotaoJogar
  
fimPreenchimento
  addi $4, $0, 0
  addi $5, $0, 0
  jr $31
