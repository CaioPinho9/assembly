.data
a: .word 1
b: .word 1
c: .word 1
d: .word 1
valor: .word 0

.text
lw $s0, a
lw $s1, b
lw $s2, c
lw $s3, d

add $t0, $s0, $s1 # $t0 = a + b
add $t0, $t0, $s2 # $t0 += c
add $t0, $t0, $s3 # $t0 += d

sll $t0, $t0, 2 # $t0 * 4

sw $t0, valor # valor = $t0


