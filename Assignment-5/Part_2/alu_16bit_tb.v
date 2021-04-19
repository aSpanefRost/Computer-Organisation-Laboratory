//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: ALU 16-bit Testbench Module
//////////////////////////////////////////////////////////////////////////////////

//ALU 16-bit Testbench Module
module alu_16bit_tb;
//Inputs
  reg[15:0] A,B;
  reg[3:0] ALU_Sel;
  reg M, cin;
  //outputs
  wire Cn4, equality_check,P,G;
  wire [15:0] F;
 // Verilog code for ALU
 alu_16bit test_unit(
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU Selection
   			M,cin,
   			Cn4,equality_check,P,G,F
     );
  integer k = 0;
  //finding answer for all possible values of select and M
  initial
    begin
    A = 16'd1200; B = 16'd343; cin = 1'b1;
    for (k=0;k<32;k=k+1)
    #10 {ALU_Sel,M} = k;
    #10 $finish;
    end
endmodule