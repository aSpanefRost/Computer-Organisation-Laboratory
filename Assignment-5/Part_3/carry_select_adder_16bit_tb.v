//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: 16-bit Carry Select Adder Testbench Module
//////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////
//// 16-bit Carry Select Adder Testbench Module
////////////////////////////////////////////////

module carry_select_adder_16bit_tb;
reg [15:0] a,b;
reg cin;
wire [15:0] sum;
wire cout;
carry_select_adder_16bit uut(.a(a), .b(b),.cin(cin),.sum(sum),.cout(cout));
 
initial begin
  a=0; b=0; cin=0;
  #10 a=16'd0; b=16'd0; cin=1'd1;
  #10 a=16'd14; b=16'd1; cin=1'd1;
  #10 a=16'd5; b=16'd0; cin=1'd0;
  #10 a=16'd999; b=16'd0; cin=1'd1;
  #10 $finish;
end
endmodule