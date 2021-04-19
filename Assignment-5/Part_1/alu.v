//////////////////////////////////////////////////////////////////////////////////
//Assignment Number: 5
//Problem Number: 1
//Semester: 5
//Group Number: G39
//Group Member 1: Aayush Prasad 18CS30002
//Group Member 2: Rajdeep Das 18CS30034
//Module Name: alu
//////////////////////////////////////////////////////////////////////////////////

//Full Adder Module
module add(input a, input b,input cin, output cout, output s,output p,output g);
    assign s=a^b^cin;
    assign cout=(a&b)+(cin&(a^b));
    assign p = a^b;
    assign g = a&b;
endmodule

//Carry Look Ahead Module
module carryLookAhead(
    input c0,
    input p0,input g0,
    input p1,input g1,
    input p2,input g2,
    input p3,input g3,
    output [4:0]carry,
    output pg,output gg
);
    assign carry[0]=c0;
    assign carry[1]=g0|(p0&c0);
    assign carry[2]=g1|(p1&g0)|(p1&p0&c0);
    assign carry[3]=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&c0);
    assign carry[4]=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&c0);
    assign pg=p0&p1&p2&p3;
    assign gg=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0);

endmodule

//Carry Look Ahead 4-bit Adder Module
module carryLookAhead4bit(input [3:0]a,input [3:0]b,input cin,output [3:0]sum,output pg,output gg,output c4);
    wire [3:0] p;   //storing the p's
    wire [3:0] g;   //storing the g's
    wire [4:0] carry; //generate the carry's
    wire temp;  
    assign temp = 0 ; //dump value to operate the addition function
    genvar i;
    //copying full adder circuit 4 times
    generate
        for(i=0;i<4;i=i+1)
        begin
            add fa(a[i],b[i],carry[i],temp,sum[i],p[i],g[i]);
        end
    endgenerate
    
    //connecting with the CARRY LOOK AHEAD UNIT

    carryLookAhead unit(
        cin,
        p[0],g[0],
        p[1],g[1],
        p[2],g[2],
        p[3],g[3],
        carry,
        pg,gg

    );
    assign c4=carry[4];

endmodule

//ALU Module 4-bit
module alu(
		input[3:0]A,B,ALU_Sel,
		input M, cin,
		output Cn4,equality_check,P,G,
  		output [3:0] F
	);
  wire [3:0]ALU_Result;
  reg eq_check;
  assign F = ALU_Result[3:0];
  wire cout;
  assign Cn4 = ~cout;
  assign equality_check = eq_check;
  
  reg [0:0] Cn;
  
  reg [3:0] op1, op2;
  
  carryLookAhead4bit m1(op1,op2,Cn,ALU_Result,P,G,cout);
  
  
  always @( A or B)
    begin
      if(A==B) begin
        eq_check = 1;
      end
      else begin
        eq_check = 0;
      end
    end
  
  always @(*)
    begin
      case(ALU_Sel) 
        4'b0000: 
            begin
              if(M) begin
                op1 = ~A;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = 0;
                Cn = ~cin;

              end
            end
          4'b0001: 
            begin
              if(M) begin
                op1 = (~A)|(~B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A|B;
                op2 = 0;
                Cn = ~cin;

              end
            end
          4'b0010: 
            begin
              if(M) begin
                op1 = (~A)&(B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A|(~B);
                op2 = 0;
                Cn = ~cin;

              end
            end
          4'b0011:
            begin
              if(M)begin
                op1 = 0;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = 4'b1111;
                op2 = 0;
                Cn = ~cin;

              end
            end
          4'b0100: 
            begin
              if(M)begin
                op1 = ~(A & B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = A&(~B);
                Cn = ~cin;

              end
            end
           4'b0101:
            begin
              if(M)begin
                op1 = ~B;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A|B;
                op2 = (A)&(~B);
                Cn = ~cin;

              end
            end
           4'b0110:
            begin
              if(M)begin
                op1 = A^B;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = ~B;
                Cn = ~cin;

              end
            end
           4'b0111:
            begin
              if(M)begin
                op1 = A&(~B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A&B;
                op2 = 4'b1111;
                Cn = ~cin;
              end
             end
            4'b1000:
             begin
              if(M)begin
                op1 = (~A) | B;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A&B;
                op2 = A;
                Cn = ~cin;
              end
             end
            4'b1001:  
              begin
              if(M)begin
                op1 = (~A)^(~B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = B;
                Cn = ~cin;
              end
             end
            4'b1010: 
             begin
              if(M)begin
                op1 = 0;
                op2 = B;
                Cn = 0;
              end
              else begin
                op1 = A | (~B);
                op2 = A&B;
                Cn = ~cin;
              end
             end
            4'b1011: 
             begin
              if(M)begin
                op1 = A&B;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A&B;
                op2 = 4'b1111;
                Cn = ~cin;
              end
             end
            4'b1100:  
             begin
              if(M)begin
                op1 = 0;
                op2 = 1;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = A;
                Cn = ~cin;
              end
             end
            4'b1101:
             begin
              if(M)begin
                op1 = A|(~B);
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A|B;
                op2 = A;
                Cn = ~cin;
              end
             end             
            4'b1110: 
             begin
              if(M)begin
                op1 = A|B;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A|(~B);
                op2 = A;
                Cn = ~cin;
              end
             end
            4'b1111: 
             begin
              if(M)begin
                op1 = A;
                op2 = 0;
                Cn = 0;
              end
              else begin
                op1 = A;
                op2 = 4'b1111;
                Cn = ~cin;
              end
             end
        endcase
    end
      
endmodule