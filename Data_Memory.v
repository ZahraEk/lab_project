module Data_Memory(clk, Addres, WriteData, ReadData, MemRead, MemWrite);

input clk;  
input [63:0] Addres , WriteData;
input MemRead, MemWrite;
output reg [63:0] ReadData;
reg [63:0] Memory[0:255];

always @(posedge clk)
 begin
   
if(MemWrite == 1'b1)
  begin
    Memory[Addres] <= WriteData;
  end
  
  if (MemRead == 1'b1)
    begin 
      ReadData <= Memory[Addres];
    end
    
  end
  
endmodule
  
  

