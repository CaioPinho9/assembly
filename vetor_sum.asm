.data
vector1: .word 1, 2, 3, 4, 5, 6, 7, 8
vector2: .word 8, 7, 6, 5, 4, 3, 2, 1
vector3: .word 0:8

.text
la $s0, vector1 # ptr = &vector1
move $t0, $zero # i = 0

loop:
lw $t2, 0($s0) # *(ptr + i)
lw $t3, 32($s0) # *(ptr + i + 32)
add $v0, $t2, $t3 # *(ptr + i) + *(ptr + i + 64)
sw $v0, 64($s0) # *(prt + i + 64) = $v0
addi $s0, $s0, 4 # ptr += 4
addi $t0, $t0, 1 # i += 1
blt $t0, 8, loop # if i < 8: loop

