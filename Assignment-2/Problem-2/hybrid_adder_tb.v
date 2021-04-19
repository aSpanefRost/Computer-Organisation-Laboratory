`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
Assignment Number: 2
Problem Number: 2
Semester: 5
Group Number: G39
Group Member 1: Aayush Prasad
Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//testbench for hybrid adder
module hybrid_adder_tb;
reg[7:0] a;
reg[7:0] b;
reg cin;
wire[7:0] sum;
wire cout;
hybrid_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial 
begin
a = 8'h00; b = 8'h00; cin = 1'b0; 
#5 a = 8'ha3; b = 8'h34; cin = 1'b1; 
#5 a = 8'h20; b = 8'h03; cin = 1'b1; 
#5 a = 8'h6f; b = 8'h58; cin = 1'b0; 
#5 a = 8'hea; b = 8'hff; cin = 1'b0; 
#5 a = 8'h3e; b = 8'h7d; cin = 1'b1; 
#5 a = 8'h5b; b = 8'h1c; cin = 1'b0; 
#5 a = 8'h99; b = 8'h99; cin = 1'b0; 
#5 a = 8'hff; b = 8'hff; cin = 1'b1; 
#5 a = 8'h02; b = 8'h01; cin = 1'b0; 
#5 a = 8'h3e; b = 8'h20; cin = 1'b1; 
#5 $finish;
end
endmodule
