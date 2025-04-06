module Counter(output reg [3:0] Count_Flag, input 
Count_Clk, input Count_Rst); 
reg [2:0] Count;
always@(posedge Count_Clk or posedge Count_Rst)
if(Count_Rst==1)
 begin
 Count_Flag=1'b0; 
 Count=3'd0;
 end 
else 
 if(Count==3'd4)
 Count_Flag=1'b1; 
 else if(Count==3'd5) 
 begin
 Count_Flag=1'b0; 
 Count=3'd0;
 end
 else
 Count=Count+1; 
endmodule