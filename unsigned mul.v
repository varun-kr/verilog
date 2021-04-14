// Code your design here
module data_path(eqz,ld_a,ld_b,ld_p,clr,decb,data_in,clk);
input [15:0] data_in;
input ld_a,ld_b,ld_p,clr,decb,clk;
output eqz;
wire [15:0] X,Y,Z,Bout;
PIPOA P1(X,data_in,ld_a,clk);
PIPOP P2(Y,Z,ld_p,clr,clk);
ADD A(Z,X,Y);
COUNTER CNT(Bout,data_in,ld_b,decb,clk);
COMP CMP(eqz,Bout);
endmodule
module PIPOA(X,data_in,ld_a,clk);
input [15:0] data_in;
input ld_a,clk;
output reg [15:0] X;
always@(posedge clk)
if (ld_a)
X <= data_in;
endmodule
module PIPOP(Y,Z,ld_p,clr,clk);
input [15:0] Z;
input ld_p,clr,clk;
output reg [15:0] Y;
always@(posedge clk)
if (clr)
Y <= 0;
else if(ld_p)
Y <= Z;
endmodule
module ADD(Z,X,Y);
input [15:0] X,Y;
output reg [15:0] Z;
always@(*)
Z <= X+Y ;
endmodule
module COUNTER(Bout,data_in,ld_b,decb,clk);
input [15:0] data_in;
input ld_b,decb,clk;
output reg [15:0] Bout;
always@(posedge clk) 
  if (ld_b)
Bout <= data_in;
else if(decb)
Bout <= Bout - 1;
endmodule
module COMP(eqz,Bout);
input [15:0] Bout;
output eqz;
assign eqz = (Bout==0);
endmodule
module controller(done,ld_a,ld_b,ld_p,decb,clr,clk,start,eqz);
input clk,start,eqz;
output reg ld_a,ld_b,ld_p,decb,clr,done;
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
always@(posedge clk)
case(state)
s0: if(start)
    state <= s1;
s1: state <= s2;
s2: state <= s3;
s3: #2 if(eqz)
    state <= s4;
	 else 
	 state <= s3;
s4: state<= s4;  
default : state<=s0;
endcase
always@(state)
case(state)
s0:begin  ld_a=0; ld_b=0;ld_p=0;clr=0;decb=0; end
s1:begin  ld_a=1; end
s2:begin  ld_a=0; ld_b=1;ld_p=1;clr=1; end	
s3:begin  ld_b=0; clr=0;decb=1; end
s4:begin  ld_b=0; ld_p=0;decb=0;done=1;end 
default: begin  ld_a=0; ld_b=0;ld_p=0;clr=0;decb=0; end
 endcase
 endmodule

