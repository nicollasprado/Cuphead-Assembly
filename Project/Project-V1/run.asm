.text

main: jal telaInicial
      beq $3, $0, outroBotao
      
      # Jogar selecionado
      jal cenarioFlor
      
continueBuild:
      jal criarIndicadorHP
      j end
      
outroBotao:
  jal cenarioSereia
  j continueBuild


end:
  addi $2, $0, 10
  syscall
