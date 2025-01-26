.text
.globl ataqueMisselFlor, desfazerAtaqueMisselFlor

# $4 -> canto superior esquerdo do ataque
# reg utilizados: $8, $9, $10, $11
ataqueMisselFlor:
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


  lui $8, 0x1001
  add $8, $8, $4
  
  # verde
  ori $9, $0, 0x259600
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1536($8)
  sw $9, 1540($8)
  sw $9, 1544($8)
  sw $9, 1548($8)
  sw $9, 1552($8)
  sw $9, 2048($8)
  sw $9, 2064($8)
  
  # amarelo
  addi $8, $8, 2048
  ori $9, $0, 0xffd738
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  
  addi $10, $0, 5
  addi $11, $0, 0
forAtaqueMisselFlor:
  beq $10, $11, detalhesAtqMisselFlor
  
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forAtaqueMisselFlor
  
detalhesAtqMisselFlor:
  addi $8, $8, 2028
  sw $9, 4($8)
  sw $9, 8($8)
  sw $9, 12($8)
  
  ori $9, $0, 0xc28a33
  sw $9, -508($8)
  sw $9, -1012($8)
  sw $9, -1532($8)
  
  # retorno
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




#####################
# funçao para desfazer o ataque missel da tela
# $4 => canto superior esquerdo do ataque
# Registradores usados: $8, $9, $10, $11, $13

desfazerAtaqueMisselFlor:
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
  addi $9, $9, 32768
  add $9, $9, $4
  
  # tamanho das colunas
  addi $10, $0, 9
  addi $11, $0, 0
forDesfazerAtaqueMisselFlor:
  beq $10, $11, retornoDesfazerAtaqueMisselFlor
  
  lw $13, 0($9)
  sw $13, 0($8)
  
  lw $13, 4($9)
  sw $13, 4($8)
  
  lw $13, 8($9)
  sw $13, 8($8)
  
  lw $13, 12($9)
  sw $13, 12($8)
  
  lw $13, 16($9)
  sw $13, 16($8)
  
  addi $9, $9, 512
  addi $8, $8, 512
  
  addi $11, $11, 1
  j forDesfazerAtaqueMisselFlor
  
retornoDesfazerAtaqueMisselFlor:
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
