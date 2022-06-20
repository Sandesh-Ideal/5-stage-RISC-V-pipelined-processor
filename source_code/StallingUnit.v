`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:21 05/19/2022 
// Design Name: 
// Module Name:    StallingUnit 
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
module StallingUnit(
	input [4:0] rs1,
	input [4:0] rs2,
	input [4:0] rd,
	input memread,
	output stall
    );

assign stall = ((rd == rs1 || rd == rs2) && memread == 1 && rd != 0)? 1 : 0;

endmodule
