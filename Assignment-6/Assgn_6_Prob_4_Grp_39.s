#GROUP NO: G39
#AAYUSH PRASAD 18CS30002
#RAJDEEP DAS 18CS30034
#ASSIGNMENT NO: 6
#PROBLEM NO: 4


####################### Data segment ######################################
 .data
msg_input1:   .asciiz "Enter the first number: "
msg_input2:   .asciiz "Enter the second number: "

msg_result:   .asciiz "The product of the two numbers is (using Booth's algorithm): "
msg_error:   .asciiz "You have entered out-of-range numbers"
newline:   .asciiz "\n"
####################### Text segment ######################################
.text 0x400000
main:

    la $a0, msg_input1 
    li $v0, 4  #prints the message string
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    la $a0, msg_input2 
    li $v0,4  #prints the message string
    syscall

    li $v0, 5
    syscall
    andi $s1, $v0, 0x0000ffff

    move $a0, $s0
    move $a1, $v0
    jal check_out_of_range_values

    beq $v0, 0, error

    sll $s0, $s0, 16                    # into Upper-Halfword (for addition)
    li $s4,0                            # saving the last bit
    li $s5,16                           # counter

loop:
    andi $s3, $s1, 1                    # $s3 = LSB($s1)
    beq $s3, $s4, endloop               # 00 or 11 -> cont
    beq $s3, $zero, runend              # 01 -> runend
    sub $s1, $s1, $s0                   # beginning of a run
    j endloop
runend:
    add $s1, $s1, $s0
endloop:
    sra $s1, $s1, 1                     # arithmetic right shift
    addi $s5, -1
    move $s4, $s3
    bne $s5, $zero, loop 
    
    # Print the result
    li $v0, 4
    la $a0, msg_result
    syscall
    li $v0, 1
    move $a0, $s1
    syscall  
    li $v0, 4
    la $a0, newline
    syscall 
end:
    li $v0, 10
    syscall


error:
    la $a0, msg_error 
    li $v0, 4  #prints the message string
    syscall
    j exit

exit:
    li $v0, 10
    syscall

# Check if not positive
check_out_of_range_values:

# Check if both numbers are in the range
    bgt $a0, 32767, return0
    blt $a0, -32768, return0
    bgt $a1, 32767, return0
    blt $a1, -32768, return0
    j return1

# Return 0
return0:
    li $v0, 0
    j error

# Return 1
return1:
    li $v0, 1
    j $ra 
