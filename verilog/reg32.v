`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:52 12/05/2021 
// Design Name: 
// Module Name:    reg32
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
module reg32(
    input CLK,
    input [31:0] Data,
    output reg [31:0] Dout,
    input WE,
	 input Reset
    );

always @(posedge CLK) begin
	if (Reset)
		Dout <= 32'h0000_0000;
	else if (WE)
		Dout <= Data;
	else
		Dout <= Dout;
end

endmodule
