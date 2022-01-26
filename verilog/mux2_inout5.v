`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:03 12/09/2021 
// Design Name: 
// Module Name:    mux2_inout5 
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
module mux2_inout5(
    input [4:0] muxin0,
    input [4:0] muxin1,
    output reg [4:0] muxout,
    input sel
    );

always @(*) begin
	
	case(sel)
		1'b0: muxout = muxin0;
		1'b1: muxout = muxin1;
	endcase
	
end

endmodule
