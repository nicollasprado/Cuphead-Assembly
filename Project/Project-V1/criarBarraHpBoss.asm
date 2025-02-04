.text
.globl criarBarraHpBoss, danoBarraHpBoss

# $4 -> Canto superior esquerdo da barra de vida
# Reg utilizados: $8, $9, $10, $11, $13
criarBarraHpBoss:
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
  
  
  # Total de vida do boss
  lui $8, 0x1001
  addi $8, $8, 65600
  lw $13, 0($8)
  
  # Borda
  ori $9, $0, 0x000000
  
  add $10, $0, $13 # total da vida que e a largura da barra
  addi $11, $0, 0
  
  # endereço pra ser desenhado
  lui $8, 0x1001
  add $8, $8, 29996 # endereço do desenho, caso mude o valor mudar na funçao de receber dano la embaixo
  addi $8, $8, 4
forLinhasContornoBarraHpFlor:
  beq $10, $11, colunasContornoBarraHpFlor
  
  sw $9, 0($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forLinhasContornoBarraHpFlor
  
  
colunasContornoBarraHpFlor:
  # direita
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  # esquerda
  addi $11, $0, 4
  mul $10, $10, $11
  addi $10, $10, 4
  
  sub $8, $8, $10
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  
  
  # Interior da vida
  addi $8, $8, 516
  ori $9, $0, 0x008000
  
  add $10, $0, $13 # tamanho da vida
  addi $11, $0, 0
forInteriorCriarBarraHpFlor:
  beq $10, $11, retornoCriarBarraHpFlor
  
  sw $9, 0($8)
  sw $9, 512($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forInteriorCriarBarraHpFlor
  
retornoCriarBarraHpFlor:
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
  
  
  
#################################################
# Funçao para reduzir a vida da flor no display
# Regs utilizados: $8, $9, $10, $11, $13

danoBarraHpBoss:
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
  
  
  lui $8, 0x1001
  addi $8, $8, 29996
  addi $8, $8, 512 # ponto inicial a esquerda da barra de hp
  # ajuste pra pegar onde mudar
  lui $10, 0x1001
  addi $10, $10, 65600
  lw $11, 0($10) # vida total
  
  # pegar vida atual
  addi $10, $10, -4 # 65596
  lw $13, 0($10)
  
  # qtd de pixels a ficar vermelho
  sub $11, $11, $13 
  addi $13, $0, 4
  mul $11, $11, $13 # qtd de pixels em 4x4
  
  add $8, $8, $11 # posicao a ser pintada
  ori $9, $0, 0xff0000
  
  sw $9, 0($8)
  sw $9, 512($8)
  
  # retorno
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
