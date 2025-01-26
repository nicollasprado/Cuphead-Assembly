.text
.globl criarAtaqueNormalCupheadFlor

# $4 -> canto superior esquerdo do tiro
criarAtaqueNormalCupheadFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  

  lui $8, 0x1001
  add $8, $8, $4
  
  # azul escuro
  ori $9, $0, 0x3d85c6
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 512($8)
  sw $9, 516($8)
  sw $9, 524($8)
  sw $9, 528($8)
  
  # azul claro
  ori $9, $0, 0x6d9eeb
  sw $9, 12($8)
  sw $9, 16($8)
  sw $9, 520($8)
  
retornoCriarAtaqueNormalCupheadFlor:
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
