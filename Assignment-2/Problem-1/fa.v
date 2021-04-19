`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
Assignment Number: 2
Problem Number: 1
Semester: 5
Group Number: G39
Group Member 1: Aayush Prasad
Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//full adder
module fa(
    input a, 
    input b,
    input cin,
    output sum,
    output cout
    );
    assign sum = (a^b^cin); //xor of the bits
    assign cout = ((a&b)|(b&cin)|(a&cin)); //carry is 1 if any 2 or a,b,cin are 1s
endmodule
