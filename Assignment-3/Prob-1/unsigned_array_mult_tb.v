`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 3
//Problem Number: 1
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//unsigned array multiplier (combinational) testbench module
module unsigned_array_mult_tb;
    reg [5:0] a;
    reg [5:0] b;
    wire [11:0] product;
    //Unit Under Test
    unsigned_array_mult UUT(a,b,product);
    initial
    begin
        a = 6'b001010; b = 6'b011011; #20; //ans = 000100001110
        a = 6'b101010; b = 6'b111011; #20; //ans = 100110101110
        a = 6'b111111; b = 6'b111111; #20; //ans = 111110000001
        a = 6'b011010; b = 6'b011001; #20; //ans = 001010001010
        a = 6'b110100; b = 6'b001101; #20; //ans = 001010100100
        $finish;
    end
endmodule
