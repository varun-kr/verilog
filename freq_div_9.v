// Code your design here
module div_9(t,clk,rst);
  input clk,rst;
  output reg t;
  reg [4:0] count1,count2;
  always@(posedge clk)
    if (rst || count1==5'b11010)
      begin
      t <= 0;
      count1 <=0 ; 
      end
    else
      count1 <=  count1 + 1;
  always@(negedge clk)
    if (rst || count2==5'b11010)
      count2 <=0 ; 
    else
       count2 <=  count2 + 1;
       always@(posedge clk )
      if (count1 ==5'b00000 || count1==5'b01001 || count1==5'b10010)
             t = ~t;
       always@(negedge clk )
    if (count2 == 5'b00100 || count2==5'b01101 || count2==5'b10110 )
            t = ~t;         
endmodule
  