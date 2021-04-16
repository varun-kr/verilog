module freq_div_6_b;
wire  t;
reg clk,rst;
freq_div_6 DUT(t,rst,clk);
initial begin rst = 1; clk=0;
        #7 rst =0 ; end
always #5 clk = ~clk;
initial
begin
$monitor($time , " %b " , DUT.Q);
$dumpfile("freq_divider.vcd");
$dumpvars(0,freq_div_6_b);
//#300 $finish;
end
endmodule