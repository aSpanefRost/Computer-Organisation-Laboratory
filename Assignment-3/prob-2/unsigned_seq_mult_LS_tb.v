`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 3
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//unsigned sequential multiplier (left shift) testbench module
module unsigned_seq_mult_LS_tb;
reg[5:0] a;
reg[5:0] b;
wire[11:0] product;
reg clk;
wire load;
reg rst;

//Unit Under Test
unsigned_seq_mult_LS sum(.product(product),.a(a),.b(b),.rst(rst),.clk(clk),.load(load));

initial 
begin 
clk=0;rst=1;a=6'b00010;b=6'b10;#70;
rst=1;a=6'b10001;b=6'b10000;#70;
rst=1;a=6'b11000;b=6'b101010;#70;
rst=1;a=6'b110001;b=6'b101011;#70;
$finish;
end
always #5 clk=!clk; 


endmodule
