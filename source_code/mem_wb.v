`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:56 05/13/2022 
// Design Name: 
// Module Name:    mem_wb 
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
module mem_wb(
	input clk,
	input reset,
	input [31:0] alu_out_EX_MEM,
	input [31:0] data_out,
	input [4:0] rd_EX_MEM,
	input [1:0] control_MEM,
	output reg [31:0] alu_out_MEM_WB,
	output reg [31:0] data_out_MEM_WB,
	output reg [4:0] Write_Reg_MEM_WB,
	output reg [1:0] control_MEM_WB
    );

always@(posedge clk,negedge reset)
begin
if(reset == 0)
begin
alu_out_MEM_WB = 0;
data_out_MEM_WB = 0;
Write_Reg_MEM_WB = 0;
control_MEM_WB = 0;
end
else
begin
alu_out_MEM_WB = alu_out_EX_MEM;
data_out_MEM_WB = data_out;
Write_Reg_MEM_WB = rd_EX_MEM;
control_MEM_WB = control_MEM;
end
end
endmodule
