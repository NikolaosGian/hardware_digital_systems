`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:45 12/09/2021 
// Design Name: 
// Module Name:    mux2_inout32 
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
module mux2_inout32(
    input [31:0] muxin0,
	 input [31:0] muxin1,
    output reg [31:0] muxout,
    input sel
    );

always @(*) begin
	
	case(sel)
		1'b0: muxout = muxin0;
		1'b1: muxout = muxin1;
	endcase
	
end

endmodule
