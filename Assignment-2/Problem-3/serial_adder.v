`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 2
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//8 bit serial adder module
module serial_adder(
    input [7:0] a,
    input [7:0] b,
    input clk,
    input rst,
    output reg [7:0] out,
    output reg cout
    );
    //to count the number of sum bits calculated we use count[3:0]
    reg [3:0] count;
    reg enable;
    wire sum, bit_a, bit_b, temp_cout, cin;
    
    //piso = parallel in serial out register
    piso pisoA(a, clk, enable, rst, bit_a); //store LSB of a in bit_a and shift a by 1 bit
    piso pisoB(b, clk, enable, rst, bit_b); //store LSB of b in bit_b and shift b by 1 bit
    
    full_adder FA(bit_a, bit_b, cin, sum, temp_cout); //full adder to add the LSBs of a and b
    d_flip_flop DFF(temp_cout, clk, enable, rst, cin); //using D flip-flop to store the value of carry output of full adder
    
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            enable = 1; out = 0; count = 0;
        end
        else if(count > 4'b1000) //if count of bits exceeds 8 we set enable = 0
            enable = 0;
        else if(enable)
        begin
            cout = temp_cout; //storing the carry output in the final carry output of addition of a and b
            count = count + 1; //increasing count by 1
            out = out >> 1; //right shifting the output of addition
            out[7] = sum; //placing the result of full adder addition in the 7th bit of the output
        end
    end
endmodule
