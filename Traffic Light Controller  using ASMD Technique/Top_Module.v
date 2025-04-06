module Top_Module(output 
[1:0]TLC_South,output 
[1:0]TLC_North, output 
[1:0]TLC_East, 
output [1:0]TLC_West, input 
TLC_RST,input TLC_CLK,
output W_D0C0_CFlag);
//wires for control signals(From CU 
to DP)
input W_C0D0_North, 
W_C0D0_South, W_C0D0_West, 
W_C0D0_East;
wire clk2clk;
Clock_divider 
cd1(.clock_in(TLC_CLK),.clock_ou
t(clk2clk));
Datapath 
D0(.DP_South(TLC_South),.DP_Nor
th(TLC_North),.DP_East(TLC_East), 
.DP_West(TLC_West),.DP_CLK(clk
2clk), .DP_Rst(), 
.CU_North(W_C0D0_North), 
.CU_South(W_C0D0_South), 
.CU_East(W_C0D0_East), 
.CU_West(W_C0D0_West), 
.flag_out(W_D0C0_CFlag));
endmodule