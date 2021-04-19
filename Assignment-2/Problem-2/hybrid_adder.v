`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
Assignment Number: 2
Problem Number: 2
Semester: 5
Group Number: G39
Group Member 1: Aayush Prasad
Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

// hybrid adder module
module hybrid_adder(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
    );
    //using carry look ahead adder
    wire c1;
    cla cla1(
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cin),
    .sum(sum[3:0]),
    .cout(c1)
    );
    
    cla cla2(
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(c1),
    .sum(sum[7:4]),
    .cout(cout)
    );
endmodule
