# Nomes das variaveis possuem o exercicio que elas  pertencem para evitar o uso repetido de variaveis
.data
x_ex1: .word 0 
y_ex1: .word 0
z_ex1: .word 0

.text
lw $s0, x_ex1
lw $s1, y_ex1
lw $s2, z_ex1

add $t0, $s0, 300 # $t0 = x + 300
sub $t0, $t0, $s1 # $t0 -= y
add $t0, $t0, $s2 # $t0 +=z
add $t0, $t0, 27 # $t0 += 27
add $t0, $t0, $s0  # $t0 += x
sw $t0, x_ex1 # x = $t0



.data
a_ex2: .word 0
b_ex2: .word 0
c_ex2: .word 0
s_ex2: .word 0

.text
lw $s0, a_ex2
lw $s1, b_ex2
lw $s2, c_ex2

and $t0, $s0, $s1 # a & b
nor $t1, $s0, $zero # !a
and $t1, $t1, $s2 # !a & c
or $t0, $t0, $t1 # (a & b) | (!a & c)

sw $t0, s_ex2 # s = $t0



.data
a_ex3: .word 1
b_ex3: .word 1
c_ex3: .word 1
d_ex3: .word 1
valor_ex3: .word 0

.text
lw $s0, a_ex3
lw $s1, b_ex3
lw $s2, c_ex3
lw $s3, d_ex3

add $t0, $s0, $s1 # $t0 = a + b
add $t0, $t0, $s2 # $t0 += c
add $t0, $t0, $s3 # $t0 += d

sll $t0, $t0, 2 # $t0 * 4

sw $t0, valor_ex3 # valor = $t0



.data 
Vetor_ex4: .word 0, 0, 3, 0, 5, 0, 0, 0

.text
la $s4, Vetor_ex4

add $s0, $s4, 8 # &Vetor[2]

lw $t0, ($s0)  # $t0 = *Vetor[2]
add $t0, $t0, 1 # 1 + Vetor[2]
sll $t0, $t0, 2 # Espaçamento das words do vetor $t0 *= 4

add $t0, $t0, $s4 # &Vetor[1 + Vetor[2]]

lw $s0, ($t0) # *Vetor[1 + Vetor[2]]

sw $s0, Vetor_ex4 # Vetor[0] = Vetor[1 + Vetor[2]]


.text
li $t8, 0x00BADBED 
li $t9, 0xAFADA007
sll $t1, $t8, 4 
and $t1, $t1, $t9 
ori $s6, $t1, 20

#$s6	22	0x0bada014



.data
Conta_ex6: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text

la $s4, Conta_ex6
li $t0, 1
la $s1, ($s4)
li $s2, 0

add $t1, $s4, 12
add $t2, $s4, 28

loop_ex6:
li $a1, 100  # Here you set $a1 to the max bound.
li $v0, 42  # generates the random number.
syscall

sw $a0, ($s1)

beq $t1, $s1, media_ex6
beq $t2, $s1, media_ex6

continue:
addi $s1, $s1, 4
addi $t0, $t0, 1
ble $t0, 10, loop_ex6
j end_ex6

media_ex6:
lw $t3, ($s1)
add $s2, $s2, $t3
j continue

end_ex6:
srl $s0, $s2, 1



.data
i_ex7: .word 0
y_ex7: .word 2
x_ex7: .word 2
z_ex7: .word 2

.text:
lw $s0, i_ex7
lw $s1, y_ex7
lw $s2, x_ex7
lw $s3, z_ex7

for:
mult $s2, $s3
mflo $s2
addi $s0, $s0, 1  
blt $s0, $s1, for

sw $s2, x_ex7



.data
Vetor_ex8: .word 3, 2, 1

.text
la $a0, Vetor_ex8
li $a1, 3

move $t0, $zero  # t0 = 0
loop_ex8:
sll $t1, $t0, 2 # t1 * 4
add $t2, $a0, $t1 # Endereço do vetor vai para o proximo index
sw $zero, 0($t2) # Faz essa posição seta o valor para zero
addi $t0, $t0, 1  # Adciona 1 no $t0
slt $t3, $t0, $a1 # se t0 for do menor que o tamanho do vetor continua no loop
bne $t3, $zero, loop_ex8

# ou seja esse codigo é um FOR que serve para zerar um vetor
