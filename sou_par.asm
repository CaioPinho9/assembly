.data
n: .word 13
.text
lw $s0, n
and $t0, $s0, 1
li $s1, 1
xor $v0, $s1, $t0