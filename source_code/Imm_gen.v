`timescale 1ns / 1ps

module Imm_gen(
	input [31:0] code,
	input [1:0] immSel,
	output reg [31:0] imm_data
    );

always@(code,immSel)
begin
case(immSel)
2'b00: imm_data = {{20{code[31]}},code[31:20]};
2'b01: imm_data = {{20{code[31]}},code[31:25],code[11:7]};
2'b10: imm_data = {{21{code[31]}},code[7],code[30:25],code[11:8]};
2'b11: imm_data = {code[31:12],{12{1'b0}}};
endcase
end
endmodule
