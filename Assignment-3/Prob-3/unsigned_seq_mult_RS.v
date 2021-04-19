`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 3
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//Unsigned sequential multiplier (right shift) module
module unsigned_seq_mult_RS(product,a,b,rst,clk,load);
input [5:0]  a, b;
input        rst, clk;
output        product;
output        load;

reg [11:0]    product;
//copying values of a and b for shift operations
reg [5:0]    multiplier_copy;
reg [11:0]    multiplicand_copy;

reg [2:0]     bit; 
wire          load = !bit;

initial bit = 0;

always @( posedge clk )

if( load && rst ) begin

bit               = 7;
product           = 0;
multiplicand_copy = { b, 6'd0 };
multiplier_copy   = a;

end else if( bit ) begin

if( multiplier_copy[5] == 1'b1 ) product = product + multiplicand_copy;

multiplier_copy = multiplier_copy << 1;
multiplicand_copy = multiplicand_copy >> 1;
bit = bit - 1;
product = product >> 1;

end
endmodule





