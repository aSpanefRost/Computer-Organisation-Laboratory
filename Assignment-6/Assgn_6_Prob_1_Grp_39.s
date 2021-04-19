#GROUP NO: G39
#AAYUSH PRASAD 18CS30002
#RAJDEEP DAS 18CS30034
#ASSIGNMENT NO: 6
#PROBLEM NO: 1

####################### Data segment ######################################
 .data
msg_input1:   .asciiz "Enter the first number: "
msg_input2:   .asciiz "Enter the second number: "

msg_result:   .asciiz "The GCD of the two numbers is: "
neg_number:   .asciiz "You have not entered non-negative numbers"
newline:   .asciiz "\n"
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
    main:
          la $a0, msg_input1 
          li $v0, 4  #prints the message string
          syscall

          li $v0, 5  #reads first integer
          syscall
          move $t0, $v0 #result returned in $v0
               
          la $a0, msg_input2 
          li $v0,4  #prints the message string
          syscall
               
          li $v0, 5 #reads second integer
          syscall
          move $t1, $v0 #result returned in $v0

          # checking whether both the inputs are positive
          move $a0, $t0
          move $a1, $t1
          jal check_non_negative_values

          # If return value is 0, print error message
          beq $v0, 0, negative

          # Call the func to calculate GCD
          jal find_gcd

          # Store the return value in a temp address
          move $t0, $v0

          # Print the result
          li $v0, 4
          la $a0, msg_result
          syscall

          li $v0, 1
          move $a0, $t0
          syscall

          li $v0, 4
          la $a0, newline
          syscall

          j exit

          # Error message
          negative:
          	li $v0, 4
          	la $a0, neg_number
          	syscall

          # Exit
          exit:
          	li $v0, 10
          	syscall

      # Check if not positive
      check_non_negative_values:

      	# Check if both numbers are non - negative 
          blt $t0, 0, return0
          blt $t1, 0, return0
          j return1

        # Return 0
          return0:
          	li $v0, 0
          	j $ra

        # Return 1
          return1:
          	li $v0, 1
          	j $ra 

      find_gcd:

      	# Base condition, if a == 0, return b
      	bne $a0, 0, recurse
      	move $v0, $a1
      	jr $ra

      	recurse:

	      	addi $sp, $sp, -12
	      	sw $ra, ($sp) # Storing ra
	      	sw $a0, 4($sp) # Storing the two arguments
	      	sw $a1, 8($sp)

	      	jal repeated_sub
	      	move $t0, $v0  # Storing t0 = a1 % a0

	      	# Store the current arguments, and call the function
	      	move $a1, $a0 
	      	move $a0, $t0
	      	jal find_gcd

	      	# Clean up the stack and return the value in v0
	      	lw $ra, ($sp)
	      	addi $sp, $sp, 12
	      	jr $ra
        
    repeated_sub:

      	# Base condition, if a > b, return b
      	ble $a0, $a1, sub_recurse
      	move $v0, $a1
      	jr $ra

      	sub_recurse:

	      	addi $sp, $sp, -12
	      	sw $ra, ($sp) # Storing ra
	      	sw $a0, 4($sp) # Storing the two arguments
	      	sw $a1, 8($sp)

            sub $a1, $a1, $a0
	      	jal repeated_sub

	      	# Clean up the stack and return the value in v0
	      	lw $ra, ($sp)
	      	addi $sp, $sp, 12
	      	jr $ra