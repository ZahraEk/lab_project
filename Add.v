module Add(x, y, z, clk);
  
input clk, x, y;
output reg z;

always@(posedge clk)

 z = x + y;
 
endmodule