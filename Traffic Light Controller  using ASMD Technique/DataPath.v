module Datapath(output 
[1:0]DP_South,output [1:0]DP_North, 
output [1:0]DP_East, 
output [1:0]DP_West,input DP_CLK, 
input DP_Rst, input CU_North, input 
CU_South,output [3:0]flag_out, input 
CU_East, input CU_West);
wire [1:0] Green;
wire [1:0] Red;
assign Green=2'b01;
assign Red=2'b10;
wire CU_CFlag;
Counter C1(.Count_Flag(CU_CFlag), 
.Count_Clk(DP_CLK), 
.Count_Rst(DP_Rst)); 
MUX 
M_East(.Mux_Out(DP_East),.Mux_In1
(Red),.Mux_In2(Green), 
.Mux_Sel(CU_East) ); 
MUX 
M_West(.Mux_Out(DP_West),.Mux_In1
(Red),.Mux_In2(Green), 
.Mux_Sel(CU_West) ); 
MUX 
M_South(.Mux_Out(DP_South),.Mux_In
1(Red),.Mux_In2(Green), 
.Mux_Sel(CU_South) ); 
MUX 
M_North(.Mux_Out(DP_North),.Mux_In
1(Red),.Mux_In2(Green), 
.Mux_Sel(CU_North) ); 
Flag( .flag_in(CU_CFlag),
.flag_out(flag_out) );
endmodule