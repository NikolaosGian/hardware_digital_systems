`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:54 12/09/2021 
// Design Name: 
// Module Name:    mux2 
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
module mux2 #(parameter BUS_SIZE = 32)(
    input [BUS_SIZE-1:0] muxin0,
    input [BUS_SIZE-1:0] muxin1,
    input sel,
    output reg [BUS_SIZE-1:0] muxout
    );

always @(*) begin
	
	case(sel)
		1'b0: muxout = muxin0;
		1'b1: muxout = muxin1;
	endcase
	
end

endmodule
