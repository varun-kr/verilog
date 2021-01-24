 module pipe_rca_4bit (Cout, Sum, A, B, Cin, clk);
  input [3:0] A,B;
  input Cin,clk;
  output reg [3:0] Sum;
  output reg Cout;
  reg S0,c0,S1,c1,S2,c2,S01,S02,S12,A2,B2;
  reg [2:0] A0,B0;
  reg [1:0] A1,B1;
  always@(posedge clk)
    begin
      S0 <= A[0]^B[0]^Cin;
      c0 <= A[0]*B[0] | B[0]*Cin | Cin*A[0];
      A0 <= A[3:1];
      B0 <= B[3:1];
    end
  always@(posedge clk)
    begin
      S1 <= A0[0]^B0[0]^c0;
      c1 <= A0[0]*B0[0] | B0[0]*c0 | c0*A0[0];
      A1 <= A0[2:1];
      B1 <= B0[2:1];
      S01 <= S0;
     end
  always@(posedge clk)
    begin
      S2 <= A1[0]^B[0]^c1;
      c2 <= A1[0]*B1[0] | B1[0]*c1 | c1*A1[0];
      A2 <= A1[1];
      B2 <= B1[1];
      S02 <= S01;
      S12 <= S1;
    end      
   always@(posedge clk)
    begin
      Sum[3] <= A2^B2^c2;
      Cout <= A2*B2 | B2*c2 | c2*A1;
      Sum[2] <= S2;
      Sum[1] <= S12;
      Sum[0] <= S02;
    end 
endmodule  
   
  