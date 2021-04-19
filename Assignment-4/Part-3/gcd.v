`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
// Module Name: gcd
//////////////////////////////////////////////////////////////////////////////////


module gcd(
    input [31:0] a,b,
    output [31:0] gcd_out,
	output reg DONE,
	input clk, reset
    );

	wire xsel, ysel, xload, yload, gcdload, eqflag, ifflag;
	wire done;
	 
	 datapath d1( .clk(clk), .reset(reset), .x_sel(xsel), .y_sel(ysel), .x_load(xload),
	 .y_load(yload), .gcd_load(gcdload),
	 .a(a), .b(b), .eq_flag(eqflag), .if_flag(ifflag),
    .gcd(gcd_out));

	 control c1( .clk(clk),
    .reset(reset),
    .eq_flag(eqflag),
    .if_flag(ifflag),
	.done(done),
    .x_load(xload),
    .y_load(yload),
    .x_sel(xsel),
    .y_sel(ysel),
    .gcd_load(gcdload));
	 
	always @(posedge clk) begin
		DONE <= done;
	end
endmodule
