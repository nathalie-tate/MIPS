# program1.asm
# Nathalie Tate

# Recursively computes the factorial of a number

.data
	prompt: .asciiz "Enter a number: "
	result: .asciiz "The factorial is: "
	number: .word 4
	answer: .word 4

.text
	main:
		li $v0, 4								#display prompt
		la $a0, prompt
		syscall

		li $v0, 5								#ask for input
		syscall

		sw $v0, number					#store number in memory

		#call the factorial
		lw $a0,number
		jal factorial
		sw $v0, answer					#store the answer in memory

		li $v0,4								#display the result
		la $a0,result	
		syscall

		li $v0,1								#print answer
		lw $a0, answer
		syscall

		li $v0, 10							#exit
		syscall

	factorial:
		addi $sp,$sp,-8					#decrement stack pointer twice
		sw $ra, 0($sp)					#store the return address on the stack
		sw $s0, 4($sp)					#store $s0 on the stack
		
		li $v0,1									#recursive base case
		beq $a0, 0 factorialStop

		#fact(n-1)
		move $s0, $a0
		addi $a0, $a0, -1
		jal factorial
		mult $s0,$v0
		mflo $v0

		factorialStop:
			lw $ra, 0($sp)				#pop return address off stack
			lw $s0, 4($sp)				#pop $s0 off stack
			addi $sp, $sp, 8			#reset stack pointer
			jr $ra								#return to procedure call
