`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:08 05/13/2022 
// Design Name: 
// Module Name:    ex_mem 
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
module ex_mem(
	input clk,
	input reset,
	input [31:0] alu_out_EX,
	input [4:0] rd_ID_EX,
	input [31:0] imm_data_ID_EX,
	input [3:0] control_EX,
	input [2:0] func3_ID_EX,
	output reg [31:0] alu_out_EX_MEM,
	output reg [4:0] rd_EX_MEM,
	output reg [31:0] imm_data_EX_MEM,
	output reg [3:0] control_EX_MEM,
	output reg [2:0] func3_EX_MEM
    );

always@(posedge clk,negedge reset)
begin
if(reset == 0)
begin
alu_out_EX_MEM = 0;
rd_EX_MEM = 0;
imm_data_EX_MEM = 0;
control_EX_MEM = 0;
func3_EX_MEM = 0;
end
else
begin
alu_out_EX_MEM = alu_out_EX;
rd_EX_MEM = rd_ID_EX;
imm_data_EX_MEM = imm_data_ID_EX;
control_EX_MEM = control_EX;
func3_EX_MEM = func3_ID_EX;
end
end
endmodule
