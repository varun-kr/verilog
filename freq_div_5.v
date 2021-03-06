// Code your design here
module div_5(t,clk,rst);
  input clk,rst;
  output reg t;
  reg [3:0] count1,count2;
  always@(posedge clk)
    if (rst || count1==4'b1110)
      begin
      t <= 0;
      count1 <=0 ; 
      end
    else
      count1 <=  count1 + 1;
  always@(negedge clk)
    if (rst || count2==4'b1110)
      count2 <=0 ; 
    else
       count2 <=  count2 + 1;
       always@(posedge clk )
        if (count1 ==4'b0000 || count1==4'b0101 || count1==4'b1010)
             t = ~t;
       always@(negedge clk )
       if (count2 == 4'b0010 || count2==4'b0111 || count2==4'b1100 )
            t = ~t;         
endmodule
  
  