.text

main: jal telaInicial
      beq $3, $0, outroBotao
      
      # Jogar selecionado
      
      jal criarCenario
      jal criarIndicadorHP
      j end
      
outroBotao:
  j end


end:
  addi $2, $0, 10
  syscall
