// Code your design here
module div_3(t,clk,rst);
  input clk,rst;
  output reg t;
  reg [3:0] count1,count2;
  always@(posedge clk)
    if (rst || count1==4'b1000)
      begin
      t <= 0;
      count1 <=0 ; 
      end
    else
      count1 <= #1 count1 + 1;
  always@(negedge clk)
    if (rst || count2==4'b1000)
      begin
      count2 <=0 ; 
      end
    else
       count2 <= #1 count2 + 1;
       always@(posedge clk )
          if (count1 ==3'b000 || count1==3'b011 || count1==3'b110)
             t = ~t;
       always@(negedge clk )
          if (count2 == 3'b001 || count2==3'b100 || count2==3'b111 )
            t = ~t;         
endmodule
    