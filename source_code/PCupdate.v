`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:29 05/19/2022 
// Design Name: 
// Module Name:    PCupdate 
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
module PCupdate(
    input clk,
    input reset,
	 input enable,
    input branch_flag,
    input jump_flag,
    input [31:0] branch_address,
    input [31:0] jump_address,
    output reg [31:0] pc
    );

always@(posedge clk,negedge reset)
begin
if(reset == 0)
begin
pc = 0;
end
else if(enable == 1)
begin
if(branch_flag == 0 && jump_flag == 0)
pc = pc + 4;
else if(branch_flag == 1)
pc = branch_address;
else
pc = jump_address;
end
end
endmodule
