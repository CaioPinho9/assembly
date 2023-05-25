.data
ip: .word 0xce2c26c0
.text
lw $s0, ip
li $t0, 3

srl $s1, $s0, 29
and $s1, $t0, $s0

classea:
li $v0, 'a'
bgt $s1, 3, classeb
j fim

classeb:
li $v0, 'b'
bgt $s1, 5, classec
j fim

classec:
li $v0, 'c'

fim:
