`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 03:35:25
// Design Name: 
// Module Name: mux81
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


module mux81(
data,
select,
out
);
input [7:0] data;
input [2:0] select;
output out;

wire [3:0] o;
assign o[3:2] = 0;

mux41 m1(
.data(data[7:4]),
.select(select[1:0]),
.out(o[1])
);

mux41 m2(
.data(data[3:0]),
.select(select[1:0]),
.out(o[0])
);

assign out = select[2] ? o[1] : o[0];

endmodule
