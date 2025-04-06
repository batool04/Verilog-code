module BCD(CLK ,reset ,dout ); 
output [3:0] dout ; 
reg [3:0] dout ; 
input CLK ; 
wire CLK ; input 
reset ; wire 
reset ; initial 
dout = 0 ; 
always @ (posedge (CLK)) 
begin 
 if (reset) dout <= 0; 
else if (dout<=9) begin 
 dout <= dout + 1; 
end 
 else if(dout==9) 
begin dout<=0; 
 end 
 
end endmodule 



module CLOCKDIVIDER(clock_in,clock_out ); 
input clock_in; output reg clock_out; 
reg [27:0] counter = 28'd0; parameter 
DIVISOR =28'd100000000; always 
@(posedge clock_in) begin 
counter <=counter + 28'd1; 
if(counter >= (DIVISOR-1)) counter 
<= 28'd0; 
clock_out <= (counter <DIVISOR/2)?1'b1:1'b0; 
end endmodule 




module TOP(output [3:0] dout, input CLK, input reset ); 
wire clktoclk; 
CLOCKDIVIDER cd1 (.clock_in(CLK),. 
clock_out(clktoclk)); 
BCD c1 (.dout(dout),.CLK(clktoclk),.reset(reset)); 
endmodule 
