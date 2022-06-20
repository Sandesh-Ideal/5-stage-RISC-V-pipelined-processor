`timescale 1ns / 1ps

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
