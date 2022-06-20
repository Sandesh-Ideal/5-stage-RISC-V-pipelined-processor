`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:37 05/21/2022 
// Design Name: 
// Module Name:    FSMClockGenerator 
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
module FSMClockGenerator(
	input clk,
	input reset,
	input branch,
	output reg clkFSM
    );

always@(clk,reset)
begin
if(reset == 0)
clkFSM = 0;
else if(branch == 1)
clkFSM = ~clkFSM;
end
endmodule
