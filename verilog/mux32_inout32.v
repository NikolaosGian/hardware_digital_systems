`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:16 12/06/2021 
// Design Name: 
// Module Name:    mux32_inout32 
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
module mux32_inout32(
    input [31:0] muxin0,
    input [31:0] muxin1,
    input [31:0] muxin2,
    input [31:0] muxin3,
    input [31:0] muxin4,
    input [31:0] muxin5,
    input [31:0] muxin6,
    input [31:0] muxin7,
    input [31:0] muxin8,
    input [31:0] muxin9,
    input [31:0] muxin10,
    input [31:0] muxin11,
    input [31:0] muxin12,
    input [31:0] muxin13,
    input [31:0] muxin14,
    input [31:0] muxin15,
    input [31:0] muxin16,
    input [31:0] muxin17,
    input [31:0] muxin18,
    input [31:0] muxin19,
    input [31:0] muxin20,
    input [31:0] muxin21,
    input [31:0] muxin22,
    input [31:0] muxin23,
    input [31:0] muxin24,
    input [31:0] muxin25,
    input [31:0] muxin26,
    input [31:0] muxin27,
    input [31:0] muxin28,
    input [31:0] muxin29,
    input [31:0] muxin30,
    input [31:0] muxin31,
    input [4:0] sel,
    output reg [31:0] muxout
    );

always @(*) begin

case (sel)
	
5'b00000: muxout = muxin0;
5'b00001: muxout = muxin1;
5'b00010: muxout = muxin2;
5'b00011: muxout = muxin3;
5'b00100: muxout = muxin4;
5'b00101: muxout = muxin5;
5'b00110: muxout = muxin6;
5'b00111: muxout = muxin7;
5'b01000: muxout = muxin8;
5'b01001: muxout = muxin9;
5'b01010: muxout = muxin10;
5'b01011: muxout = muxin11;
5'b01100: muxout = muxin12;
5'b01101: muxout = muxin13;
5'b01110: muxout = muxin14;
5'b01111: muxout = muxin15;
5'b10000: muxout = muxin16;
5'b10001: muxout = muxin17;
5'b10010: muxout = muxin18;
5'b10011: muxout = muxin19;
5'b10100: muxout = muxin20;
5'b10101: muxout = muxin21;
5'b10110: muxout = muxin22;
5'b10111: muxout = muxin23;
5'b11000: muxout = muxin24;
5'b11001: muxout = muxin25;
5'b11010: muxout = muxin26;
5'b11011: muxout = muxin27;
5'b11100: muxout = muxin28;
5'b11101: muxout = muxin29;
5'b11110: muxout = muxin30;
5'b11111: muxout = muxin31;
default: muxout = 0;
endcase

end

endmodule
