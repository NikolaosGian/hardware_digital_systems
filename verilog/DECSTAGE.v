`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:47 12/09/2021 
// Design Name: 
// Module Name:    DECSTAGE 
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
module DECSTAGE(
    input wire [31:0] Instr,
    input wire RF_WrEn,
    input wire [31:0] ALU_out,
    input wire [31:0] MEM_out,
    input wire RF_WrData_sel,
    input wire RF_B_sel,
    input wire Clk,
    output reg [31:0] Immed,
    output wire [31:0] RF_A,
    output wire [31:0] RF_B,
	 input wire Reset
    );

//Localparams for opcodes (I-type)
localparam li = 6'b111000;
localparam lui = 6'b111001;
localparam addi = 6'b110000;
localparam andi = 6'b110010;
localparam ori = 6'b110011;

localparam b = 6'b111111;
localparam beq = 6'b000000;
localparam bne = 6'b000001;

localparam lb = 6'b000011;
localparam sb = 6'b000111;
localparam lw = 6'b001111;
localparam sw = 6'b011111;

//Combinational logic which dictates the Immediate output based on the Instruction
always @(Instr) begin
	case (Instr[31:26])
	
		//Sign Extend from bit 15 to 31
		li, addi, lb, sb, lw, sw: Immed = {{16{Instr[15]}}, Instr[15:0]};
		
		//Shift left logical 16
		lui: Immed = Instr[15:0] << 16;
		
		//Zero Fill from bit 15 to 31
		andi, ori: Immed = {16'h0000, Instr[15:0]};
		
		//SSL by 2 and Sign Extend bit 15 (or 17?)
				 b, beq, bne: Immed = {{16{Instr[15]}}, Instr[15:0]<<2};
		// or "b, beq, bne: Immed = {{14{Instr[15]}}, Instr[15:0]<<2};" ??
		
		default : Immed = 32'h0000_0000;
	endcase
end

wire [4:0] mux_B;
wire [31:0] mux_WrData;

//Register file
RF regfile (.Ard1(Instr[25:21]), .Ard2(mux_B), .Awr(Instr[20:16]), .Dout1(RF_A), .Dout2(RF_B), .Din(mux_WrData), .WrEn(RF_WrEn), .Clk(Clk), .Reset(Reset));

//Input mux, dictates the source of the data to be writen
mux2_inout32 data_mux (.muxin0(ALU_out), .muxin1(MEM_out), .sel(RF_WrData_sel), .muxout(mux_WrData));

//Input mux, dictates the register to be read
mux2_inout5 regB_mux (.muxin0(Instr[15:11]), .muxin1(Instr[20:16]), .sel(RF_B_sel), .muxout(mux_B));

endmodule
