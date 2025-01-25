.text
.globl ataquePinhaFlor

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
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
