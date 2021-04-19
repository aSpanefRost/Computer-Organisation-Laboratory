`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 2
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: multiple_of_three_detector
//////////////////////////////////////////////////////////////////////////////////


module multiple_of_three_detector( clk, rst, inp, outp);

input clk, rst, inp;
output reg [1:0] outp;
reg [2:0] state;

//total number of states = 6
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;

always @( posedge clk, posedge rst ) begin
if( rst ) begin
   state <= S0;
   outp <= 0;
end
else  begin
   case( state )
   S0: begin
        if( inp ) begin
           state <= S4;
           outp  <= 1;
        end
        else begin
            state <= S3;
            outp <= 0;
        end
   end

   S1: begin
        if( inp ) begin
            state <= S5;
            outp  <= 2;
        end
        else  begin
           state <= S4;
           outp <= 1;
        end
   end
   S2: begin
        if( inp ) begin
            state <= S3;
            outp  <= 0;
        end
        else  begin
           state <= S5;
           outp <= 2;
        end
   end
   S3: begin
        if( inp ) begin
           state <= S2;
           outp  <= 2;
        end
        else begin
            state <= S0;
            outp <= 0;
        end
   end

   S4: begin
        if( inp ) begin
            state <= S0;
            outp  <= 0;
        end
        else  begin
           state <= S1;
           outp <= 1;
        end
   end
   S5: begin
        if( inp ) begin
            state <= S1;
            outp  <= 1;
        end
        else  begin
           state <= S2;
           outp <= 2;
        end
   end
 endcase
end
end

endmodule
