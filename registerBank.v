module Register_Bank (clk, Instruction, MemToRegMuxOutput, RegWrite, ReadData1, ReadData2);
 
 input clk;
 reg [4:0] ReadReg1,ReadReg2,WriteReg;
 reg  [31:0] WriteData;
 input [31:0] Instruction;
 input [31:0] MemToRegMuxOutput;
 input RegWrite;
 reg [31:0] ram [255:0];
 output [31:0] ReadData1,ReadData2;
 
 always@(posedge clk)
  begin
   if(RegWrite)
    begin
      assign WriteData=MemToRegMuxOutput;
    end
   else
    begin
     assign ReadReg1=Instruction[19:15];
     assign ReadReg2=Instruction[24:20];
     assign WriteReg=Instruction[11:7];
    end
  
 end
 
 assign ReadData1=ram[ReadReg1];
 assign ReadData2=ram[ReadReg2];
 
 endmodule