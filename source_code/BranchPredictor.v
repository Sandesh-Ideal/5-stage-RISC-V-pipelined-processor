`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:30 05/20/2022 
// Design Name: 
// Module Name:    BranchPredictor 
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
module BranchPredictor(
	input clkFSM,
	input reset,
	input result,
	output reg prediction
    );

parameter S0 = 1'b0, S1 = 1'b1;
reg present_state,next_state;

always@(posedge clkFSM, negedge reset)
begin
if(reset == 0)
present_state = S1;
else if(result == 1)
present_state = S1;
else if(result == 0)
present_state = S0;
end

//Output Logic
always@(clkFSM,reset,present_state)
begin
if(reset == 0)
prediction = 1'b1;
else if(present_state == S0)
prediction = 1'b0;
else if(present_state == S1)
present_state = 1'b1;
end
endmodule
