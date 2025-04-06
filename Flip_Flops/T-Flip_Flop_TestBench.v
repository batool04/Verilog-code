module TB( 
); reg clk, 
reset; wire q; 
 TFF f1(.reset(reset),.clk(clk),.q(q)); 
initial begin 
reset=1'b1; 
clk=1'b0; #5 
reset=1'b0; 
#30 $finish; 
end 
always #1 clk=~clk; 
endmodule