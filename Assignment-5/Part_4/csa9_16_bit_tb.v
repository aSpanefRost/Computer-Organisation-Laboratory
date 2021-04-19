`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 4
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: Carry Save Adder Testbench Module to Add 9 16-bit numbers using Wallace Tree
//////////////////////////////////////////////////////////////////////////////////


module csa9_16_bit_tb;
    reg [15:0] a0,a1,a2,a3,a4,a5,a6,a7,a8;
    wire [20:0] sum; 
    csa9_16_bit uut(a0,a1,a2,a3,a4,a5,a6,a7,a8,sum);
    initial
    begin
      a0=16'd0;a1=16'd0;a2=16'd0;a3=16'd0;a4=16'd0;a5=16'd0;a6=16'd0;a7=16'd0;a8=16'd0;
      #10 a0=16'd2;a1=16'd3;a2=16'd4;a3=16'd12261;a4=16'd2467;a5=16'd8067;a6=16'd13767;a7=16'd35633;a8=16'd943;
      #10 $finish;
    end
endmodule
