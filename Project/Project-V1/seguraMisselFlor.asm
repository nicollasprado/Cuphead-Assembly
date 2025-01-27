.text
.globl seguraMisselFlor, desfazerSeguraMisselFlor

# $4 -> canto superior esquerdo
# Reg utilizados: $8, $9, $10, $11
seguraMisselFlor:
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
  addi $8, $8, 512
  
  # Asa esquerda
  ori $9, $0, 0x259600
  sw $9, 0($8)
  sw $9, 4($8)
  sw $9, 516($8)
  sw $9, 520($8)
  sw $9, 1028($8)
  sw $9, 1032($8)
  sw $9, 1036($8)
  sw $9, 1544($8)
  sw $9, 1548($8)
  
  # Asa direita
  sw $9, 48($8)
  sw $9, 52($8)
  sw $9, 556($8)
  sw $9, 560($8)
  sw $9, 1064($8)
  sw $9, 1068($8)
  sw $9, 1072($8)
  sw $9, 1576($8)
  sw $9, 1580($8)
  
  # Laranja escuro
  ori $9, $0, 0xe54800
  sw $9, 20($8)
  sw $9, 24($8)
  sw $9, 28($8)
  sw $9, 32($8)
  
  addi $8, $8, 528
  # tamanho da linha
  addi $10, $0, 6
  addi $11, $0, 0
forSeguraMisselFlor:
  beq $10, $11, detalhesSeguraMisselFlor
  
  sw $9, 0($8)
  sw $9, 512($8)
  sw $9, 1024($8)
  sw $9, 1536($8)
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forSeguraMisselFlor
  
  
detalhesSeguraMisselFlor:
  sw $9, 2028($8)
  sw $9, 2032($8)
  sw $9, 2036($8)
  sw $9, 2040($8)
  
  ori $9, $0, 0xff6d01
  sw $9, -8($8)
  sw $9, 492($8)
  sw $9, 1016($8)
  sw $9, 1520($8)
  
  # Retorno
  
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
# funçao para desfazer o segura missel da flor
# $4 => canto superior esquerdo do inimigo
# Registradores usados: $8, $9, $10, $11, $13

desfazerSeguraMisselFlor:
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
  addi $8, $8, 512
  
  # ponteiro pra copia
  lui $9, 0x1001
  addi $9, $9, 32768
  add $9, $9, $4
  addi $9, $9, 512
  
  # tamanho das linhas
  addi $10, $0, 14
  addi $11, $0, 0
forDesfazerSeguraMisselFlor:
  beq $10, $11, retornoDesfazerSeguraMisselFlor
  
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
  
  lw $13, 2560($9)
  sw $13, 2560($8)
  
  addi $9, $9, 4
  addi $8, $8, 4
  
  addi $11, $11, 1
  j forDesfazerSeguraMisselFlor
  
retornoDesfazerSeguraMisselFlor:
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
