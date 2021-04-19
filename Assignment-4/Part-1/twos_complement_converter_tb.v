`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 1
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: twos_complement_converter_tb
//////////////////////////////////////////////////////////////////////////////////

//testbench for twos complement converter
module twos_complement_converter_tb;
reg inp;
wire outp;
reg clk;
reg rst;
twos_complement_converter UUT(.clk(clk),.rst(rst),.inp(inp),.outp(outp));
initial begin
rst = 1; clk=0;
//bits given from LSB side
    #5 rst = 0;inp = 0; 
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 0;
    #10 inp = 1;
    #10 inp = 1;
    #10 inp = 0;
    #10 $finish;
end
always #5 clk = !clk;
endmodule
