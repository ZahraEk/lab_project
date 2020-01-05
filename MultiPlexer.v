module MultiPlexer(a, b, c, choser , clk );
  
input [63:0] a, b;
input choser,clk;
output reg [63:0] c;

always

begin 
  
  if(choser)
     
     assign c = a;
     
   else
     
     assign c = b;
     
   end
   
 endmodule
    
  
  
  
  
  