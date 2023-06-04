.data
Conta: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text

la $s4, Conta
li $t0, 1
la $s1, ($s4)
li $s2, 0

add $t1, $s4, 12
add $t2, $s4, 28

loop:
li $a1, 100  # Here you set $a1 to the max bound.
li $v0, 42  # generates the random number.
syscall

sw $a0, ($s1)

beq $t1, $s1, media
beq $t2, $s1, media

continue:
addi $s1, $s1, 4
addi $t0, $t0, 1
ble $t0, 10, loop
j end

media:
lw $t3, ($s1)
add $s2, $s2, $t3
j continue

end:
srl $s0, $s2, 1







 