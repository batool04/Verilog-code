module MUX(output [1:0] Mux_Out,input 
[1:0] Mux_In1,input [1:0] Mux_In2, input 
Mux_Sel );
assign Mux_Out = (Mux_Sel)? Mux_In1: 
Mux_In2; 
endmodule