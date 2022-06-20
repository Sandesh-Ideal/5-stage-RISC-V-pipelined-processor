`timescale 1ns / 1ps

module Control_Unit(
	input reset,
	input [6:0] opcode,
	output reg [1:0] ALUop,
	output reg regWrite,
	output reg memRead,
	output reg memWrite,
	output reg memToReg,
	output reg [1:0] immSel,
	output reg ALUsrc,
	output reg branch
    );

always@(reset,opcode)
begin
if(reset == 0)
begin
ALUop = 2'b00;
regWrite = 1'b0;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
immSel = 2'b00;
ALUsrc = 1'b0;
branch = 1'b0;
end
else
begin
casex(opcode)
7'b0110011: //R
begin
ALUop = 2'b10;
regWrite = 1'b1;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
immSel = 2'bxx;
ALUsrc = 1'b0;
branch = 1'b0;
end
7'b0010011: //I
begin
ALUop = 2'b10;
regWrite = 1'b1;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
immSel = 2'b00;
ALUsrc = 1'b1;
branch = 1'b0;
end
7'b0100011: //S
begin
ALUop = 2'b00;
regWrite = 1'b0;
memRead = 1'b0;
memWrite = 1'b1;
memToReg = 1'bx;
immSel = 2'b01;
ALUsrc = 1'b1;
branch = 1'b0;
end
7'b0000011: //load
begin
ALUop = 2'b00;
regWrite = 1'b1;
memRead = 1'b1;
memWrite = 1'b0;
memToReg = 1'b1;
immSel = 2'b00;
ALUsrc = 1'b1;
branch = 1'b0;
end
7'b1100011: //B
begin
ALUop = 2'bxx;
regWrite = 1'b0;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'bx;
immSel = 2'b10;
ALUsrc = 1'b0;
branch = 1'b1;
end
7'b1101111: //jal
begin
ALUop = 2'b11;
regWrite = 1'b1;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
end
7'b1100111: //jalr
begin
ALUop = 2'b11;
regWrite = 1'b1;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
end
7'b0110111: //lui
begin
ALUop = 2'b01;
memRead = 1'b0;
memWrite = 1'b0;
memToReg = 1'b0;
immSel = 2'b11;
ALUsrc = 1'b1;
branch = 1'b0;
end
endcase
end
end
endmodule
