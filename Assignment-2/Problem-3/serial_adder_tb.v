`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 2
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//testbench for serial adder
module serial_adder_tb;

reg [7:0] a;
reg [7:0] b;
reg clk;
reg rst;
wire [7:0] sum;
wire cout;

serial_adder SA(a, b, clk, rst, sum, cout);

initial
begin
    clk = 0;
    a = 8'haa; b = 8'h08; rst = 1; #20;
    rst = 0; #325;
    $finish;
end
always #10 clk = !clk; //clk time period = 20 units
endmodule
