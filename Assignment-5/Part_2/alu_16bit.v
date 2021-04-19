//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: ALU 16-bit module
//////////////////////////////////////////////////////////////////////////////////

//AlU 16-bit Module
module alu_16bit(
                  input [15:0] A,B,
                  input [3:0] ALU_Sel,
                  input M, input cin,
                  output Cn4, equality_check, P, G,
                  output [15:0] F
);
  wire tmp;
  wire [3:0] p,g;
  wire [4:0] carry;
  assign carry[0] = cin;
  assign P = p[0]&p[1]&p[2]&p[3];
  assign G = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0]);
  
  reg eq_check ;
  assign equality_check = eq_check;
  
  always @(A or B)
    begin
    if(A==B)
      eq_check = 1;
    else 
      eq_check = 0;
    
   end
  //Using ALU 4-bit module to realise ALU 16-bit module
  genvar i;
	
  generate 
    for(i=0;i<4;i=i+1)
      begin
        alu_4bit a(A[4*(i+1)-1:4*i], B[4*(i+1)-1:4*i], ALU_Sel, M, carry[i], carry[i+1], tmp,p[i], g[i], F[4*(i+1)-1:4*i]);
      end
  endgenerate
  
  assign Cn4 = ~carry[4];

  
endmodule
