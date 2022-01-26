`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:26 12/21/2021 
// Design Name: 
// Module Name:    DATAPATH 
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
module DATAPATH(
		output wire [31:0] Instr,
		output wire Zero,
		input wire PC_sel,
		input wire PC_LdEn,
		input wire RF_WrData_sel,
		input wire RF_B_sel,
		input wire RF_WrEn,
		input wire ALU_Bin_sel,
		input wire [3:0] ALU_func,
		input wire MEM_WrEn,
		input wire Clk,
		input wire Reset
	);

//Localparams for byte trimming
localparam lb = 6'b000011;
localparam sb = 6'b000111;

//Intermetiate nets between modules
wire [31:0] Immed, PC_Immed;
wire [31:0] RF_A, RF_B;

//Intermetiate nets for byte trimming
wire [31:0] ALU_out, MEM_out;
reg [31:0] MEM_in, MEM_out_cut;

//deprecated register made to hold immediate value after Instruction changed
//reg32 immed_hold (.CLK(Clk), .Data(Immed), .Dout(PC_Immed), .WE(PC_sel), .Reset(Reset));

assign PC_Immed = Immed;

IFSTAGE ifstage (.Instr(Instr),
					  .PC_Immed(PC_Immed),
					  .PC_sel(PC_sel),
					  .PC_LdEn(PC_LdEn),
					  .Reset(Reset),
					  .Clk(Clk)
					);

DECSTAGE decstage (.Immed(Immed),
						 .RF_A(RF_A),
						 .RF_B(RF_B),
						 .Instr(Instr),
						 .ALU_out(ALU_out),
						 .MEM_out(MEM_out_cut),
						 .RF_WrData_sel(RF_WrData_sel),
						 .RF_B_sel(RF_B_sel),
						 .RF_WrEn(RF_WrEn),
						 .Clk(Clk),
						 .Reset(Reset)
					);

ALUSTAGE alustage (.ALU_out(ALU_out),
						 .Zero(Zero),
						 .RF_A(RF_A),
						 .RF_B(RF_B),
						 .Immed(Immed),
						 .ALU_Bin_sel(ALU_Bin_sel),
						 .ALU_func(ALU_func)
					);
						 
MEMSTAGE memstage (.MEM_DataOut(MEM_out),
						 .Clk(Clk),
						 .Mem_WrEn(MEM_WrEn),
						 .ALU_MEM_Addr(ALU_out),
						 .MEM_DataIn(MEM_in)
					);

//Byte trimming for lb instruction
always @(MEM_out or Instr) begin
if (Instr[31:26] == lb)
	MEM_out_cut = MEM_out & 32'h0000_00FF;
else
	MEM_out_cut = MEM_out;
end


//Byte trimming for sb instruction
always @(RF_B or Instr) begin
if (Instr[31:26] == sb)
	MEM_in = RF_B & 32'h0000_00FF;
else
	MEM_in = RF_B;
end

endmodule
