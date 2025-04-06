module tb_counter(); 
reg clk, reset;
wire [3:0] counter; 
counter C1 ( clk, reset, counter );
initial
begin 
clk=0; forever 
#5 clk=~clk; 
End
initial begin 
reset=1; #20; reset=0; 
end 
endmodule