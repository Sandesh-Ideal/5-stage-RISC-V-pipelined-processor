`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:10 05/20/2022 
// Design Name: 
// Module Name:    BranchAcceptor 
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
module BranchAcceptor(
	input reset,
	input branch,
	input tobe_branch_flag,
	input prediction_ID_EX,
	input [31:0] pc,
	input [31:0] imm_data,
	output reg branch_flag,
	output reg [31:0] branch_address
    );
	 
wire [31:0] offset = imm_data << 1;

always@(*)
begin
if(reset == 0)
begin
branch_flag = 1'b0;
end
else if(branch == 1)
begin
case({tobe_branch_flag,prediction_ID_EX})
2'b00:
begin
branch_flag = 1'b0;
end
2'b01:
begin
branch_flag = 1'b1;
branch_address = pc + 4;
$display("flushed");
end
2'b10:
begin
branch_flag = 1'b1;
branch_address = pc + offset;
end
2'b11:
begin
branch_flag = 1'b0;
end
endcase
end
else
branch_flag = 1'b0;
end
endmodule
