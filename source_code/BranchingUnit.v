`timescale 1ns / 1ps

module BranchingUnit(
	input reset,
	input [31:0] a,
	input [31:0] b,
	input [2:0] func3,
	input branch,
	output reg branch_flag
    );

always@(*)
begin
if(reset == 0)
branch_flag = 1'b0;
else if(branch == 1'b1)
begin
case(func3)
3'b000:
if(a==b) branch_flag = 1;
else branch_flag = 0;
3'b001:
if(a!=b) branch_flag = 1;
else branch_flag = 0;
3'b100:
if($signed(a) < $signed(b)) branch_flag = 1;
else branch_flag = 0;
3'b101:
if($signed(a) < $signed(b)) branch_flag = 0;
else branch_flag = 1;
3'b110:
if(a<b) branch_flag = 1;
else branch_flag = 0;
3'b111:
if(a<b) branch_flag = 0;
else branch_flag = 1;
endcase
end
else
branch_flag = 0;
end
endmodule
