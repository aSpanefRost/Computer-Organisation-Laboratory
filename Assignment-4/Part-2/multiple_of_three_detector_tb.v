`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: multiple_of_three_detector_tb
//////////////////////////////////////////////////////////////////////////////////

//testbench for multiple of three detector
module multiple_of_three_detector_tb;
reg inp;
wire [1:0] outp;
reg clk;
reg rst;
multiple_of_three_detector UUT(.clk(clk),.rst(rst),.inp(inp),.outp(outp));
initial begin
rst = 1; clk=0;
    #5 rst = 0;inp = 0; 
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 1;
    #10 inp = 0;
//uncommment to see result on following input
  /*  #5 rst = 1;
    #5 rst = 0;inp = 0; 
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 1;
    #10 inp = 1; */
    #10 $finish; 
end
always #5 clk = !clk;
endmodule
