`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
Assignment Number: 2
Problem Number: 2
Semester: 5
Group Number: G39
Group Member 1: Aayush Prasad
Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//carry look ahead module
module cla(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    wire [4:0] c;
    wire [3:0] g,p;
    //using 4 full adders
    fa fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(c[0]),
        .sum(sum[0]),
        .cout()
        );
    fa fa1(
        .a(a[1]),
        .b(b[1]),
        .cin(c[1]),
        .sum(sum[1]),
        .cout()
        );
    fa fa2(
        .a(a[2]),
        .b(b[2]),
        .cin(c[2]),
        .sum(sum[2]),
        .cout()
        );
    fa fa3(
        .a(a[3]),
        .b(b[3]),
        .cin(c[3]),
        .sum(sum[3]),
        .cout()
        );
    //creating the generate terms g[i]=a[i]&b[i]
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];
    
    //creating the propagate terms p[i]=a[i]|b[i]
    assign p[0] = a[0] | b[0];
    assign p[1] = a[1] | b[1];
    assign p[2] = a[2] | b[2];
    assign p[3] = a[3] | b[3];
    
    //creating the carry terms
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c[4] = g[3] | (p[3] & c[3]);
    
    assign cout = c[4];
    
endmodule
