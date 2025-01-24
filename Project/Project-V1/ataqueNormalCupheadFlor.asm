.text
.globl criarAtaqueNormalCupheadFlor

# $4 -> canto superior esquerdo do tiro
# $5 -> 0 = tipo 1,   1 = tipo 2
criarAtaqueNormalCupheadFlor:
  sw $31, 0($sp)
  addi $sp, $sp, -4
  
  sw $8, 0($sp)
  addi $sp, $sp, -4
  
  sw $9, 0($sp)
  addi $sp, $sp, -4
  
  sw $10, 0($sp)
  addi $sp, $sp, -4
  

  lui $8, 0x1001
  add $8, $8, $4
  
  addi $10, $0, 1
  beq $5, $10, criarAtaqueNormalCupheadFlorTipoDois
  
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
  
criarAtaqueNormalCupheadFlorTipoDois:
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
  
  
retornoCriarAtaqueNormalCupheadFlor:
  # reset das propriedades da funçao
  addi $4, $0, 0
  addi $5, $0, 0
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31
  
  
  
  
  
  # funcao a ser removida

# $4 -> canto superior esquerdo do tiro
# $5 -> direçao do movimento, 0 = esquerda, 1 = direita
movimentacaoAtaqueNormalCupheadFlor:
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
  
  sw $12, 0($sp)
  addi $sp, $sp, -4
  
  sw $13, 0($sp)
  addi $sp, $sp, -4
  
  sw $17, 0($sp)
  addi $sp, $sp, -4
  
  
  lui $8, 0x1001
  add $8, $8, $4
  
  # ponteiro pra copia
  lui $17, 0x1001
  add $8, $8, 32768
  
  beq $5, $0, MovAtaqueNormalCupheadFlorEsquerda
  
  
  addi $10, $0, 5
  addi $11, $0, 0
forMovAtaqueNormalCupheadFlor:
  beq $10, $11, retornoMovAtaqueNormalCupheadFlor
  
  lw $12, 0($17)
  lw $13, 512($17)
  
  sw $12, 0($8)
  sw $13, 512($8)
  addi $8, $8, 4
  addi $17, $17, 4 
  
  addi $11, $11, 1
  j forMovAtaqueNormalCupheadFlor
  
  
MovAtaqueNormalCupheadFlorEsquerda:
  addi $10, $0, 5
  addi $11, $0, 0
forMovAtaqueNormalCupheadFlorEsquerda:
  beq $10, $11, retornoMovAtaqueNormalCupheadFlor
  
  lw $12, 0($17)
  lw $13, 512($17)
  
  sw $12, 0($8)
  sw $13, 512($8)
  addi $8, $8, 4
  addi $17, $17, 4 
  
  addi $11, $11, 1
  j forMovAtaqueNormalCupheadFlorEsquerda


retornoMovAtaqueNormalCupheadFlor:
  # reset das propriedades da funçao
  addi $4, $0, 0
  addi $5, $0, 0
  
  addi $sp, $sp, 4
  lw $10, 0($sp)
  
  addi $sp, $sp, 4
  lw $9, 0($sp)
  
  addi $sp, $sp, 4
  lw $8, 0($sp)
  
  addi $sp, $sp, 4
  lw $31, 0($sp)
  jr $31