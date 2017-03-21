# palindrome.asm
# Nathalie Tate
# Checks if the entered string is a palindrome
#
# CASE SENSITIVE- racecar is a palindrome, Racecar is not!!!
# Takes 64 character input (including \n\0)

.data
	PROMPT1: 				.asciiz "Enter a string: "
	.align 16
	PROMPT2:				.asciiz "Your word is not a palindrome\n"
	.align 16
	PROMPT3:				.asciiz "Your word is a palindrome\n"
	USERSTRING: 		.space 64
	FLIPPEDSTRING:  .space 64

.text
.globl main

main:
	### User Input

	li $v0, 4							#code for print string
	la $a0, PROMPT1				#ask user to enter string
	syscall

	li $v0, 8							#code for read string
	la $a0, USERSTRING		#address to store string
	li $a1, 64						#length of buffer
	syscall

	### String processing

	# define: $s0 = address of working character on userString
	# 			: $s1 = address of working character on flipped string
	#				: $t0 = working character on userString
	#				: $t1 = working character on flipped string
	#				: $t2 = newline

	li $t2, 10
	
	la $s0, USERSTRING		#load addresses
	la $s1, USERSTRING
	
	lb $t1, 0($s1)				#load contents of addresses
	lb $t0, 0($s0)

	LOOP1:												#set $s1 to the address of the last character 
		beq $t1, $zero, ENDLOOP1
		addi $s1, $s1, 1 
		lb $t1, 0($s1)
		j LOOP1
	ENDLOOP1:

	addi $s1, $s1, -1							#..last non-null character
	addi $s1, $s1, -1							#..no \n either!

	lb $t1, 0($s1)				#load contents of address

	LOOP2:												#test if palindrome
		bne $t1, $t0, NOTPALINDROME
		addi $s0, $s0, 1			#increment addresses
		addi $s1, $s1, -1

		lb $t1, 0($s1)				#load contents of addresses
		lb $t0, 0($s0)
		beq $t0, $t2, PALINDROME	#string is a palindrome
		j LOOP2

	NOTPALINDROME:
		li $v0, 4
		la $a0, PROMPT2
		syscall								#Display results

		li $v0, 10
		syscall								#exit

	PALINDROME:
		li $v0, 4
		la $a0, PROMPT3
		syscall								#Display results

		li $v0, 10
		syscall								#exit
