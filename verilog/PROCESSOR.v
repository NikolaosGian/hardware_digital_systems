`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:44:39 12/23/2021 
// Design Name: 
// Module Name:    PROCESSOR 
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
module PROCESSOR(
    output [31:0] Instr,
	 output PC_sel,
	 output PC_LdEn,
	 output RF_WrEn,
	 output RF_WrData_sel,
	 output ALU_Bin_sel,
	 output [3:0] ALU_func,
	 output MEM_WrEn,
    input Reset,
    input Clk
    );

DATAPATH datapath	(
	.Clk(Clk),
	.Reset(Reset),
	.PC_sel(PC_sel),
	.PC_LdEn(PC_LdEn),
	.RF_WrData_sel(RF_WrData_sel),
	.RF_B_sel(RF_B_sel),
	.RF_WrEn(RF_WrEn),
	.ALU_Bin_sel(ALU_Bin_sel),
	.ALU_func(ALU_func),
	.MEM_WrEn(MEM_WrEn),
	.Instr(Instr),
	.Zero(Zero)
	);

CONTROL control (
	.Clk(Clk),
   .Reset(Reset),
	.Instr(Instr),
	.Zero(Zero),
	.PC_sel(PC_sel),
   .PC_LdEn(PC_LdEn),
   .RF_WrData_sel(RF_WrData_sel),
   .RF_B_sel(RF_B_sel),
	.RF_WrEn(RF_WrEn),
   .ALU_Bin_sel(ALU_Bin_sel),
   .ALU_func(ALU_func),
   .MEM_WrEn(MEM_WrEn)
	);

endmodule
