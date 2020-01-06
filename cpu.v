module Cpu();
  
wire clk,r,zero,regWrite,PcOut,adderPcOut,SumOut,branch,memRead,memWrite,memtoReg,reset,write;
wire [63:0] Rd1,Rd2,result,ahiftOut,immGenOut,adderPcinput,datains,readData,MultiplexerOut,Read2;
wire [31:0] insMemOut;
wire [1:0] aluop;
wire [3:0] aluCout;

assign adderPcinput = 4;

ALU alu(.clk(clk), .ReadData1(Rd1), .ReadData2(ReadD2), .AluCout(aluCout), .Result(result), .Zero(zero));
  
Register_Bank registerbank(.clk(clk), .Instruction(insMemOut), .RegWrite(regWrite), .ReadData1(Rd1), .ReadData2(Rd2) , .MemToRegMuxOutput(MultiplexerOut));

Clock clock(.clk(clk));

Add adderPc(.clk(clk), .x(PcOut), .y(adderPcinput), .z(adderPcOut));

Add adderMux(.clk(clk), .x(PcOut), .y(shiftOut), .z(SumOut));

Shift_Left shiftleft(.clk(clk), .ImmGenOutput(immGenOut), .ShiftOutput(shiftOut));

Alu_Control alucontrol(.clk(clk), .AluOp(aluop),  .AluCout(aluCout), .Funct7(insMemOut[31:25]), .Funct3(insMemOut[14:12]));

Controler controler(.clk(clk), .Zero(zero), .Instruction(insMemOut), .Branch(branch), .MemRead(memRead) ,.MemtoReg(memtoReg), .AluOp(aluop), .MemWrite(memWrite), .AluSrc(aluSrc), .RegWrite(regWrite));

Pc pc(.clk(clk), .DataIns(datains), .PcOutput(pcOutput), .Write(write), .Reset(reset));

InstructionMem instructionMem(.clk(clk), .ReadAdress(pcOutput), .InsMemOut(insMemOut));

ImmGen immGen(.clk(clk) , .Instruction(insMemOut) , .ImmGenOutput(immGenOut));

Data_Memory datamemory(.clk(clk) , .Adress(result) , .WriteData(Rd2) , .ReadData(readData) , .MemRead(memRead) , .MemWrite(memWrite));

Multiplexer multiplexer1(.clk(clk) , .a(adderPcOut), .b(SumOut), .c(datains), .Choser(branch));

Multiplexer multiplexer2(.clk(clk) ,.a(readData),.b(result),.c(MultiplexerOut) , .Choser(memtoReg));

Multiplexer multiplexer3 (.clk(clk) , .a(Rd2) , .b(immGenOut) , .c(Read2) , .Choser(aluSrc));

endmodule