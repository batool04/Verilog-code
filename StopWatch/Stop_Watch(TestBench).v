module Stop_Watch_tb ; 
wire [3:0] reg_d3 ; 
 reg clock ; 
wire [3:0] reg_d0;
wire [3:0] reg_d1; 
 reg start ; 
wire [3:0] reg_d2; 
reg reset ; 
Stop_Watch 
 DUT ( 
 .reg_d3 (reg_d3 ) , 
 .clock (clock ) , 
 .reg_d0 (reg_d0 ) , 
 .reg_d1 (reg_d1 ) , 
 .start (start ) , 
 .reg_d2 (reg_d2 ) , 
 .reset (reset ) ); 
initial 
begin clock = 
0; 
forever 
#50 
clock = ~clock; 
end 
initial 
begin 
// Initialize 
Inputs 
reset = 0; 
start = 0; 
// Wait 100 ns for global reset to finish 
 #100; 
reset = 1; 
#100; 
reset = 0; 
#100; 
start 
=1; 
end 
endmodule