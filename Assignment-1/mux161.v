`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2020 03:35:25
// Design Name: 
// Module Name: mux161
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


module mux161(
data,
select,
out
);
input [15:0] data;
input [3:0] select;
output out;

wire [1:0] o;

mux81 m1(
.data(data[15:8]),
.select(select[2:0]),
.out(o[1])
);

mux81 m2(
.data(data[7:0]),
.select(select[2:0]),
.out(o[0])
);

assign out = select[3] ? o[1] : o[0];

endmodule
