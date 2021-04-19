`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
// Module Name:    reg_file 
//////////////////////////////////////////////////////////////////////////////////
module reg_file(
    input clk,
    input reset,
    input load,
    input [31:0] data,
    output [31:0] out
    );
	
	reg [31:0] out;
	always@(posedge clk)
	begin
	if(reset == 1'b1) begin
		out <= 0;
	end else if(load == 1'b1) begin
		out <= data;
	end else begin
		out <= out;
	end
	end

endmodule
