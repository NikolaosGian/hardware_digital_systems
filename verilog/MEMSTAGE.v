`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:53 12/10/2021 
// Design Name: 
// Module Name:    MEMSTAGE 
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
module MEMSTAGE(
    input Clk,
    input Mem_WrEn,
    input [31:0] ALU_MEM_Addr,
    input [31:0] MEM_DataIn,
    output [31:0] MEM_DataOut
    );

MEM ram (.clk(Clk), .we(Mem_WrEn), .addr(ALU_MEM_Addr[11:2]), .din(MEM_DataIn), .dout(MEM_DataOut));

endmodule
