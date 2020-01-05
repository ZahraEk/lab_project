module Pc( clk , DataIns , PcOutput , Reset ,Write);
  
input clk , Reset,Write;
input [63:0] DataIns;
output  reg [63:0]  PcOutput;

always @(posedge clk)

begin
    if(Reset)
        PcOutput = 0 ;
        
    else
       if (Write)
         PcOutput = DataIns ;
          
end

endmodule