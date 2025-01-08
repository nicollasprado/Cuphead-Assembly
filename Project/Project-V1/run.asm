.text

main: jal telaInicial
      #beq $3, $0, outroBotaoTelaInicial falta implementar o botao de baixo
      
      # Jogar selecionado
      jal telaSelecaoFase
      beq $3, $0, faseSereia
      
      jal cenarioFlor
      
continueBuild:
      jal criarIndicadorHP
      j end
      
faseSereia:
  jal cenarioSereia
  j continueBuild


end:
  addi $2, $0, 10
  syscall
