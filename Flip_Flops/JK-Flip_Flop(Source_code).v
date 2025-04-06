module JK(j,k,clk,reset,q,q_bar); 
input j,k,clk,reset; 
output q,q_bar; 
wire j,k,clk,reset; 
reg q,q_bar; 
always @(posedge clk) begin 
if(reset) begin 
q=1'b0; 
q_bar=1'b1; 
end else begin 
case({j,k}) 
{1'b0,1'b0}: begin q=q;q_bar=q_bar; end 
{1'b0,1'b1}: begin q=1'b0;q_bar=1'b1; end 
{1'b1,1'b0}: begin q=1'b1;q_bar=1'b0; end 
{1'b1,1'b1}: begin q=~q; q_bar=~q_bar; end 
endcase 
end 
end 
endmodule





module top(output q,output q_bar,input k, input 
reset,input j,input clock_in);
wire clktoclk; 
clockdivider 
CD1(.clock_in(clock_in),.clock_out(clock_out)); 
JK J1 
(.j(j),.k(k),.clk(clock_out),.reset(reset),.q(q),.q_bar(q_bar));
endmodule






module clockdivider( 
clock_in,clock_out ); 
input clock_in; 
output reg clock_out; 
reg [27:0] counter = 28'd0; parameter 
DIVISOR =28'd100000000; 
always @(posedge 
clock_in) begin counter 
<=counter + 28'd1; 
if(counter >= (DIVISOR-
1)) 
counter <= 28'd0; 
clock_out <= (counter 
<DIVISOR/2)?1'b1:1'b0; end endmodule