`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:31 12/09/2021 
// Design Name: 
// Module Name:    reg_pc 
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
module reg_pc(
    input [31:0] next_addr,
    output reg [31:0] curr_addr,
    input Clk,
    input PC_LdEn,
    input Reset
    );
	 
always @(posedge Clk)
	if (Reset)
		curr_addr <= 32'h0000_0000;
	else if (PC_LdEn)
		curr_addr <= next_addr;
endmodule
