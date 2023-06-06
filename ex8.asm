.data
Vetor: .word 3, 2, 1

.text
la $a0, Vetor
li $a1, 3

move $t0, $zero  # t0 = 0
loop:
sll $t1, $t0, 2 # t1 * 4
add $t2, $a0, $t1 # Endereço do vetor vai para o proximo index
sw $zero, 0($t2) # Faz essa posição seta o valor para zero
addi $t0, $t0, 1  # Adciona 1 no $t0
slt $t3, $t0, $a1 # se t0 for do menor que o tamanho do vetor continua no loop
bne $t3, $zero, loop

# ou seja esse codigo serve para zerar um vetor