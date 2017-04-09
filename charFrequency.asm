# charFrequency.asm
# Nathalie Tate
#	This code is freely available to be modified and distrubuted under the terms 
#	of the MIT License. 

# CASE SENSITIVE- test has frequencies{(t,2),(e,1),(s,1)}, 
#									Test has frequencies{(T,1),(e,1),(s,1),(t,1)} 
# Takes 64 character input (including \n\0)

# Wow, I should have used function calls

.data
	PROMPT1: 				.asciiz "Enter a string: "
	###alphabet

	.align 4
	SPACE1:					.space 4

	A:							.space 4
	B:							.space 4
	C:							.space 4
	D:							.space 4
	E:							.space 4
	F:							.space 4
	G:							.space 4
	H:							.space 4
	I:							.space 4
	J:							.space 4
	K:							.space 4
	L:							.space 4
	M:							.space 4
	N:							.space 4
	O:							.space 4
	P:							.space 4
	Q:							.space 4
	R:							.space 4
	S:							.space 4
	T:							.space 4
	U:							.space 4
	V:							.space 4
	W:							.space 4
	X:							.space 4
	Y:							.space 4
	Z:							.space 4
	
	A_cap:					.space 4
	B_cap:					.space 4
	C_cap:					.space 4
	D_cap:					.space 4
	E_cap:					.space 4
	F_cap:					.space 4
	G_cap:				 	.space 4
	H_cap:					.space 4
	I_cap:					.space 4
	J_cap:					.space 4
	K_cap:					.space 4
	L_cap:					.space 4
	M_cap:					.space 4
	N_cap:					.space 4
	O_cap:					.space 4
	P_cap:					.space 4
	Q_cap:					.space 4
	R_cap:					.space 4
	S_cap:					.space 4
	T_cap:					.space 4
	U_cap:					.space 4
	V_cap:					.space 4
	W_cap:					.space 4
	X_cap:					.space 4
	Y_cap:					.space 4
	Z_cap:					.space 4

	SPACE_str:			.asciiz"<space>: "

	A_str:					.asciiz "a: "
	B_str:					.asciiz "b: "
	C_str:					.asciiz "c: "
	D_str:					.asciiz "d: "
	E_str:					.asciiz "e: "
	F_str:					.asciiz "f: "
	G_str:				 	.asciiz "g: "
	H_str:					.asciiz "h: "
	I_str:					.asciiz "i: "
	J_str:					.asciiz "j: "
	K_str:					.asciiz "k: "
	L_str:					.asciiz "l: "
	M_str:					.asciiz "m: "
	N_str:					.asciiz "n: "
	O_str:					.asciiz "o: "
	P_str:					.asciiz "p: "
	Q_str:					.asciiz "q: "
	R_str:					.asciiz "r: "
	S_str:					.asciiz "s: "
	T_str:					.asciiz "t: "
	U_str:					.asciiz "u: "
	V_str:					.asciiz "v: "
	W_str:					.asciiz "w: "
	X_str:					.asciiz "x: "
	Y_str:					.asciiz "y: "
	Z_str:					.asciiz "z: "

	A_cap_str:					.asciiz "A: "
	B_cap_str:					.asciiz "B: "
	C_cap_str:					.asciiz "C: "
	D_cap_str:					.asciiz "D: "
	E_cap_str:					.asciiz "E: "
	F_cap_str:					.asciiz "F: "
	G_cap_str:				 	.asciiz "G: "
	H_cap_str:					.asciiz "H: "
	I_cap_str:					.asciiz "I: "
	J_cap_str:					.asciiz "J: "
	K_cap_str:					.asciiz "K: "
	L_cap_str:					.asciiz "L: "
	M_cap_str:					.asciiz "M: "
	N_cap_str:					.asciiz "N: "
	O_cap_str:					.asciiz "O: "
	P_cap_str:					.asciiz "P: "
	Q_cap_str:					.asciiz "Q: "
	R_cap_str:					.asciiz "R: "
	S_cap_str:					.asciiz "S: "
	T_cap_str:					.asciiz "T: "
	U_cap_str:					.asciiz "U: "
	V_cap_str:					.asciiz "V: "
	W_cap_str:					.asciiz "W: "
	X_cap_str:					.asciiz "X: "
	Y_cap_str:					.asciiz "Y: "
	Z_cap_str:					.asciiz "Z: "

	newline:						.asciiz "\n"

	USERSTRING: 		.space 64

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

	#$s0 to keep track of pointer to current letter
	#$s1 to store current letter
	#$t0 to hold current letter of the alphabet for compairison
	#$t1 to hold freq
	#$t2 to hold address of frequency 

	la $s0, USERSTRING
	li $s2, 0

	MAINLOOP:
		lb $s1, 0($s0)
		
		###
		
		beq $s1, $zero, END					#reached the end of the string, jump to end

		li $t0, 32									#space
			bne $s1, $t0, A_cap_1
			la $t2, SPACE1
			lw $t1, 0($t2)
			addi $t1, $t1, 1
			sw $t1, 0($t2)
			j ENDMAINLOOP	

		A_cap_1:
		li $t0, 65						#initialize to A_cap 
		bne $s1, $t0, B_cap_1	#if not A_cap jump to B_cap
			la $t2, A_cap				#load address of frequency
			lw $t1, 0($t2)			#load frequency
			addi $t1, $t1, 1		#increment frequency
			sw $t1, 0($t2)			#store frequency
			j ENDMAINLOOP				#Next iteration of loop

		B_cap_1:								#B_cap
			addi $t0, $t0, 1			#increment to B_cap
			bne $s1, $t0, C_cap_1	#if not B_cap jump to C_cap
			la $t2, B_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		C_cap_1:								#C_cap
			addi $t0, $t0, 1			#increment to C_cap
			bne $s1, $t0, D_cap_1	#if not C_cap jump to D_cap
			la $t2, C_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		D_cap_1:								#D_cap
			addi $t0, $t0, 1			#increment to D_cap
			bne $s1, $t0, E_cap_1	#if not D_cap jump to E_cap
			la $t2, D_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		E_cap_1:								#E_cap
			addi $t0, $t0, 1			#increment to E_cap
			bne $s1, $t0, F_cap_1	#if not E_cap jump to F_cap
			la $t2, E_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		F_cap_1:								#F_cap
			addi $t0, $t0, 1			#increment to F_cap
			bne $s1, $t0, G_cap_1	#if not F_cap jump to G_cap
			la $t2, F_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		G_cap_1:								#G_cap
			addi $t0, $t0, 1			#increment to G_cap
			bne $s1, $t0, H_cap_1	#if not G_cap jump to H_cap
			la $t2, G_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		H_cap_1:								#H_cap
			addi $t0, $t0, 1			#increment to H_cap
			bne $s1, $t0, I_cap_1	#if not H_cap jump to I_cap
			la $t2, H_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		I_cap_1:								#I_cap
			addi $t0, $t0, 1			#increment to I_cap
			bne $s1, $t0, J_cap_1	#if not I_cap jump to J_cap
			la $t2, I_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		J_cap_1:								#J_cap
			addi $t0, $t0, 1			#increment to I_cap
			bne $s1, $t0, K_cap_1	#if not J_cap jump to K_cap
			la $t2, J_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		K_cap_1:								#K_cap
			addi $t0, $t0, 1			#increment to K_cap
			bne $s1, $t0, L_cap_1	#if not K_cap jump to L_cap
			la $t2, K_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		L_cap_1:								#L_cap
			addi $t0, $t0, 1			#increment to L_cap
			bne $s1, $t0, M_cap_1	#if not L_cap jump to M_cap
			la $t2, L_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		M_cap_1:								#M_cap
			addi $t0, $t0, 1			#increment to M_cap
			bne $s1, $t0, N_cap_1	#if not M_cap jump to N_cap
			la $t2, M_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		N_cap_1:								#N_cap
			addi $t0, $t0, 1			#increment to N_cap
			bne $s1, $t0, O_cap_1	#if not N_cap jump to O_cap
			la $t2, N_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		O_cap_1:								#O_cap
			addi $t0, $t0, 1			#increment to P_cap
			bne $s1, $t0, P_cap_1	#if not O_cap jump to P_cap
			la $t2, O_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		P_cap_1:								#P_cap
			addi $t0, $t0, 1			#increment to P_cap
			bne $s1, $t0, Q_cap_1	#if not P_cap jump to Q_cap
			la $t2, P_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Q_cap_1:								#Q_cap
			addi $t0, $t0, 1			#increment to Q_cap
			bne $s1, $t0, R_cap_1	#if not Q_cap jump to R_cap
			la $t2, Q_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop
			
		R_cap_1:								#R_cap
			addi $t0, $t0, 1			#increment to R_cap
			bne $s1, $t0, S_cap_1	#if not R_cap jump to S_cap
			la $t2, R_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		S_cap_1:								#S_cap
			addi $t0, $t0, 1			#increment to S_cap
			bne $s1, $t0, T_cap_1	#if not S_cap jump to T_cap
			la $t2, R_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		T_cap_1:								#T_cap
			addi $t0, $t0, 1			#increment to T_cap
			bne $s1, $t0, U_cap_1	#if not T_cap jump to U_cap
			la $t2, T_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		U_cap_1:								#U_cap
			addi $t0, $t0, 1			#increment to U_cap
			bne $s1, $t0, V_cap_1	#if not U_cap jump to V_cap
			la $t2, U_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		V_cap_1:								#V_cap
			addi $t0, $t0, 1			#increment to V_cap
			bne $s1, $t0, W_cap_1	#if not V_cap jump to W_cap
			la $t2, V_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		W_cap_1:								#W_cap
			addi $t0, $t0, 1			#increment to W_cap
			bne $s1, $t0, X_cap_1	#if not W_cap jump to X_cap
			la $t2, W_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		X_cap_1:								#X_cap
			addi $t0, $t0, 1			#increment to X_cap
			bne $s1, $t0, Y_cap_1	#if not X_cap jump to Y_cap
			la $t2, X_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Y_cap_1:								#Y_cap
			addi $t0, $t0, 1			#increment to Y_cap
			bne $s1, $t0, Z_cap_1	#if not Y_cap jump to Z_cap
			la $t2, Y_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Z_cap_1:								#Z_cap
			addi $t0, $t0, 1			#increment to Z_cap
			bne $s1, $t0, A_1			#if not Z_cap jump to A
			la $t2, Z_cap					#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		A_1:										#A
			addi $t0, $zero, 97		#increment to A
			bne $s1, $t0, B_1			#if not A jump to B
			la $t2, A							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		B_1:										#B
			addi $t0, $t0, 1			#increment to B
			bne $s1, $t0, C_1			#if not B jump to C
			la $t2, B							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		C_1:										#C
			addi $t0, $t0, 1			#increment to C
			bne $s1, $t0, D_1			#if not C jump to D
			la $t2, C							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		D_1:										#D
			addi $t0, $t0, 1			#increment to D
			bne $s1, $t0, E_1			#if not D jump to E
			la $t2, D							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		E_1:										#E
			addi $t0, $t0, 1			#increment to E
			bne $s1, $t0, F_1			#if not E jump to F
			la $t2, E							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		F_1:										#F
			addi $t0, $t0, 1			#increment to F
			bne $s1, $t0, G_1			#if not F jump to G
			la $t2, F							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		G_1:										#G
			addi $t0, $t0, 1			#increment to G
			bne $s1, $t0, H_1			#if not G jump to H
			la $t2, G							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		H_1:										#H
			addi $t0, $t0, 1			#increment to H
			bne $s1, $t0, I_1			#if not H jump to I
			la $t2, H							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		I_1:										#I
			addi $t0, $t0, 1			#increment to I
			bne $s1, $t0, J_1			#if not I jump to K
			la $t2, I							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		J_1:										#J
			addi $t0, $t0, 1			#increment to J
			bne $s1, $t0, K_1			#if not J jump to K
			la $t2, L							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		K_1:										#K
			addi $t0, $t0, 1			#increment to K
			bne $s1, $t0, L_1			#if not K jump to L
			la $t2, K							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		L_1:										#L
			addi $t0, $t0, 1			#increment to L
			bne $s1, $t0, M_1			#if not L jump to M
			la $t2, L							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		M_1:										#M
			addi $t0, $t0, 1			#increment to M
			bne $s1, $t0, N_1			#if not M jump to N
			la $t2, M							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		N_1:										#N
			addi $t0, $t0, 1			#increment to N
			bne $s1, $t0, O_1			#if not N jump to O
			la $t2, N							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop


		O_1:										#O
			addi $t0, $t0, 1			#increment to P
			bne $s1, $t0, P_1			#if not O jump to P
			la $t2, O							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		P_1:										#P
			addi $t0, $t0, 1			#increment to P
			bne $s1, $t0, Q_1			#if not P jump to Q
			la $t2, P							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Q_1:										#Q
			addi $t0, $t0, 1			#increment to Q
			bne $s1, $t0, R_1			#if not Q jump to R
			la $t2, Q							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop
			
		R_1:										#R
			addi $t0, $t0, 1			#increment to R
			bne $s1, $t0, S_1			#if not R jump to S
			la $t2, R							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		S_1:										#S
			addi $t0, $t0, 1			#increment to S
			bne $s1, $t0, T_1			#if not S jump to T
			la $t2, S							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		T_1:										#T
			addi $t0, $t0, 1			#increment to T
			bne $s1, $t0, U_1			#if not T jump to U
			la $t2, T							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		U_1:										#U
			addi $t0, $t0, 1			#increment to U
			bne $s1, $t0, V_1			#if not U jump to V
			la $t2, U							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		V_1:										#V
			addi $t0, $t0, 1			#increment to V
			bne $s1, $t0, W_1			#if not V jump to W
			la $t2, V							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		W_1:										#W
			addi $t0, $t0, 1			#increment to W
			bne $s1, $t0, X_1			#if not W jump to X
			la $t2, W							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		X_1:										#X
			addi $t0, $t0, 1			#increment to X
			bne $s1, $t0, Y_1			#if not X jump to Y
			la $t2, X							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Y_1:										#Y
			addi $t0, $t0, 1			#increment to Y
			bne $s1, $t0, Z_1			#if not Y jump to Z
			la $t2, Y							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		Z_1:										#Z
			addi $t0, $t0, 1			#increment to Z
			bne $s1, $t0,ENDMAINLOOP			#if not Z jump to A
			la $t2, Z							#load address of frequency
			lw $t1, 0($t2)				#load frequency
			addi $t1, $t1, 1			#increment frequency
			sw $t1, 0($t2)				#store frequency
			j ENDMAINLOOP					#Next iteration of loop

		###

		ENDMAINLOOP:
			addi $s0, $s0, 1			#next char in string
			j MAINLOOP
	
	END:

	#now we have to print this shit

	li $v0, 4
	la $a0, A_str
	syscall
	li $v0, 1
	la $t0, A
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, B_str
	syscall
	li $v0, 1
	la $t0, B
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, C_str
	syscall
	li $v0, 1
	la $t0, C
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, D_str
	syscall
	li $v0, 1
	la $t0,D
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, E_str
	syscall
	li $v0, 1
	la $t0,E
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, F_str
	syscall
	li $v0, 1
	la $t0, F
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, G_str
	syscall
	li $v0, 1
	la $t0, G
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, H_str
	syscall
	li $v0, 1
	la $t0, H
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, I_str
	syscall
	li $v0, 1
	la $t0, I
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, J_str
	syscall
	li $v0, 1
	la $t0, J
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, K_str
	syscall
	li $v0, 1
	la $t0,K
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, L_str
	syscall
	li $v0, 1
	la $t0, L
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, M_str
	syscall
	li $v0, 1
	la $t0,M
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, N_str
	syscall
	li $v0, 1
	la $t0, N
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, O_str
	syscall
	li $v0, 1
	la $a0, O
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, P_str
	syscall
	li $v0, 1
	la $t0,P
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Q_str
	syscall
	li $v0, 1
	la $t0,Q
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, R_str
	syscall
	li $v0, 1
	la $t0,R
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, S_str
	syscall
	li $v0, 1
	la $t0,S
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, T_str
	syscall
	li $v0, 1
	la $t0, T
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, U_str
	syscall
	li $v0, 1
	la $t0,U
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, V_str
	syscall
	li $v0, 1
	la $t0,V
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, W_str
	syscall
	li $v0, 1
	la $t0,W
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, X_str
	syscall
	li $v0, 1
	la $t0, X
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Y_str
	syscall
	li $v0, 1
	la $t0, Y
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Z_str
	syscall
	li $v0, 1
	la $t0, Z
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 



	li $v0, 4
	la $a0, A_cap_str
	syscall
	li $v0, 1
	la $t0, A_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, B_cap_str
	syscall
	li $v0, 1
	la $t0, B_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, C_cap_str
	syscall
	li $v0, 1
	la $t0, C_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, D_cap_str
	syscall
	li $v0, 1
	la $t0,D_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, E_cap_str
	syscall
	li $v0, 1
	la $t0,E_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, F_cap_str
	syscall
	li $v0, 1
	la $t0, F_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, G_cap_str
	syscall
	li $v0, 1
	la $t0, G_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, H_cap_str
	syscall
	li $v0, 1
	la $t0, H_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, I_cap_str
	syscall
	li $v0, 1
	la $t0, I_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, J_cap_str
	syscall
	li $v0, 1
	la $t0, J_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, K_cap_str
	syscall
	li $v0, 1
	la $t0,K_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, L_cap_str
	syscall
	li $v0, 1
	la $t0, L_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, M_cap_str
	syscall
	li $v0, 1
	la $t0,M_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, N_cap_str
	syscall
	li $v0, 1
	la $t0, N_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, O_cap_str
	syscall
	li $v0, 1
	la $a0, O_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, P_cap_str
	syscall
	li $v0, 1
	la $t0,P_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Q_cap_str
	syscall
	li $v0, 1
	la $t0,Q_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, R_cap_str
	syscall
	li $v0, 1
	la $t0,R_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, S_cap_str
	syscall
	li $v0, 1
	la $t0,S_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, T_cap_str
	syscall
	li $v0, 1
	la $t0, T_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, U_cap_str
	syscall
	li $v0, 1
	la $t0,U_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, V_cap_str
	syscall
	li $v0, 1
	la $t0,V_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, W_cap_str
	syscall
	li $v0, 1
	la $t0,W_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, X_cap_str
	syscall
	li $v0, 1
	la $t0, X_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Y_cap_str
	syscall
	li $v0, 1
	la $t0, Y_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall 

	li $v0, 4
	la $a0, Z_cap_str
	syscall
	li $v0, 1
	la $t0, Z_cap
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 4
	la $a0, SPACE_str
	syscall
	li $v0, 1
	la $t0,SPACE1
	lw $a0, 0($t0)
	syscall
	li $v0, 4

	#finally done
	li $v0,10
	syscall
