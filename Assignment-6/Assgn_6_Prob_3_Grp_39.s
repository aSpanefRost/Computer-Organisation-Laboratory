#GROUP NO: G39
#AAYUSH PRASAD 18CS30002
#RAJDEEP DAS 18CS30034
#ASSIGNMENT NO: 6
#PROBLEM NO: 3


####################### Data segment ######################################
 .data
msg_input1:   .asciiz "Enter the first number: "
msg_input2:   .asciiz "Enter the second number: "

msg_result:   .asciiz "The Product of the two numbers is: "
msg_result1:   .asciiz "The Product of the two numbers is: 2^32 "
big_number:   .asciiz "You should enter a non-negative numbers < 2^16"
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

          # checking whether both the inputs are less than 2^16 or not 
          move $a0, $t0
          move $a1, $t1
          jal check_values

          # If return value is 0, print error message
          beq $v0, 0, negative
                    
          li $s2, 0 # Result's going to be in s2!
	  li $s3, 1 # Mask for extracting bit!
	  li $t1, 0 # Counter for loop
          #li $t5, 1

          # Call the func to calculate GCD
          jal seq_mult_unsigned
          
         
          # Store the return value in a temp address
          move $t0, $v0
          
          #check if the multiplication value is negative 
          blt $v0, 0, opposite          

          # Print the result
          li $v0, 4
          la $a0, msg_result
          syscall

          li $v0, 1
          move $a0, $t0
          syscall

          #Print the newline 
          li $v0, 4
          la $a0, newline
          syscall

          j exit

          # Error message
          negative:
          	li $v0, 4
          	la $a0, big_number
          	syscall
          
                li $v0, 4
          	la $a0, newline
          	syscall
                j exit
          #print the result in case of multiplication being negative
          opposite:
                li $v0, 4
                la $a0, msg_result1
                syscall              

                li $v0, 1
                move $a0, $t0
                syscall

                li $v0, 4
          	la $a0, newline
          	syscall

                j exit

                

          # Exit
          exit:
          	li $v0, 10
          	syscall

      # Check if number is non-negative and less than 2^16 
      check_values:

          bgt $t0, 65535, return0
          bgt $t1, 65535, return0
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
      
      seq_mult_unsigned:
        
        beq $t1, 31, exit1
	and $t0, $a1, $s3
	sll $s3, $s3, 1
	
	beq $t0, 0, multiply_inc
	addu $s2, $s2, $a0
              
   
        multiply_inc:
                   addi $sp, $sp, -12
	      	   sw $ra, ($sp)

	           sll $a0, $a0, 1
	           addi $t1, $t1, 1
	           jal seq_mult_unsigned  

                   lw $ra, ($sp)
	      	   addi $sp, $sp, 12
	      	   jr $ra
        exit1:
             move $v0, $s2
      	     jr $ra
