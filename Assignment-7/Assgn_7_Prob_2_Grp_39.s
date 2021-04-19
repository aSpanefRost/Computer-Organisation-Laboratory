#Assignment No.: 7
#Problem No.: 2
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
msg_input1:   .asciiz "Enter 8 line-separated integers: "
space:	.asciiz "  "

pos_result:   .asciiz "The sorted numbers are    "
#declaring the array and the space it'll use
array: .space 32	
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
		blt $s0, 8, Loop1
	        la $a0, array   
	        li $a1, 8  		
	        jal InsertionSort 
	        move $t0, $v0
		li  $v0, 4 
	        la  $a0, pos_result  
	        syscall  	
		li $s0, 0
	     Loop4:
		li  $v0, 1
	        lw $a0, ($t0)
	        syscall
	        li  $v0, 4 
	    	la  $a0, space   
	    	syscall  	
	        addi $t0, $t0, 4
	        addi $s0, $s0, 1
	        blt $s0, 8, Loop4		
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
                