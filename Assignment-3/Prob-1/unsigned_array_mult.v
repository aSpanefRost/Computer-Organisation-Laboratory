`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 3
//Problem Number: 1
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad
//Group Member 2: Rajdeep Das
//////////////////////////////////////////////////////////////////////////////////
//half adder module
module halfadder(sum, carry, a, b);
    input a,b;
    output sum,carry;
    assign sum=a ^ b;
    assign carry=a & b;
endmodule

//full adder module
module fulladder(sum, carry_out, a, b, carry_in);
    input a,b,carry_in;
    output sum,carry_out;
    assign sum=a^ b ^ carry_in;
    assign carry_out=(a & b)|(a & carry_in)|(b & carry_in);
endmodule

//unsigned array multiplier module (combinational)
module unsigned_array_mult (input [5:0] a, input [5:0] b, output [11:0] product);
    wire [35:0] multiply;
    wire [29:0] carry;
    wire [19:0] sum;
    
    //finding a[i]&b[j] for all i,j in {0,1,2,3,4,5}
    and mult00( multiply[0], a[0], b[0] );
    and mult01( multiply[1], a[0], b[1] );
    and mult02( multiply[2], a[0], b[2] );
    and mult03( multiply[3], a[0], b[3] );
    and mult04( multiply[4], a[0], b[4] );
    and mult05( multiply[5], a[0], b[5] );
    and mult06( multiply[6], a[1], b[0] );
    and mult07( multiply[7], a[1], b[1] );
    and mult08( multiply[8], a[1], b[2] );
    and mult09( multiply[9], a[1], b[3] );
    and mult10( multiply[10], a[1], b[4] );
    and mult11( multiply[11], a[1], b[5] );
    and mult12( multiply[12], a[2], b[0] );
    and mult13( multiply[13], a[2], b[1] );
    and mult14( multiply[14], a[2], b[2] );
    and mult15( multiply[15], a[2], b[3] );
    and mult16( multiply[16], a[2], b[4] );
    and mult17( multiply[17], a[2], b[5] );
    and mult18( multiply[18], a[3], b[0] );
    and mult19( multiply[19], a[3], b[1] );
    and mult20( multiply[20], a[3], b[2] );
    and mult21( multiply[21], a[3], b[3] );
    and mult22( multiply[22], a[3], b[4] );
    and mult23( multiply[23], a[3], b[5] );
    and mult24( multiply[24], a[4], b[0] );
    and mult25( multiply[25], a[4], b[1] );
    and mult26( multiply[26], a[4], b[2] );
    and mult27( multiply[27], a[4], b[3] );
    and mult28( multiply[28], a[4], b[4] );
    and mult29( multiply[29], a[4], b[5] );
    and mult30( multiply[30], a[5], b[0] );
    and mult31( multiply[31], a[5], b[1] );
    and mult32( multiply[32], a[5], b[2] );
    and mult33( multiply[33], a[5], b[3] );
    and mult34( multiply[34], a[5], b[4] );
    and mult35( multiply[35], a[5], b[5] );
    
    assign product[0]=multiply[0];
    
    //first layer 
    halfadder h1( product[1], carry[0], multiply[1], multiply[6]);
    fulladder f1( sum[0], carry[1], multiply[7], multiply[12], carry[0]);
    fulladder f2( sum[1], carry[2], multiply[18], multiply[13], carry[1]);
    fulladder f3( sum[2], carry[3], multiply[24], multiply[19], carry[2]);
    fulladder f4( sum[3], carry[4], multiply[30], multiply[25], carry[3]);
    
    //second layer
    halfadder h2( product[2], carry[5], sum[0], multiply[2]);
    fulladder f5( sum[4], carry[6], sum[1], multiply[8], carry[5]);
    fulladder f6( sum[5], carry[7], sum[2], multiply[14], carry[6]);
    fulladder f7( sum[6], carry[8], sum[3], multiply[20], carry[7]);
    fulladder f8( sum[7], carry[9], carry[4], multiply[31], carry[8]);
    
    //third layer
    halfadder h3( product[3], carry[10], sum[4], multiply[3]);
    fulladder f9( sum[8], carry[11], sum[5], multiply[9], carry[10]);
    fulladder f10( sum[9], carry[12], sum[6], multiply[15], carry[11]);
    fulladder f11( sum[10], carry[13], sum[7], multiply[26], carry[12]);
    fulladder f12( sum[11], carry[14], carry[9], multiply[32], carry[13]);
    
    //fourth layer
    halfadder h4( product[4], carry[15], sum[8], multiply[4]);
    fulladder f13( sum[12], carry[16], sum[9], multiply[10], carry[15]);
    fulladder f14( sum[13], carry[17], sum[10], multiply[21], carry[16]);
    fulladder f15( sum[14], carry[18], sum[11], multiply[27], carry[17]);
    fulladder f16( sum[15], carry[19], carry[14], multiply[33], carry[18]);
    
    //fifth layer
    halfadder h5( product[5], carry[20], sum[12], multiply[5]);
    fulladder f17( sum[16], carry[21], sum[13], multiply[16], carry[20]);
    fulladder f18( sum[17], carry[22], sum[14], multiply[22], carry[21]);
    fulladder f19( sum[18], carry[23], sum[15], multiply[28], carry[22]);
    fulladder f20( sum[19], carry[24], carry[19], multiply[34], carry[23]);
    
    //sixth layer
    halfadder h6( product[6], carry[25], sum[16], multiply[11]);
    fulladder f21( product[7], carry[26], sum[17], multiply[17], carry[25]);
    fulladder f22( product[8], carry[27], sum[18], multiply[23], carry[26]);
    fulladder f23( product[9], carry[28], sum[19], multiply[29], carry[27]);
    fulladder f24( product[10], carry[29], carry[24], multiply[35], carry[28]);
    
    //finally assigning final carry to the MSB of product
    assign product[11]=carry[29];
endmodule
