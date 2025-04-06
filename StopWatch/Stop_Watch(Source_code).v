module Stop_Watch
(clock , reset , start , reg_d0, reg_d1, reg_d2, 
reg_d3); 
input clock; 
input reset; 
input start; 
output reg [3:0] reg_d0, reg_d1, reg_d2, reg_d3; 
//reg [3:0] reg_d0, reg_d1, reg_d2, reg_d3; 
//registers that will hold the individual counts reg [22:0] ticker;
//23 bits needed to count up to 5M bits wire click; 
//the mod 5M clock to generate a tick ever 0.1 
second always @ (posedge clock or posedge reset) 
begin 
if(reset) 
ticker <= 
0; 
else if(ticker == 5000000) 
//if it reaches the desired max value reset it 
ticker <= 0; 
else if(start)
//only start if the input is set 
high ticker <= ticker + 1; 
end assign click = ((ticker == 5000000)?1'b1:1'b0); 
//click to be assigned high every 0.1 
second always @ (posedge clock or posedge reset)
begin 
if (reset) 
begin reg_d0 
<= 
0; 
reg_d1 <= 
0; 
reg_d2 <= 
0; 
reg_d3 <= 
0; 
end 
else if (start) //increment at every click 
begin 
 reg_d0 <= reg_d0 + 1; 
 if(reg_d0 == 9) //xxx9 - the 0.1 second digit 
begin //if_1 reg_d0 <= 0; 
if (reg_d1 == 9) //xx99 
begin 
// if_2 reg_d1 <= 0; 
 if (reg_d2 == 5) //x599 - the two digit seconds 
digits 
begin
//if_3 
reg_d2 <= 0; 
 if(reg_d3 == 9) //9599 - The minute 
digit 
 reg_d3 <= 0; 
 else 
 reg_d3 <= reg_d3 
+ 1; 
end 
else
//else_3 
reg_d2 <= reg_d2 + 
1; 
end 
else 
//else_2 
reg_d1 <= reg_d1 + 1; 
end 
// else 
//else_1 
 end
end 
endmodule 





module clock_divider(clock_in,clock_out); 
input clock_in;
// input clock on FPGA output reg clock_out; 
// output clock after dividing the input clock by divisor reg[27:0] 
counter=28'd0;
parameter DIVISOR = 
28'd100000000; 
// The frequency of the output clk_out 
// = The frequency of the input clk_in divided by DIVISOR 
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs 
// You will modify the DIVISOR parameter value to 
28'd50.000.000 
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 
1Hz 
always @(posedge clock_in) 
begin 
counter <= counter + 28'd1; 
if(counter>=(DIVISOR-1)) 
counter <= 28'd0; 
clock_out <= 
(counter<DIVISOR/2)?1'b1:1'b0;
end 
endmodule 






module top(clock , reset , start , reg_d0, reg_d1, reg_d2, 
reg_d3); 
 input clock; 
input reset; 
input start; 
output [3:0] reg_d0, reg_d1, reg_d2, reg_d3; 
wire clk; 
Stop_Watch s1(clk , reset , start , reg_d0, reg_d1, reg_d2, reg_d3); 
clock_divider c1(clock,clk); 
endmodule