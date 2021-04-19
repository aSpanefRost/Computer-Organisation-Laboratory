`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 03:35:25
// Design Name: 
// Module Name: mux41
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


module mux41(
data,
select,
out
);
input [3:0] data;
input [1:0] select;
output out;

wire [1:0] o;

mux21 m1(
.data(data[3:2]),
.select(select[0]),
.out(o[1])
);

mux21 m2(
.data(data[1:0]),
.select(select[0]),
.out(o[0])
);

mux21 m3(
.data(o[1:0]),
.select(select[1]),
.out(out)
);

endmodule
