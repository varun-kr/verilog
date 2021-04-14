// Code your design here
module gcd(lt,gt,eq,lda,ldb,sel1,sel2,sel3,data_in,clk);
input [15:0] data_in;
input lda,ldb,sel1,sel2,sel3,clk;
output lt,gt,eq;
wire [15:0] A,B,X,Y,subout,bus;  
PIPOA PA(A,bus,lda,clk); 
PIPOB PB(B,bus,ldb,clk);
cmp c(lt,gt,eq,A,B);
sub s(subout,X,Y); 
mux m1(bus,data_in,subout,sel1);
mux m2(X,A,B,sel2); 
  mux m3(Y,A,B,sel3);  
endmodule  
module PIPOA(A,bus,lda,clk);
  input [15:0] bus;
  input lda,clk;
  output reg [15:0] A;
  always@(posedge clk)
    if (lda)
      A <= bus;
endmodule
module PIPOB(B,bus,ldb,clk);
  input [15:0] bus;
  input ldb,clk;
  output reg [15:0] B;
  always@(posedge clk)
    if (ldb)
      B <= bus;
endmodule
module cmp(lt,gt,eq,A,B);
  input [15:0] A,B;
  output lt,gt,eq;
  assign lt = (A<B);
  assign gt = (A>B);
  assign eq = (A==B);
endmodule
module sub(subout,X,Y);
  input [15:0] X,Y;
  output reg [15:0] subout;
  always@(*)
    subout = X-Y;
endmodule
module mux(out,in1,in2,sel);
  input [15:0] in1,in2;
  input sel;
  output [15:0] out;
  assign out = sel  ? in1  : in2;
endmodule
module controller(done,clk,lt,gt,eq,sel1,sel2,sel3,lda,ldb,start);
  input clk,lt,gt,eq,start;
  output reg sel1,sel2,sel3,lda,ldb,done;
  reg [2:0] state;
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
  always@(posedge clk)
    case(state)
      s0: if(start) state <= s1;
      s1: state <= s2;
      s2: begin 
          #1 if (lt)
          state <= s3;
        else if(gt)
          state <= s4;
        else if(eq)
          state <=s5;
         end
     s3:begin
        #1 if(gt)
         state <= s4;
        else if(lt)
         state <= s3;
        else if(eq)
          state <= s5;
        end
      s4:begin
        #1 if(gt)
        state <= s4;
        else if(lt)
        state <= s3;
        else if(eq)
        state <= s5;
        end
      s5:state <= s5;
      default:state <= s0;
   endcase
 always@(state)
    case(state)
      s0:
        begin
          done=0;
          lda=1;
          ldb=0;
          sel1=1;
        end
      s1:
        begin
        sel1=1;
        lda=0;
        ldb=1;  
        end
      s2:
        begin
          if(eq)
            done=1;
          else if(lt)
            begin
        	sel1=0;
       	 	sel2=0;
        	sel3=1;
        	ldb=1;
        	lda=0;  
        	end
          else if(gt)
             begin
       		 sel1=0;
       	 	sel2=1;
        	sel3=0;
        	lda=1;
        	ldb=0;  
        	end
        end  
         s3:
        begin
          if(eq)
            done=1;
          else if(lt)
            begin
        	sel1=0;
       	 	sel2=0;
        	sel3=1;
        	ldb=1;
        	lda=0;  
        	end
          else if(gt)
             begin
       		 sel1=0;
       	 	sel2=1;
        	sel3=0;
        	lda=1;
        	ldb=0;  
        	end
        end  
      s4:
        begin
          if(eq)
            done=1;
          else if(lt)
            begin
        	sel1=0;
       	 	sel2=0;
        	sel3=1;
        	ldb=1;
        	lda=0;  
        	end
          else if(gt)
             begin
       		 sel1=0;
       	 	sel2=1;
        	sel3=0;
        	lda=1;
        	ldb=0;  
        	end
        end  
      s5:begin
        done=1;
        lda=0;
        ldb=0;
      end
      default:
          begin
          done=0;
          lda=0;
          ldb=0;
        end
    endcase
endmodule