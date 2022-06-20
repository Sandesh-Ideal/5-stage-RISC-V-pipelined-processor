`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:42 05/13/2022 
// Design Name: 
// Module Name:    if_id 
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
module if_id(
	input clk,
	input reset,
	input enable,
	input clear,
	input [31:0] code_IM,
	input [31:0] PC,
	input prediction,
	output reg [31:0] code_IF_ID,
	output reg [31:0] PC_IF_ID,
	output reg prediction_IF_ID
    );

always@(posedge clk,negedge reset)
begin
if(reset == 0 || clear == 1)
begin
code_IF_ID = 8'h0000_0013;			// nop instruction => addi zero,zero,0
PC_IF_ID = 0;
prediction_IF_ID = 0;
end
else if(enable == 1)
begin
code_IF_ID = code_IM;
PC_IF_ID = PC;
prediction_IF_ID = prediction;
end
end
endmodule
