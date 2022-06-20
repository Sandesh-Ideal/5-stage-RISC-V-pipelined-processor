`timescale 1ns / 1ps

module ALU(
	input [31:0] a,
	input [31:0] b,
	input [3:0] Control,
	output reg [31:0] out,
	output zero_flag
    );

always@(*)
begin
case(Control)
4'b0000:
out = a & b;
4'b0001:
out = a | b;
4'b0010:
out = a + b;
4'b0011:
out = a - b;
4'b0100:
out = a << b[4:0];
4'b0101:
out = a >> b[4:0];
4'b0110:
out = a >>> b[4:0];
4'b0111:
out = a ^ b;
4'b1000:
out = ($signed(a) < $signed(b));
4'b1001:
out = (a < b);
4'b1111:
out = b;
default:
out = 0;
endcase
end

assign zero_flag = (out == 0)? 1'b1 : 1'b0;

endmodule
