module Four_Bit_ALU_tb();
reg [3:0] alu_in1,alu_in2;
reg [2:0] alu_op;
wire [3:0]alu_out;
Four_Bit_ALU DUT (.alu_in1(alu_in1),
.alu_in2(alu_in2),.alu_op(alu_op),
.alu_out(alu_out));
initial
begin
alu_op =3'b000;alu_in1=3'b0011; 
alu_in2=3'b0001;
#10;
alu_op =3'b001;alu_in1=3'b0011;
alu_in2=3'b0001;
#10;
alu_op =3'b010;alu_in1=3'b0011; 
alu_in2=3'b0001;
#10;
alu_op =3'b011;alu_in1=3'b0011; 
alu_in2=3'b0001;
#10;
end
endmodule