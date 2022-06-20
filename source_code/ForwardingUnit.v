`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:53 05/19/2022 
// Design Name: 
// Module Name:    ForwardingUnit 
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
module ForwardingUnit(
	input [4:0] rs,
	input [4:0] rd_ex_mem,
	input [4:0] rd_mem_wb,
	input regwrite_ex_mem,
	input regwrite_mem_wb,
	output reg [1:0] aluFUsrc
    );
	 
always@(*)
begin
if(rd_ex_mem == rs && rd_ex_mem != 5'b00000 && regwrite_ex_mem == 1'b1)
aluFUsrc = 2'b01;
else if(rd_mem_wb == rs && rd_mem_wb != 5'b00000 && regwrite_mem_wb == 1'b1)
aluFUsrc = 2'b10;
else
aluFUsrc = 2'b00;
end

endmodule
