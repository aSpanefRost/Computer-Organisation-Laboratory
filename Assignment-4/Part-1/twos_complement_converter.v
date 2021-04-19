`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 4
//Problem Number: 1
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: twos_complement_converter
//////////////////////////////////////////////////////////////////////////////////

//module definition
module twos_complement_converter( clk, rst, inp, outp);

input clk, rst, inp;
output outp;

reg state;
reg outp;
//total number of states = 2
parameter S0 = 0, S1 = 1;

always @( posedge clk, posedge rst ) begin
//start state is S0
if( rst ) begin
   state <= S0;
   outp <= 0;
end
else  begin
   case( state )
   S0: begin
        if( inp ) begin
           state <= S1;
           outp  <= 1;
        end
        else begin
            state <= S0;
            outp <= 0;
        end
   end

   S1: begin
        if( inp ) begin
            state <= S1;
            outp  <= 0;
        end
        else  begin
           state <= S1;
           outp <= 1;
        end
   end
 endcase
end
end

endmodule
