#GROUP NO: G39
#AAYUSH PRASAD 18CS30002
#RAJDEEP DAS 18CS30034
#ASSIGNMENT NO: 6
#PROBLEM NO: 2

####################### Data segment ######################################
 .data
msg_input1:   .asciiz "Enter the number: "
neg_number:   .asciiz "The Number is less than 2"
composite_num:   .asciiz "The Number is Composite"
prime_num:   .asciiz "The Number is Prime"
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
               

          # checking whether both the inputs are greater than 1
          move $a0, $t0
          jal check_values

          # If return value is 0, print error message
          beq $v0, 0, negative

          beq $a0, 2, prime

          # Call the func to calculate GCD
          jal num_type
          
          beq $v0, 1, composite
          j prime

          j exit

          # Error message
          
          negative:
          	li $v0, 4
          	la $a0, neg_number
          	syscall
                li $v0, 4
          	la $a0, newline
          	syscall
                
                j exit
          composite:
          	li $v0, 4
          	la $a0, composite_num
          	syscall

                li $v0, 4
          	la $a0, newline
          	syscall

                j exit
          prime:
          	li $v0, 4
          	la $a0, prime_num
          	syscall
                
                li $v0, 4
          	la $a0, newline
          	syscall

                j exit

          # Exit
          exit:
          	li $v0, 10
          	syscall

      # Check if less than 2
      check_values:

      	# Check if both numbers are greater than 1
          bge $t0, 2, return1   #change
          j return0   #change
                 
        # Return 0
          return0:
          	li $v0, 0
          	j $ra

        # Return 1
          return1:
          	li $v0, 1
          	j $ra 

      num_type:

        li $t1, 2
        addi $t2, $a0, -1

      	recurse:
                
                div $a0, $t1
                mfhi $t0
                beq $t0, 0, return11
                bgt $t2, $t1, increment
                j return00
 
        increment:
                addi $t1, $t1, 1
                j recurse
                 
                
                 # Return 0
        return00:
          	li $v0, 0
          	j $ra

                 # Return 1
        return11:
          	li $v0, 1
          	j $ra
                 
	      	# addi $sp, $sp, 12
	      	# jr $ra