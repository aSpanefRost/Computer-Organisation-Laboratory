`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 2
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//full adder module
module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    assign {cout, sum} = a+b+cin; //simply storing the carry output in cout and sum in sum using concatenation
endmodule
