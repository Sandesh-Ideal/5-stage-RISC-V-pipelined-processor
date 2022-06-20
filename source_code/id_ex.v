`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:49 05/13/2022 
// Design Name: 
// Module Name:    id_ex 
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
module id_ex(
	input clk,
	input reset,
	input clear,
	input [31:0] read_data_1_ID,
	input [31:0] read_data_2_ID,
	input [31:0] imm_data_ID,
	input [31:0] pc_IF_ID,
	input [4:0] rd_ID,
	input [4:0] rs1_ID,
	input [4:0] rs2_ID,
	input [7:0] control_ID,
	input [2:0] func3_ID,
	input func7_ID,
	input opbit_ID,
	input prediction_IF_ID,
	output reg [31:0] read_data_1_ID_EX,
	output reg [31:0] read_data_2_ID_EX,
	output reg [31:0] imm_data_ID_EX,
	output reg [31:0] pc_ID_EX,
	output reg [4:0] rd_ID_EX,
	output reg [4:0] rs1_ID_EX,
	output reg [4:0] rs2_ID_EX,
	output reg [7:0] control_ID_EX,
	output reg [2:0] func3_ID_EX,
	output reg func7_ID_EX,
	output reg opbit_ID_EX,
	output reg prediction_ID_EX
    );

always@(posedge clk,negedge reset)
begin
if(reset == 0 || clear == 1)
begin
read_data_1_ID_EX = 0;
read_data_2_ID_EX = 0;
imm_data_ID_EX = 0;
pc_ID_EX = 0;
rd_ID_EX = 5'b00000;
rs1_ID_EX = 5'b00000;
rs2_ID_EX = 5'b00000;
control_ID_EX = 0;
func3_ID_EX = 0;
func7_ID_EX = 0;
opbit_ID_EX = 0;
prediction_ID_EX = 0;
end
else
begin
read_data_1_ID_EX = read_data_1_ID;
read_data_2_ID_EX = read_data_2_ID;
imm_data_ID_EX = imm_data_ID;
pc_ID_EX = pc_IF_ID;
rd_ID_EX = rd_ID;
rs1_ID_EX = rs1_ID;
rs2_ID_EX = rs2_ID;
control_ID_EX = control_ID;
func3_ID_EX = func3_ID;
func7_ID_EX = func7_ID;
opbit_ID_EX = opbit_ID;
prediction_ID_EX = prediction_IF_ID;
end
end
endmodule
