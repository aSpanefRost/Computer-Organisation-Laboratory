`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 4
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: Carry Save Adder Module to Add 9 16-bit numbers using Wallace Tree
//////////////////////////////////////////////////////////////////////////////////

//CSA 16-bit adder module to add 9 16-bit numbers
module csa9_16_bit
    (
        input [15:0] a0,
        input [15:0] a1,
        input [15:0] a2,
        input [15:0] a3,
        input [15:0] a4,
        input [15:0] a5,
        input [15:0] a6,
        input [15:0] a7,
        input [15:0] a8,
      
        output [20:0] sum
    );
    
    wire [16:0] temp1 [5:0];
    
    csa3_N_bit #(16) u0_0(a0,a1,a2,temp1[0],temp1[1]);
    csa3_N_bit #(16) u0_1(a3,a4,a5,temp1[2],temp1[3]);
    csa3_N_bit #(16) u0_2(a6,a7,a8,temp1[4],temp1[5]);
    
    wire [17:0] temp2 [3:0];
    
    
    csa3_N_bit #(17) u1_0(temp1[0],temp1[1],temp1[2],temp2[0],temp2[1]);
    csa3_N_bit #(17) u1_1(temp1[3],temp1[4],temp1[5],temp2[2],temp2[3]);

    wire [18:0] temp3[1:0];
    
    
    csa3_N_bit #(18) u2_0(temp2[0],temp2[1],temp2[2],temp3[0],temp3[1]);
    
    wire [19:0] temp4[1:0];
    wire [18:0] temp_sum;
    assign temp_sum  = {1'b0,temp2[3]};
    
    csa3_N_bit #(19) u3_0(temp3[0],temp3[1],temp_sum,temp4[0],temp4[1]);
    
    wire [19:0] sum_wo_carry;
    wire carry;
    carry_look_ahead_20bit cla0(temp4[0],temp4[1],1'b0,sum_wo_carry,carry);
    
   assign sum = {carry, sum_wo_carry};
endmodule


//parameterized csa module to add 3 N bit numbers
module csa3_N_bit
    #(parameter N = 16)
    (
        input [N-1:0] a,
        input [N-1:0] b,
        input [N-1:0] cin,
        output [N:0] cout,
        output [N:0] s
    );
    genvar i;
    generate
    for (i = 0; i < N; i = i + 1) begin: my_block
        assign s[i] = a[i]^b[i]^cin[i];
        assign cout[i+1] = (a[i]&b[i])|(a[i]&cin[i])|(b[i]&cin[i]);
        //csa csa_name(a[i],b[i],cin[i],s[i],cout[i+1]);
    end    
    endgenerate
    assign cout[0] = 0;
    assign s[N] = 0;
endmodule

module csa(
    input a,
    input b,
    input cin,
    output sum,
    output cout);
    assign sum = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule

///////////////////////////////////////////////////////////
//16-bit Carry Look Ahead Adder 
///////////////////////////////////////////////////////////
 
module carry_look_ahead_20bit(a,b, cin, sum,cout);
    input [19:0] a,b;
    input cin;
    output [19:0] sum;
    output cout;
    wire c1,c2,c3,c4;
     
    carry_look_ahead_4bit cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    carry_look_ahead_4bit cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    carry_look_ahead_4bit cla3(.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
    carry_look_ahead_4bit cla4(.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(c4));
    carry_look_ahead_4bit cla5(.a(a[19:16]), .b(b[19:16]), .cin(c4), .sum(sum[19:16]), .cout(cout));
     
endmodule
 
////////////////////////////////////////////////////////
//4-bit Carry Look Ahead Adder 
////////////////////////////////////////////////////////
 
module carry_look_ahead_4bit(a,b, cin, sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
 
wire [3:0] p,g,c;
     
    assign p=a^b;//propagate
    assign g=a&b; //generate
     
    assign c[0]=cin;
    assign c[1]= g[0]|(p[0]&c[0]);
    assign c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
    assign c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
    assign cout= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&p[0]&c[0];
    assign sum=p^c;
     
endmodule
