`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:52 12/09/2021 
// Design Name: 
// Module Name:    IFSTAGE 
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
module IFSTAGE(
    input [31:0] PC_Immed,
    input PC_sel,
    input PC_LdEn,
    input Reset,
    input Clk,
    output [31:0] Instr
    );

reg [31:0] pc_incr, pc_add;
wire [31:0] addr, muxout;

//PC register
reg_pc pc (.next_addr(muxout), .curr_addr(addr), .PC_LdEn(PC_LdEn), .Clk(Clk), .Reset(Reset));

//PC mux, dictates the next value of PC
mux2_inout32 mux (.muxout(muxout), .muxin0(pc_incr), .muxin1(pc_add), .sel(PC_sel));

//ROM module, reads instructions from ./rom.data
IMEM rom (.addr(addr[11:2]), .dout(Instr), .clk(Clk));

//mux input logic
always @(addr or PC_Immed) begin
	pc_incr = addr + 4;				//current value of PC + 4 (or PC<<2)
	pc_add = pc_incr + PC_Immed;	//current value of PC + 4 + Immediate
end

endmodule
