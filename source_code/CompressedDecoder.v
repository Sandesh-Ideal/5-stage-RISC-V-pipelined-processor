`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:15 05/20/2022 
// Design Name: 
// Module Name:    CompressedDecoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CompressedDecoder(
	input reset,
	input [31:0] pc,
	input [31:0] instruction_code,
	input prediction,
	output reg jump_flag,
	output reg [31:0] jump_address
    );

always@(instruction_code)
begin
if(reset == 1'b0)
begin
jump_flag = 0;
end
else if(instruction_code[6:0] == 7'b1101111)										//jal
begin
jump_flag = 1'b1;
jump_address = pc + {{12{instruction_code[31]}},instruction_code[19:12],instruction_code[20],instruction_code[30:21],1'b0};
end
else if(instruction_code[6:0] == 7'b1100111)										//jalr
begin
jump_flag = 1'b0;
end
else if(instruction_code[6:0] == 7'b1100011 && prediction == 1)			//branch	
begin
jump_address = pc + {{20{instruction_code[31]}},instruction_code[7],instruction_code[30:25],instruction_code[11:8],1'b0};
jump_flag = 1'b1;
end
else
jump_flag = 1'b0;
end
endmodule
