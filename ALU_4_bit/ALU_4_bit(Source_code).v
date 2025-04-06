module alu_4_bit(alu_out, alu_op,
alu_in1,alu_in2);
input[3:0]alu_in1;
input[3:0]alu_in2;
input[2:0]alu_op;
output reg[3:0]alu_out;
always@(alu_in1 or alu_in2 or alu_op)
begin
 case(alu_op)
 3'b000: alu_out <= alu_in1+alu_in2;
 3'b001: alu_out <= ~alu_in2;
 3'b010: alu_out <= alu_in1&alu_in2;
 3'b011: alu_out <= alu_in1|alu_in2;
 3'b100: alu_out <= alu_in1>>>alu_in2;
 3'b101: alu_out <= alu_in1<<<alu_in2;
 3'b110: alu_out <= alu_in1==alu_in2;
 3'b111: alu_out <= alu_in1!=alu_in2;
 default: alu_out <=0;
 endcase
end
endmodule