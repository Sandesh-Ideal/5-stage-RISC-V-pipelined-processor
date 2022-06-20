`timescale 1ns / 1ps

module Register_File(
    input [4:0] Read_Reg_1,
    input [4:0] Read_Reg_2,
    input [4:0] Write_Reg,
    input [31:0] Write_Data,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2,
    input RegWrite,
    input reset
    );
reg [31:0] RegMemory [31:0];									//Defining Register Memory
reg flag;

always@(reset,Write_Reg,Write_Data)
if(reset == 0)
flag = 1'b0;
else
flag = ~flag;

always@(reset,RegWrite,flag)
begin
if(reset == 0)
$readmemh("RegisterFile.mem",RegMemory);
else if(RegWrite == 1 && Write_Reg != 0)
RegMemory[Write_Reg] = Write_Data;
end

assign Read_Data_1 = RegMemory[Read_Reg_1];				//Reading data 1 from Register Memory
assign Read_Data_2 = RegMemory[Read_Reg_2];				//Reading data 2 from Register Memory

endmodule
