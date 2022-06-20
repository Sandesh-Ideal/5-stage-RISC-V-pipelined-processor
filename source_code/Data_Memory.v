`timescale 1ns / 1ps

module Data_Memory(
	input reset,
	input [31:0] address,
	input [31:0] write_data,
	input memRead,
	input memWrite,
	input [2:0] func3,
	output reg [31:0] read_data
    );

reg [7:0] DataMemory [31:0];
reg [7:0] dummy1;
reg [15:0] dummy2;

always@(*)
begin
if(reset == 0)
$readmemh("Data.mem",DataMemory);
else if(memWrite == 1)
begin
case(func3)
3'b000:
DataMemory[address] = write_data[7:0]; //store byte
3'b001:
{DataMemory[address+1],DataMemory[address]} = write_data[15:0]; //store half word
3'b010:
{DataMemory[address+3],DataMemory[address+2],DataMemory[address+1],DataMemory[address]} = write_data[31:0]; //store word
endcase
end
else if(memRead == 1)
begin
case(func3)
3'b000:
begin
dummy1 = DataMemory[address]; 
read_data = {{24{dummy1[7]}},dummy1}; //load byte signed
end
3'b001:
begin
dummy2 = {DataMemory[address+1],DataMemory[address]};
read_data = {{16{dummy2[15]}},dummy2}; //load half word signed
end
3'b010:
read_data = {DataMemory[address+3],DataMemory[address+2],DataMemory[address+1],DataMemory[address]}; //load word
3'b100:
read_data = {24'b000000000000000000000000,DataMemory[address]}; //load byte unsigned
3'b101:
read_data = {16'b0000000000000000,DataMemory[address+1],DataMemory[address]}; //load half word unsigned
endcase
end
end
endmodule
