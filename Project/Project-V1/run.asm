.text

main: jal criarCenario
      jal criarIndicadorHP
      j end


end:
  addi $2, $0, 10
  syscall