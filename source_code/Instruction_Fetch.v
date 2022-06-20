`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:57 05/13/2022 
// Design Name: 
// Module Name:    Instruction_Fetch 
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
module Instruction_Fetch(
    input clk,
    input reset,
    output [31:0] Instruction_Code
    );
reg [31:0] PC;
Instruction_Memory instr_mem(PC,reset,Instruction_Code);

always @(posedge clk,negedge reset)
begin
if(reset == 0)
PC<=0;
else
PC<=PC+4;
end
endmodule
