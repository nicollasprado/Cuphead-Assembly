.text
.globl ataquePinhaFlor, desfazerAtaquePinhaFlor

# $4 -> canto superior esquerdo do ataque
# Reg utilizados: $8, $9
ataquePinhaFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4

  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $8, 0x1001
  add $8, $8, $4
  
  # marrom claro
  ori $9, $0, 0xc28a33
  sw $9, 8($8)
  sw $9, 12($8)
  sw $9, 16($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 524($8)
  sw $9, 528($8)
  sw $9, 532($8)
  sw $9, 1024($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1040($8)
  sw $9, 1044($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  sw $9, 1548($8)
  sw $9, 1552($8)
  
  # marrom escuro
  ori $9, $0, 0xae6506
  sw $9, 20($8)
  sw $9, 536($8)
  sw $9, 1048($8)
  sw $9, 1052($8)
  sw $9, 1556($8)
  sw $9, 1560($8)
  sw $9, 2056($8)
  sw $9, 2060($8)
  sw $9, 2064($8)
  sw $9, 2068($8)
  
  # verde
  ori $9, $0, 0x259600
  sw $9, 32($8)
  sw $9, 36($8)
  sw $9, 40($8)
  sw $9, 540($8)
  sw $9, 544($8)
  sw $9, 548($8)
  sw $9, 1056($8)
  sw $9, 1564($8)
  sw $9, 1568($8)
  sw $9, 1572($8)
  sw $9, 2080($8)
  sw $9, 2084($8)
  sw $9, 2088($8)
  
  # retorno
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
  
  
#####################
# funçao para desfazer o ataque pinha da tela
# $4 => canto superior esquerdo do ataque
# Registradores usados: $8, $9, $10, $11, $13

desfazerAtaquePinhaFlor:
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
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  
  # ponteiro pro cenario principal
  lui $8, 0x1001
  add $8, $8, $4
  
  # ponteiro pra copia
  lui $9, 0x1001
  add $9, $9, $4
  addi $9, $9, 32768
  
  # tamanho das linhas
  addi $10, $0, 12
  addi $11, $0, 0
forDesfazerAtaquePinhaFlor:
  beq $10, $11, retornoDesfazerAtaquePinhaFlor
  
  lw $13, 0($9)
  sw $13, 0($8)
  
  lw $13, 512($9)
  sw $13, 512($8)
  
  lw $13, 1024($9)
  sw $13, 1024($8)
  
  lw $13, 1536($9)
  sw $13, 1536($8)
  
  lw $13, 2048($9)
  sw $13, 2048($8)
  
  addi $9, $9, 4
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forDesfazerAtaquePinhaFlor
  
retornoDesfazerAtaquePinhaFlor:
  addi $sp, $sp, 4
  lw $13, 0($sp)

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
