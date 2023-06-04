.data 
Vetor: .word 0, 0, 3, 0, 5, 0, 0, 0

.text
la $s4, Vetor

add $s0, $s4, 8 # &Vetor[2]

lw $t0, ($s0)  # $t0 = *Vetor[2]
add $t0, $t0, 1 # 1 + Vetor[2]
sll $t0, $t0, 2 # Espaçamento das words do vetor

add $t0, $t0, $s4 # &Vetor[1 + Vetor[2]]

lw $s0, ($t0) # *Vetor[1 + Vetor[2]]

sw $s0, Vetor # Vetor[0] = Vetor[1 + Vetor[2]]


