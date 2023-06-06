.data
i: .word 0
y: .word 2
x: .word 2
z: .word 2

.text:
lw $s0, i
lw $s1, y
lw $s2, x
lw $s3, z

for:
mult $s2, $s3
mflo $s2
addi $s0, $s0, 1  
blt $s0, $s1, for

sw $s2, x