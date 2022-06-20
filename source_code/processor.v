`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:44 05/13/2022 
// Design Name: 
// Module Name:    processor 
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
// Unfinished tasks: Instruction Fetch, ALUsrc, Branch instrcution, Jump instruction, Forwarding unit, Stalling unit --done
// Extra tasks: Dynamic branch predictor, Flushing unit, Cache
// Incomplete: jalr, lui
//////////////////////////////////////////////////////////////////////////////////
module processor(
	input clk,
	input reset
    );

wire [31:0] PC,PC_IF_ID,PC_ID_EX,jump_address,branch_address,instruction_code_IM,instruction_code_IF_ID;
wire [31:0] Write_Data,read_data_1_ID,read_data_2_ID,read_data_2_EX_MEM,imm_data_ID,read_data_1_ID_EX,read_data_2_ID_EX,imm_data_ID_EX;
wire [31:0] alu_out_EX,alu_out_EX_MEM,alu_out_MEM_WB,data_out_MEM_WB,data_out;
wire [31:0] alu_in_1,alu_in_2,mux3_in1,mux3_in2;

wire [7:0] control_ID,control_ID_EX;
wire [4:0] Write_Reg_MEM_WB,rd_ID_EX,rs1_ID_EX,rs2_ID_EX,rd_EX_MEM;
wire [3:0] ALUcontrol,control_EX_MEM;
wire [2:0] func3_ID_EX,func3_EX_MEM;
wire [1:0] ALUop,immSel,control_MEM_WB,aluFUsrc1,aluFUsrc2;
wire regWrite,memRead,memWrite,memToReg,ALUsrc,branch,ZeroFlag,func7_ID_EX,opbit_ID_EX,alu_in_jump;
wire regWrite_MEM_WB,stall,enable,clear,jump_flag,tobe_branch_flag,branch_flag,prediction,clkFSM;

wire [4:0] Read_Reg_1 = instruction_code_IF_ID[19:15];
wire [4:0] Read_Reg_2 = instruction_code_IF_ID[24:20];
wire [4:0] Write_Reg = instruction_code_IF_ID[11:7];
wire [6:0] opcode = instruction_code_IF_ID[6:0];
wire [1:0] PCsrc = {branch_flag,jump_flag};

assign enable = !stall;
assign clear = branch_flag;

// Stage 1: Instruction Fetch
PCupdate PCUpdate(clk,reset,enable,branch_flag,jump_flag,branch_address,jump_address,PC);

Instruction_Memory IM(PC,reset,instruction_code_IM);

CompressedDecoder CD(reset,PC,instruction_code_IM,prediction,jump_flag,jump_address); //jalr is not finished

BranchPredictor BP(clkFSM,reset,tobe_branch_flag,prediction);

if_id IF_ID(clk,reset,enable,clear,instruction_code_IM,PC,prediction,instruction_code_IF_ID,PC_IF_ID,prediction_IF_ID);
// Stage 2: Instruction Decode
Register_File RF(Read_Reg_1,Read_Reg_2,Write_Reg_MEM_WB,Write_Data,read_data_1_ID,read_data_2_ID,regWrite_MEM_WB,reset);

Control_Unit CU(reset,opcode,ALUop,regWrite,memRead,memWrite,memToReg,immSel,ALUsrc,branch);

StallingUnit SU(Read_Reg_1,Read_Reg_2,rd_ID_EX,control_ID_EX[3],stall);

//List of all control signals
assign control_ID = {ALUop,ALUsrc,branch,memRead,memWrite,memToReg,regWrite} & {8{!stall}};

Imm_gen IG(instruction_code_IF_ID,immSel,imm_data_ID);

id_ex ID_EX(clk,reset,clear,read_data_1_ID,read_data_2_ID,imm_data_ID,PC_IF_ID,Write_Reg,Read_Reg_1,Read_Reg_2,control_ID,instruction_code_IF_ID[14:12],instruction_code_IF_ID[30],opcode[5],prediction_IF_ID,read_data_1_ID_EX,read_data_2_ID_EX,imm_data_ID_EX,PC_ID_EX,rd_ID_EX,rs1_ID_EX,rs2_ID_EX,control_ID_EX,func3_ID_EX,func7_ID_EX,opbit_ID_EX,prediction_ID_EX);

// Stage 3: Execute Stage
ForwardingUnit FU1(rs1_ID_EX,rd_EX_MEM,Write_Reg_MEM_WB,control_EX_MEM[0],control_MEM_WB[0],aluFUsrc1);
ForwardingUnit FU2(rs2_ID_EX,rd_EX_MEM,Write_Reg_MEM_WB,control_EX_MEM[0],control_MEM_WB[0],aluFUsrc2);

//assign alu_in_1 = read_data_1_ID_EX;
//assign alu_in_2 = read_data_2_ID_EX;
assign alu_in_jump = control_ID_EX[7]&control_ID_EX[6];
MUX alusrc1mux(read_data_1_ID_EX,PC_ID_EX,alu_in_jump,mux3_in1);
MUX3 alusrc2mux(read_data_2_ID_EX,imm_data_ID_EX,4,{alu_in_jump,control_ID_EX[5]},mux3_in2);
MUX3 ALUin1(mux3_in1,alu_out_EX_MEM,Write_Data,aluFUsrc1,alu_in_1);
MUX3 ALUin2(mux3_in2,alu_out_EX_MEM,Write_Data,aluFUsrc2,alu_in_2);

ALU_cntrl ALUctrlbox(control_ID_EX[7:6],func3_ID_EX,func7_ID_EX,opbit_ID_EX,ALUcontrol);

ALU alu(alu_in_1,alu_in_2,ALUcontrol,alu_out_EX,ZeroFlag);

BranchingUnit BU(reset,alu_in_1,alu_in_2,func3_ID_EX,control_ID_EX[4],tobe_branch_flag);

//assign clkFSM = control_ID_EX[4];
FSMClockGenerator CG(clk,reset,control_ID_EX[4],clkFSM);

BranchAcceptor BA(reset,control_ID_EX[4],tobe_branch_flag,prediction_ID_EX,PC_ID_EX,imm_data_ID_EX,branch_flag,branch_address);

wire [3:0] control_EX = control_ID_EX[3:0];

ex_mem EX_MEM(clk,reset,alu_out_EX,rd_ID_EX,read_data_2_ID_EX,control_EX,func3_ID_EX,alu_out_EX_MEM,rd_EX_MEM,read_data_2_EX_MEM,control_EX_MEM,func3_EX_MEM);

// Stage 4: Memory Stage
Data_Memory DM(reset,alu_out_EX_MEM,read_data_2_EX_MEM,control_EX_MEM[3],control_EX_MEM[2],func3_EX_MEM,data_out);

wire [1:0] control_MEM = control_EX_MEM[1:0];

mem_wb MEM_WB(clk,reset,alu_out_EX_MEM,data_out,rd_EX_MEM,control_MEM,alu_out_MEM_WB,data_out_MEM_WB,Write_Reg_MEM_WB,control_MEM_WB);

// Stage 5: Write Back Stage
MUX WB(alu_out_MEM_WB,data_out_MEM_WB,control_MEM_WB[1],Write_Data);

assign regWrite_MEM_WB = control_MEM_WB[0];

endmodule
