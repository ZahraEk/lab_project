module Controler(Instruction ,Branch ,MemRead ,MemtoReg ,AluOp ,MemWrite ,AluSrc ,RegWrite ,clk ,Zero);
  
input [31:0] Instruction;
input clk;
output reg [1:0] AluOp;
output reg Branch, MemRead, MemtoReg, MemWrite, AluSrc, RegWrite, Zero;
wire [6:0] I; 

assign I = Instruction[6:0];

always@(posedge clk)
 
 casex(I)
   
   7'b011001100100010:
   begin
     AluSrc=0;
     MemtoReg=0;
     RegWrite=1;
     MemRead=0;
     MemWrite=0;
     Branch=0 & Zero;
     AluOp=2'b10;
   end
   
   7'b0000011:
   begin
     AluSrc=1;
     MemtoReg=1;
     RegWrite=1;
     MemRead=1;
     MemWrite=0;
     Branch=0 & Zero;
     AluOp=2'b00;
   end
   
   7'b0100011:
   begin
     AluSrc=1;
     MemtoReg=1'bx;
     RegWrite=0;
     MemRead=0;
     MemWrite=1;
     Branch=0 & Zero;
     AluOp=2'b00;
   end
   
   7'b1100011:
   begin
     AluSrc=0;
     MemtoReg=1'bx;
     RegWrite=0;
     MemRead=0;
     MemWrite=0;
     Branch=1 & Zero;
     AluOp=2'b01;
   end
   
 endcase
 
 endmodule
   
   
   
   
   
     
     
 
  