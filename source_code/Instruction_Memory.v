`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:26 05/13/2022 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
    );

reg [7:0] Mem [48:0];
assign Instruction_Code = {Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC]};

always @(negedge reset)
begin
$readmemh("Instruction.mem",Mem);
/*
Mem[3]=8'h01; Mem[2]=8'h49; Mem[1]=8'h83; Mem[0] = 8'h33;			//add t1,s3,s4		0x01498333
Mem[7]=8'hff; Mem[6]=8'he3; Mem[5]=8'h03; Mem[4] = 8'h13;			//addi t1,t1,-2	0xffe30313
Mem[11]=8'hff; Mem[10]=8'hf3; Mem[9]=8'h44; Mem[8] = 8'h93;			//xori s1,t1,-1	0xfff34493
Mem[15]=8'h40; Mem[14]=8'h34; Mem[13]=8'hd4; Mem[12] = 8'h93;		//srai s1,s1,3		0x4034d493
Mem[19]=8'h00; Mem[18]=8'h34; Mem[17]=8'h94; Mem[16] = 8'h93;		//slli s1,s1,3		0x00349493
*/
end
endmodule
