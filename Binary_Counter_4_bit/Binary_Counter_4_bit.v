module top([3:0]out,inputclk,inputrst );
wire clktoclk; 
clk_dicidor cd1(.clk_in(clk),.clk_out(clktoclk));
counter c1 (.counter(out),.clk(clktoclk),.reset(rst)); 
endmodule
//counter
module counter(input clk, reset, output[3:0] counter ); 
reg [3:0] counter_up;
// up counter 
always @(posedge clk or posedge reset)
begin
if(reset)
counter_up<= 4'd0; 
else counter_up<= counter_up + 4'd1;
end
 assign counter = counter_up;
endmodule
//clock divider
module clk_dicidor( clk_in, clk_out); 
input clk_in; 
output clk_out; 
reg clk_out; 
reg [27:0]counter = 28'd0; 
parameter divisor = 28'd100000000; 
always@(posedgeclk_in) begin 
counter <=counter +28'd1; 
if (counter >=(divisor-1)) 
counter <=28'd0; 
clk_out<=(counter<divisor/2)?1'b1:1'b0; 
end 
endmodule