.text

.globl criarCenario # Exporta as labels para outros arquivos do diretorio

criarCenario:
  lui $8, 0x1001 # Endereço inicial do cenario
    
  # Criaçao do ceu
  ori $9, $0, 0x66B2FF # cor
  addi $10, $0, 5120   # qtd de pixels
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
  # Manda pro $12 o inicio do topo do chao
  lw $12, 0($8)
  
  ori $9, $0, 0x994C00
  addi $10, $0, 3072
  addi $11, $0, 0
forChao:
  beq $11, $10, retorno
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forChao
  
retorno:
  jr $31
