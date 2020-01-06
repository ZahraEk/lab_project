module Shift_Left(ImmGenOutput, ShiftOutput, clk);
  
input clk;
input [63:0] ImmGenOutput;
output reg [63:0] ShiftOutput;

always@(posedge clk)

 ShiftOutput = ImmGenOutput >>1;

endmodule