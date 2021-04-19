#Assignment No.: 7
#Problem No.: 3
#Semester: 5
#Group Number: 39
#Member 1:
#	Name: Aayush Prasad
#	Roll No.: 18CS30002
#Member 2:
#	Name: Rajdeep Das
#	Roll No.: 18CS30034
####################### Data segment ######################################
 .data
msg_input1:   .asciiz "Enter the 9 numbers: "
space:	.asciiz "  "

pos_result:   .asciiz "The sorted numbers are    "

#declaring the array and the space it'll use
array: .space 36	
msg_input2:   .asciiz "Enter the number to be searched for: "
neg_result:   .asciiz "The number was not found"

pos_result1:   .asciiz "The number was found at index:"
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
    main:
        #Asking for numbers
	    la $a0, msg_input1 
	    li $v0,4  #prints the message string
	    syscall

	    la $t0, array
	    li $s0, 0

	    # Reading input
	    Loop1:
	        li $v0, 5  
		syscall
		sw $v0, ($t0)
		addi $t0, $t0, 4
                addi $s0, $s0, 1
		blt $s0, 9, Loop1
	        la $a0, array   
	        li $a1, 9  		
	        jal InsertionSort 
	        move $t0, $v0
		#li  $v0, 4 
	        #la  $a0, pos_result  
	        #syscall  	
		li $s0, 0
	     #Loop4:
		#li  $v0, 1
	        #lw $a0, ($t0)
	        #syscall
	        #li  $v0, 4 
	    	#la  $a0, space   
	    	#syscall  	
	        #addi $t0, $t0, 4
	        #addi $s0, $s0, 1
	        #blt $s0, 9, Loop4
             
             li $v0, 4 
             la $a0, msg_input2 
	      #prints the message string
	     syscall

	     li $v0, 5  #reads integer
	     syscall
	     move $s1, $v0 
             jal BinarySearch
   		

	    exit:
	     	li $v0, 10
          	syscall 


  	InsertionSort:

  		li $t3, 1 
  		li $t2, 4
  		move $t0 ,$a0 
  	      Loop2:
	    	mult $t3, $t2 
	    	mflo $t4  
	    	add $t5, $t0, $t4 	    	
	    	move $t6, $t3 
	    	addi $t6, $t6, -1 
	    	lw $t7, ($t5) #Loading k = A[i]
	      Loop3:
	    	mult $t6, $t2 
	    	mflo $t4
	    	add $t8, $t0, $t4  
	    	lw $t9, ($t8) 
	    	ble $t9, $t7, outerloop 
	    	blt $t6, 0, outerloop 
	    	sw $t9, 4($t8) 
		addi $t6, $t6 ,-1 
	    	j Loop3

	       outerloop:
	    	sw $t7, 4($t8) #A[j+1] = k	
		addi $t3, $t3, 1
		blt $t3, $a1, Loop2
		move $v0, $a0 
		jr $ra  
      
        BinarySearch:
     
                   li $t2, 0
		   li $t3, 8
		   la $t0, array
		   la $t1, array

		  Loop33:
		  	  #Exit condition
		  	  bgt $t2, $t3, fail

		  	  # Calculating mid
		      add $t4, $t2, $t3
		      li $s3, 2
		      div $t4, $s3
		      mflo $t4

		      # In terms of bytes
		      li $s3, 4
		      mult $t4, $s3
		      mflo $t4

		      #Check for success
		      add $t1, $t0, $t4
		      lw $s2, ($t1)
		      beq $s2, $s1, success

		      # Binary Search conditio
		      blt $s2, $s1, Right
		      j Left

		      Right:
		        li $s3, 4
		      	div $t4, $s3
		      	mflo $t4
		      	addi $t2, $t4, 1
		      	j Loop33

		      Left:
		      	li $s3, 4
		      	div $t4, $s3
		      	mflo $t4
		      	sub $t3, $t4, 1
		      	j Loop33
    
         fail:
            li  $v0, 4 # for print_str
	    la  $a0, neg_result  # preparing to print the message 
	    syscall  # print the string
	    j exit

	 #When the number has been found
        success:
            li $s3, 4
            div $t4, $s3
	    mflo $t4

	    li  $v0, 4 # for print_str
	    la  $a0, pos_result1  # preparing to print the message 
	    syscall  # print the string

            li  $v0, 1
	    move $a0, $t4
	    syscall
	    j exit
                