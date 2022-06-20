`timescale 1ns / 1ps

module MUX3(
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [1:0] ctrl,
	output reg [31:0] out
    );

always@(*)
begin
if(ctrl == 2'b00)
out = a;
else if(ctrl == 2'b01)
out = b;
else
out = c;
end
endmodule
