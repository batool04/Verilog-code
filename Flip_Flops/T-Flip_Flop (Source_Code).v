module TFF(input reset, input clk, output reg q); 
 always @(posedge clk) 
 if (reset) 
q<=1'b0; else 
q<=~q; 
endmodule 
module top( input clock_in,input reset, 
output q); wire clktoclk; clockdivider 
CD1(.clock_in(clock_in),.clock_out(clock_out)); 
TFLIPFLOP F1(.reset(reset),.clk(clock_out), 
.q(q)); 
Endmodule 
module clockdivider( 
clock_in,clock_out ); 
input clock_in; output 
reg clock_out; 
reg [27:0] counter = 28'd0; parameter 
DIVISOR =28'd100000000; 
always @(posedge 
clock_in) begin counter 
<=counter + 28'd1; 
if(counter >= (DIVISOR-1)) 
counter <= 28'd0; 
clock_out <= (counter 
<DIVISOR/2)?1'b1:1'b0; end endmodule