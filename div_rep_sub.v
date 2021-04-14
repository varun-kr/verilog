module div_datapath (pgtn,loadn,loads,loadp,clear,inc,data_in, clk);
  input [15:0] data_in;
  input clear,loadn,loads,loadp,inc,clk;
  output pgtn;
  wire [15:0] nw,pw,subout,q,bus;
  assign bus = loadn ?  data_in : subout;
  assign ld = loadn | loads  ;
  PIPO A(nw,bus,ld,clk,clear);
  PIPO B(pw,data_in,loadp,clk,clear);
  	CMP C(pgtn,nw,pw);
  	SUB D(subout,nw,pw);
  CNT E(q,clear,inc,clk);
endmodule    
    module PIPO(out,in,ld,clk,clr);
    input [15:0] in;
    input ld,clk,clr;
    output reg [15:0] out;
    always@(posedge clk)
      if (clr)
        out <= 0;
    else if(ld)
        out <= in;
  endmodule
module CNT(q,clr,inc,clk);
  input inc,clk,clr;
  output reg [15:0] q;
  always@(posedge clk)
    if (clr)
      q <= 0;
  else if(inc)
      q <= q + 1;
endmodule
  module CMP(pgtn,in1,in2);
    input [15:0] in1 , in2;
    output pgtn;
    assign pgtn = (in1 < in2);
  endmodule
  module SUB(subout,in1,in2);
    input [15:0] in1,in2;
    output reg [15:0] subout;
    always@(*)
      subout = in1 - in2;
  endmodule
module div_ctrlpath (loadn, loadp, loads,clear, inc, stop, clk, pgtn, start);   
  input pgtn,start,clk;
  output reg loadn,loadp,loads,clear,inc,stop;
  reg [2:0] state;
  parameter s0 =3'b000 ,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  always@(posedge clk)
    case(state)
      s0:if(start)
        state<=s1;
      s1:state<=s2;
      s2:if(pgtn)
         state<=s4;
        else
          state<=s3;
      s3:#2 if(pgtn)
         state<=s4;
        else
          state<=s3;
      s4:state<=s4;
      default:state<=s0;
    endcase
  always@(state)
    case(state)
      s0:begin
        loadn=0;loadp=0;loads=0;clear=1;inc=0;stop=0;
      	end
      s1:begin
        loadn=1;clear=0;
      end
      s2:begin
        loadp=1;loadn=0;
      end
      s3:begin
         inc=1;
         loadp=0;
         loads=1;
         end
       s4:begin
         inc=0;
         loads=0;
         stop=1;
       end
      default:begin
        loadn=0;loadp=0;loads=0;clear=1;inc=0;
      	end
    endcase
endmodule
      
      
    