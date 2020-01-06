module Alu_Control(AluOp ,Funct7 ,Funct3 ,AluCout);

input [1:0] AluOp;
input [6:0] Funct7;
input [2:0] Funct3;
output reg AluCout;
wire [5:0] AluCinput;

assign AluCinput = {AluOp,Funct7,Funct3};

always@(AluCinput)

 casex(AluCinput)
   
   12'b00xxxxxxxxxx: AluCout=4'b0010;
   12'bx1xxxxxxxxxx: AluCout=4'b0110;
   12'b1x0000000000: AluCout=4'b0010;
   12'b1x0100000000: AluCout=4'b0110;
   12'b1x0000000111: AluCout=4'b0000;
   12'b1x0000000110: AluCout=4'b0001;
   
   default: AluCout=4'b0000;
   
  endcase
 
endmodule
   
   