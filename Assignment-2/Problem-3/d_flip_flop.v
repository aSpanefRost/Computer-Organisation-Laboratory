`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 2
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//D flip-flop module
module d_flip_flop(
    input a,
    input clk,
    input enable,
    input rst,
    output reg out
    );
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            out = 0; //output initially is 0 because addition is performed
        end
        else if(enable)
            out = a; //if enabled, out = a
    end
endmodule
