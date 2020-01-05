module ImmGen(Instruction, ImmGenOutput , clk);
  
input clk ; 
input [31:0]Instruction;
output reg [63:0] ImmGenOutput; 

always @(posedge clk)

case(Instruction [6:0])
  
  7'b0000011 : ImmGenOutput = {52'b0,Instruction[31:20]};
  7'b0100011 : ImmGenOutput = {52'b0,Instruction[31:25],Instruction[11:7]};
  7'b1100011 : ImmGenOutput = {52'b0,Instruction[12],Instruction[7],Instruction[30:25],Instruction[11:8]};
  7'b1101111 : ImmGenOutput = {44'b0,Instruction[31],Instruction[20:12],Instruction[21],Instruction[30:22]};
  
  default : ImmGenOutput = 64'b0;
  
endcase

endmodule