`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 04:13:22
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench;

//inputs
reg [15:0] data;
reg [3:0] select;

//output
wire out;

//Unit Under Test (UUT)
mux161 uut(
.data(data),
.select(select),
.out(out)
);

initial 
begin
data = 16'h0000; select = 4'h3;
#5 data = 16'habcd; select = 4'he;
#5 data = 16'h1234; select = 4'h5;
#5 data = 16'h9999; select = 4'h9;
#5 data = 16'h48d1; select = 4'h1;
#5 data = 16'ha98b; select = 4'h7;
#5 data = 16'h1948; select = 4'hf;
#5 data = 16'hcc71; select = 4'h4;
#5 data = 16'h623e; select = 4'h0;
#5 data = 16'h0123; select = 4'ha;
#5 data = 16'h3301; select = 4'hd;
#5 data = 16'h0101; select = 4'hc;
#5 data = 16'heee5; select = 4'hb;
#5 data = 16'hfab3; select = 4'h8;
#5 data = 16'hdaff; select = 4'h6;
#5 data = 16'h6170; select = 4'h2;
#5 $finish;
end

endmodule
