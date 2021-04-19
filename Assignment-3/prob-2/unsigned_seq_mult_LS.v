`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 3
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//unsigned sequential multiplier (left shift) module
module unsigned_seq_mult_LS(product,a,b,rst,clk,load);
input [5:0]  a, b;
input        rst, clk;
output        product;
output        load;

reg [11:0]    product;

//creating copy of a and b
reg [5:0]    multiplier_copy;
reg [11:0]    multiplicand_copy;

reg [2:0]     bit; 
wire          load = !bit;

initial bit = 0;

always @( posedge clk )

if( load && rst ) begin

bit               = 6;
product           = 0;
multiplicand_copy = { 6'd0, b };
multiplier_copy   = a;

end else if( bit ) begin
//performing partial product calculation multiplier bit is set (checking from LSB)
if( multiplier_copy[0] == 1'b1 ) product = product + multiplicand_copy;

multiplier_copy = multiplier_copy >> 1;
multiplicand_copy = multiplicand_copy << 1;
bit = bit - 1;

end
endmodule





