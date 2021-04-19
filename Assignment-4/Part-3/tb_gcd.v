
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
// Module Name: testbench for gcd
////////////////////////////////////////////////////////////////////////////////

module tb_gcd;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] gcd_out;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	gcd uut (
		.a(a), 
		.b(b), 
		.gcd_out(gcd_out),
		.DONE(done), 
		.clk(clk), 
		.reset(reset)
	);

initial begin
		a = 32'd0;
		b = 32'd0;
		clk = 0;
		reset = 1;
		end
	always
	#10 clk = ~clk;
	
	initial 
	begin
	#1000; 
	$finish;
	end
	
	initial
	begin
	#80;
	reset = 0;
	end
	
	initial
	begin
	#30;
	a = 32'd51;
	b = 32'd17;
	end
 
endmodule


