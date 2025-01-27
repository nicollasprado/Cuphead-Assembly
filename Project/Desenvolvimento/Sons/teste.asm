.text
main:
    li $v0, 31          # Syscall 31: MIDI output
    li $a0, 72          # Pitch: Nota
    li $a1, 1000        # Duração: 1000 ms (1 segundo)
    li $a2, 30           # Instrumento: Piano (0)
    li $a3, 127         # Volume: Máximo (127)
    syscall
    
    li $v0, 10          # Encerrar o programa
    syscall