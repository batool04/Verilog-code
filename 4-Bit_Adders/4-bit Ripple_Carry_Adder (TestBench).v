module tb( ); 
reg [3:0] X, Y;
// Two 4-bit inputs wire [3:0] S; 
wire Co; 
RCA RC1 ( X, Y, S, Co); 
initial 
begin 
X = 4'b 0001 ; 
Y = 1'b 1010;
#5 X = 4'b 0101 ;
Y = 1'b 1110;
end endmodule