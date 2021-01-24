module odd(clk,count,data);
  input [31:0] data;
  input clk;
  output reg [4:0] count=0;
  integer i=16;
   always@(posedge clk)
    if (data[(2*i)-1])
      begin
        count <= count+1;
        i <=i-1;
      end
  else 
   i <= i-1;
endmodule