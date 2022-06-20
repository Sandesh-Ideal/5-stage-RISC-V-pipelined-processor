`timescale 1ns / 1ps

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
