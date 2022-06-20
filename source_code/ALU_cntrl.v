`timescale 1ns / 1ps

module ALU_cntrl(
	input [1:0] ALUop,
	input [2:0] func3,
	input func7,
	input opbit,
	output reg [3:0] control
    );

/*
** ALUop
** 0000: and
** 0001: or
** 0010: add
** 0011: subtract
** 0100: sll
** 0101: srl
** 0110: sra
** 0111: xor
** 1000: slt
** 1001: sltu
** 1010: future use
** 1011: future use
** 1100: future use
** 1101: future use
** 1110: future use
** 1111: assigning rs2
*/

always @(*)
begin
case(ALUop)
2'b00: //load-store type
begin
control = 4'b0010;
end
2'b01: //lui
begin
control = 4'b1111;
end
2'b10: //R,I-types
begin
case(func3)
3'b000:
begin
if(func7==1 && opbit==1)
control = 4'b0011;
else
control = 4'b0010;
end
3'b001:
control = 4'b0100;
3'b010:
control = 4'b1000;
3'b011:
control = 4'b1001;
3'b100:
control = 4'b0111;
3'b101:
begin
if(func7==0)
control = 4'b0101;
else
control = 4'b0110;
end
3'b110:
control = 4'b0001;
3'b111:
control = 4'b0000;
endcase
end
2'b11: //J-type
control = 4'b0010;
endcase
end

endmodule
