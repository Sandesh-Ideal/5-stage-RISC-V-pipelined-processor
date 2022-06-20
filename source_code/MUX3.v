`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:23 05/19/2022 
// Design Name: 
// Module Name:    MUX3 
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
module MUX3(
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [1:0] ctrl,
	output reg [31:0] out
    );

always@(*)
begin
if(ctrl == 2'b00)
out = a;
else if(ctrl == 2'b01)
out = b;
else
out = c;
end
endmodule
