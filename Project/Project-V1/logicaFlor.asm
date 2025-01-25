.text
.globl logicaFlor

# Reg utilizados: $8, $9, $10, $11
logicaFlor:
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  
  sw $11, 0($sp)
  addi $sp, $sp, -4
  
  
  # Recupera o contador para utilizar o ataque de pinha novamente
  lui $8, 0x1001
  addi $8, $8, 65572
  lw $9, 0($8)
  
  ble $9, $0, ataquePinhaCooldownInicialFlor
  
  # cooldown padrao
  addi $10, $0, 32
  blt $9, $10, retornoLogicaFlor
  
continueAtaquePinhaFlor:
  
  
  
  
ataquePinhaCooldownInicialFlor:
  beq $9, $0, continueAtaquePinhaFlor
  
  # Aumenta o contador
  addi $9, $9, 1
  sw $9, 0($8)
  j retornoLogicaFlor


retornoLogicaFlor:
  addi $sp, $sp, 4
  lw $11, 0($sp)
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  j continueMovCenarioFlor