module ALU(clk ,ReadData1 , ReadData2, AluCout,Result, Zero);
  
input clk;
input [63:0] ReadData1,ReadData2;
wire [63:0] Rd1,Rd2;
input [3:0] AluCout;
output reg [63:0] Result;
output reg Zero;
 
assign Rd1 = ReadData1;
assign Rd2 = ReadData2;
 
 
always @(posedge clk)
 begin
  case (AluCout)
    
   4'b0000: Result = Rd1 & Rd2;
         
   4'b0001: Result = Rd1 | Rd2;
        
   4'b0010: Result = Rd1 + Rd2;
        
   4'b0110: Result = Rd1 - Rd2;
      
  endcase 
      
      if(Result == 0)
        Zero = 1;
      else
        Zero = 0;
    
  end
 
endmodule