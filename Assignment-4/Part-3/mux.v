`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
// Module Name:    mux 
//////////////////////////////////////////////////////////////////////////////////
module mux(
    input sel,
    input [31:0] in0, in1,
	 output [31:0] mux_out
    );
	 
assign mux_out = (sel==0) ? in0 : in1;
endmodule
