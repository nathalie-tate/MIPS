# primeNumber.asm
# Nathalie Tate
#	This code is freely available to be modified and distrubuted under the terms 
#	of the MIT License. 
#
# Checks if the entered number is prime
# Note that this is an extremely inefficient solution, but I don't feel like 
#	coding a better solution in assembly code

.data
	PROMPT1:.asciiz "Please enter an integer: "
	PROMPT2:.asciiz	"Your number is prime.\n"
	PROMPT3:.asciiz "Your number is not prime.\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, PROMPT1
	syscall									#Ask for user input

	li $v0, 5
	syscall									#Accept user input

	move $s0, $v0						#Store user input in $s0
	
	li $t1, 1								#initialize variables
	li $t2, 2

	slt $t0, $s0, $t2				#not prime if < 2
	beq $t1, $t0, NOTPRIME

	LOOP: 
		beq $s0, $t2, PRIME			#prime
		div $s0, $t2
		mfhi $t0
		beq $t0, $zero, NOTPRIME	#not prime if remainder == 0
		addi $t2, $t2, 1					#increment
		j LOOP

	PRIME:
		li $v0, 4
		la $a0, PROMPT2
		syscall								#Display results

		li $v0, 10
		syscall								#Exit

	NOTPRIME:
		li $v0, 4
		la $a0, PROMPT3
		syscall								#Display results

		li $v0, 10
		syscall								#Exit
