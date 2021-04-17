// Code your design here
module seq_detector(out,x,clk,rst);
  input x,clk,rst;
  output reg out;
  reg [2:0] PS,NS;
  parameter s0=3'b000 , s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  always@(posedge clk)
    if (rst)
      PS <= s0;
    else
      PS <= NS;
  always@(PS,x)
    case(PS)
      s0 :
        begin
          NS  <= x ? s1 : s0;
          out <= x ? 0  : 0 ;
        end 
      s1 :
        begin
          NS  <= x ? s2 : s0;
          out <= x ? 0  : 0 ;
        end 
      s2 :
        begin
          NS  <= x ? s2 : s3;
          out <= x ? 0  : 0 ;
        end 
      s3 :
        begin
          NS  <= x ? s4 : s0;
          out <= x ? 0  : 0 ;
        end 
      s4 :
        begin
          NS  <= x ? s2 : s0;
          out <= x ? 1 : 0 ;
        end 
      default:
        begin
          NS  <= x ? s0 : s0;
          out <= x ? 0  : 0 ;
        end 
    endcase
endmodule