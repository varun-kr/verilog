module johnson(count,rst,ld,clk);
  input rst,ld,clk;
  output reg [3:0] count=0;
 
  always@(posedge clk)
    if(rst)
      count <= 0;
 else if (ld)
   count <= count + 0;
  else 
    begin
      count[0] <= count[1];
      count[1] <= count[2];
      count[2] <= count[3];
      count[3] <= ~count[0];
    end
endmodule
