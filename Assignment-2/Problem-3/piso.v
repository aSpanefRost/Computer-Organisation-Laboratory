`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 2
//Problem Number: 3
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////

//piso (parallel in serial out) module 
module piso(
    input [7:0] in,
    input clk,
    input enable,
    input rst,
    output reg out
    );
    reg [7:0] memory;
    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            out <= 0; //output is 0 since no shift performed
            memory <= in; //if rst = 1 store input in memory
        end
        else if(enable)
        begin
            out = memory[0]; //output is the LSB of the memory register
            memory = memory >> 1; //memory is shifted right by 1 
        end
    end
endmodule
