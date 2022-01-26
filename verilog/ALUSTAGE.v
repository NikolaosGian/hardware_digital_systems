`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:44 12/10/2021 
// Design Name: 
// Module Name:    ALUSTAGE 
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
module ALUSTAGE(
    input [31:0] RF_A,
    input [31:0] RF_B,
    input [31:0] Immed,
    input ALU_Bin_sel,
    input [3:0] ALU_func,
    output [31:0] ALU_out,
	 output Zero
    );

wire [31:0] muxout;

//mux which dictates the input B of ALU
mux2_inout32 mux (.muxin0(RF_B), .muxin1(Immed), .muxout(muxout), .sel(ALU_Bin_sel));

ALU_MODULE alu (.A(RF_A), .B(muxout), .Op(ALU_func), .Out(ALU_out), .Zero(Zero));

endmodule
