module Clock(clk);
  
output reg clk;

always
begin 
  clk = 0;
  #50 clk = ~clk;
  #50;
end

endmodule