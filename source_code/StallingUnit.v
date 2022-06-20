`timescale 1ns / 1ps

module StallingUnit(
	input [4:0] rs1,
	input [4:0] rs2,
	input [4:0] rd,
	input memread,
	output stall
    );

assign stall = ((rd == rs1 || rd == rs2) && memread == 1 && rd != 0)? 1 : 0;

endmodule
