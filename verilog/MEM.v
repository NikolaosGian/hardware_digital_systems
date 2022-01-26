`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:00 12/10/2021 
// Design Name: 
// Module Name:    MEM 
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
module MEM(
	input clk,
	input we,
	input [9:0] addr,
	input [31:0] din,
	output reg [31:0] dout
	);
	
reg [31:0] RAM [1023:0];

always @(posedge clk)
	begin
		if(we)
			RAM[addr] = din;
		else
			dout = RAM[addr];
	end
	
endmodule
