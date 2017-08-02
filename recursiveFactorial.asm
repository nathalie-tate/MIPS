# assignment1.asm
# Nathalie Tate

.data
	PROMPT1: .asciiz "Enter a number: "
	PROMPT2: .asciiz "Enter a larger number: "
	PROMPT3: .asciiz "The product is: "

	.text
		main:
			li $v0, 4							#display prompt
			la $a0, PROMPT1		
			syscall

			li $v0,5							#input first number
			syscall
			move $s0, $v0					#save to $s0
			
			move $s1, $v0					#for basecase comparison
			addi $s1,$s1,-1				

			li $v0, 4							#display prompt
			la $a0, PROMPT2
			syscall

			li $v0, 5							#input second number
			syscall
			move $s3,$v0


			move $t0,$s3
			move $a0, $s3
			jal recProduct				#procedure call

			li $v0,4							#display prompt
			la $a0, PROMPT3
			syscall

			li $v0,1							#display answer
			move $a0, $s3
			syscall

			li $v0, 10						#exit
			syscall


		recProduct:
			sw $ra, 0($sp)				#store return address on stack
			addi $sp, $sp, -4			#decrement stack pointer

			addi $a0, $a0, -1

			beq $a0, $s1, endRecProduct				#recursive base case

			mult $t0,$a0
			mflo $t0
			move $s3,$t0
			jal recProduct

			endRecProduct:
				addi $sp,$sp,4		#reset stack pointer
				lw $ra, 0($sp)

				jr $ra 
