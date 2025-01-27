.text
.globl rParaVoltarProMenu

telaGameOver:
  lui $8, 0x1001
  ori $9, $0, 0x000000
  
  addi $10, $0, 8192
  addi $11, $0, 0
forTelaInicial:
  beq $10, $11, letraGTGO
  
  sw $9, 0($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forTelaInicial
  

letraGTGO:
  lui $8, 0x1001
  addi $8, $8, 6180
  
  ori $9, $0, 0xffffff
  
  addi $10, $0, 15
  addi $11, $0, 0
forLateralGTGO:
  beq $10, $11, topoBaseGTGO

  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralGTGO
  
  
topoBaseGTGO:
  addi $10, $0, 10
  addi $11, $0, 0
forTopoBaseGTGO:
  beq $10, $11, restoGTGO
  
  sw $9, 0($8)
  sw $9, -7680($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forTopoBaseGTGO
  
  
restoGTGO:
  addi $8, $8, -4
  sw $9, -512($8)
  sw $9, -1024($8)
  sw $9, -1536($8)
  sw $9, -2048($8)
  sw $9, -2560($8)
  sw $9, -2564($8)
  
  
  # Letra A
  addi $8, $8, 12
  
  addi $10, $0, 15
  addi $11, $0, 0
forLateralATGO:
  beq $10, $11, restoAGTO
  
  sw $9, 0($8)
  sw $9, 40($8)
  addi $8, $8, -512
  
  addi $11, $11, 1
  j forLateralATGO
  
restoAGTO:
  addi $10, $0, 11
  addi $11, $0, 0
forRestoAGTO:
  beq $10, $11, letraMTGO
  
  sw $9, 0($8)
  sw $9, 4096($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoAGTO
  
  
letraMTGO:
  addi $8, $8, 8
  
  addi $10, $0, 16
  addi $11, $0, 0
forLateralMTGO:
  beq $10, $11, restoMTGO
  
  sw $9, 0($8)
  sw $9, 40($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralMTGO
  
restoMTGO:
  addi $8, $8, -8192
  sw $9, 4($8)
  sw $9, 520($8)
  sw $9, 1036($8)
  sw $9, 1552($8)
  sw $9, 36($8)
  sw $9, 544($8)
  sw $9, 1052($8)
  sw $9, 1560($8)
  sw $9, 2068($8)
  
  # Letra E
  addi $8, $8, 52
  
  addi $10, $0, 16
  addi $11, $0, 0
forLateralETGO:
  beq $10, $11, restoETGO
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralETGO
  
restoETGO:
  addi $8, $8, -512
  addi $10, $0, 10
  addi $11, $0, 0
forRestoETGO:
  beq $10, $11, letraOTGO
  
  sw $9, 0($8)
  sw $9, -3584($8)
  sw $9, -7680($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoETGO
  
  
letraOTGO:
  addi $8, $8, -472
  
  addi $10, $0, 14
  addi $11, $0, 0
forLateralOTGO:
  beq $10, $11, restoOTGO
  
  sw $9, 0($8)
  sw $9, 40($8)
  addi $8, $8, -512
  
  addi $11, $11, 1
  j forLateralOTGO
  
restoOTGO:
  addi $8, $8, 4
  
  addi $10, $0, 9
  addi $11, $0, 0
forRestoOTGO:
  beq $10, $11, letraVTGO
  
  sw $9, 0($8)
  sw $9, 7680($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoOTGO
  

letraVTGO:
  addi $8, $8, 12
  
  addi $10, $0, 11
  addi $11, $0, 0
forLateralVTGO:
  beq $10, $11, restoVTGO
  
  sw $9, 0($8)
  sw $9, 40($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLateralVTGO
  
restoVTGO:
  sw $9, 4($8)
  sw $9, 36($8)
  sw $9, 520($8)
  sw $9, 544($8)
  sw $9, 1036($8)
  sw $9, 1052($8)
  sw $9, 1552($8)
  sw $9, 1560($8)
  sw $9, 2068($8)
  
  # Letra E do over
  addi $8, $8, 2100
  
  addi $10, $0, 16
  addi $11, $0, 0
forLateralETGOover:
  beq $10, $11, restoETGOover
  
  sw $9, 0($8)
  addi $8, $8, -512
  
  addi $11, $11, 1
  j forLateralETGOover
  
restoETGOover:
  addi $8, $8, 512
  addi $10, $0, 10
  addi $11, $0, 0
forRestoETGOover:
  beq $10, $11, letraRTGO
  
  sw $9, 0($8)
  sw $9, 3584($8)
  sw $9, 7680($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoETGOover
  
  
letraRTGO:
  addi $8, $8, 12
  
  addi $10, $0, 16
  addi $11, $0, 0
forLetraRTGO:
  beq $10, $11, restoRTGO
  
  sw $9, 0($8)
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forLetraRTGO
  
restoRTGO:
  addi $8, $8, -8188
  
  addi $10, $0, 9
  addi $11, $0, 0
forRestoRTGO:
  beq $10, $11, detalhesRTGO
  
  sw $9, 0($8)
  sw $9, 3584($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forRestoRTGO
  
detalhesRTGO:
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  sw $9, 2048($8)
  sw $9, 2560($8)
  sw $9, 3072($8)
  sw $9, 3584($8)
  
  addi $8, $8, 4072
  sw $9, 0($8)
  sw $9, 516($8)
  sw $9, 1032($8)
  sw $9, 1548($8)
  sw $9, 2064($8)
  sw $9, 2580($8)
  sw $9, 3092($8)
  sw $9, 3604($8)
  
  # retorno
  jr $31
  
  
  
  
  
# Funçao para pressionar R pra reiniciar o jogo

rParaVoltarProMenu:
  jal telaGameOver

rParaVoltarProMenuLOOP:
  lui $12, 0xffff  # Armazena o endereco de memoria que armazena 1 se tiver alguma entrada do teclado e 0 se nao
  lw $13, 0($12) # armazena no $13 o que esta no endereço de memoria apontado por $12
  beq $13, $0, rParaVoltarProMenuLOOP
  
  lw $13, 4($12) # Armazena no $12 a tecla pressionada
  
  addi $14, $0, 114 # r ascii
  beq $13, $14, main
  addi $14, $0, 82 # R ascii
  beq $13, $14, main
  
  j rParaVoltarProMenuLOOP
