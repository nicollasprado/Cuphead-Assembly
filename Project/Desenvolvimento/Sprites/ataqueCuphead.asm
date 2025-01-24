.text
.globl criarAtaqueCupheadFlor

# $4 -> canto superior esquerdo do tiro
# $5 -> 0 = tipo 1,   1 = tipo 2
criarAtaqueCupheadFlor:
  lui $8, 0x1001
  add $8, $8, $4
  
  addi $10, $0, 1
  beq $5, $10, criarAtaqueCupheadFlorTipoDois
  
  # azul escuro
  ori $9, $0, 0x3d85c6
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 516($8)
  sw $9, 524($8)
  sw $9, 528($8)
  
  # azul claro
  ori $9, $0, 0x6d9eeb
  sw $9, 12($8)
  sw $9, 16($8)
  sw $9, 520($8)
  
criarAtaqueCupheadFlorTipoDois:
  # azul escuro
  ori $9, $0, 0x3d85c6
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