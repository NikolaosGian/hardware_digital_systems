`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:27 12/05/2021 
// Design Name: 
// Module Name:    RF 
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
module RF(
    input wire [4:0] Ard1,
    input wire [4:0] Ard2,
    input wire [4:0] Awr,
    output wire [31:0] Dout1,
    output wire [31:0] Dout2,
    input wire [31:0] Din,
    input wire WrEn,
    input wire Clk,
	 input wire Reset
    );

wire [31:0] decout;
dec5to32 decoder (.dec(decout), .enc(Awr));

wire [31:1] we;
and
	a1 (we[1], WrEn, decout[1]),
	a2 (we[2], WrEn, decout[2]),
	a3 (we[3], WrEn, decout[3]),
	a4 (we[4], WrEn, decout[4]),
	a5 (we[5], WrEn, decout[5]),
	a6 (we[6], WrEn, decout[6]),
	a7 (we[7], WrEn, decout[7]),
	a8 (we[8], WrEn, decout[8]),
	a9 (we[9], WrEn, decout[9]),
	a10 (we[10], WrEn, decout[10]),
	a11 (we[11], WrEn, decout[11]),
	a12 (we[12], WrEn, decout[12]),
	a13 (we[13], WrEn, decout[13]),
	a14 (we[14], WrEn, decout[14]),
	a15 (we[15], WrEn, decout[15]),
	a16 (we[16], WrEn, decout[16]),
	a17 (we[17], WrEn, decout[17]),
	a18 (we[18], WrEn, decout[18]),
	a19 (we[19], WrEn, decout[19]),
	a20 (we[20], WrEn, decout[20]),
	a21 (we[21], WrEn, decout[21]),
	a22 (we[22], WrEn, decout[22]),
	a23 (we[23], WrEn, decout[23]),
	a24 (we[24], WrEn, decout[24]),
	a25 (we[25], WrEn, decout[25]),
	a26 (we[26], WrEn, decout[26]),
	a27 (we[27], WrEn, decout[27]),
	a28 (we[28], WrEn, decout[28]),
	a29 (we[29], WrEn, decout[29]),
	a30 (we[30], WrEn, decout[30]),
	a31 (we[31], WrEn, decout[31]);

wire [31:0] dout [31:0];
assign dout[0] = 32'h0000_0000;

reg32 r1 (.CLK(Clk), .Data(Din), .Dout(dout[1]), .WE(we[1]), .Reset(Reset));
reg32 r2 (.CLK(Clk), .Data(Din), .Dout(dout[2]), .WE(we[2]), .Reset(Reset));
reg32 r3 (.CLK(Clk), .Data(Din), .Dout(dout[3]), .WE(we[3]), .Reset(Reset));
reg32 r4 (.CLK(Clk), .Data(Din), .Dout(dout[4]), .WE(we[4]), .Reset(Reset));
reg32 r5 (.CLK(Clk), .Data(Din), .Dout(dout[5]), .WE(we[5]), .Reset(Reset));
reg32 r6 (.CLK(Clk), .Data(Din), .Dout(dout[6]), .WE(we[6]), .Reset(Reset));
reg32 r7 (.CLK(Clk), .Data(Din), .Dout(dout[7]), .WE(we[7]), .Reset(Reset));
reg32 r8 (.CLK(Clk), .Data(Din), .Dout(dout[8]), .WE(we[8]), .Reset(Reset));
reg32 r9 (.CLK(Clk), .Data(Din), .Dout(dout[9]), .WE(we[9]), .Reset(Reset));
reg32 r10 (.CLK(Clk), .Data(Din), .Dout(dout[10]), .WE(we[10]), .Reset(Reset));
reg32 r11 (.CLK(Clk), .Data(Din), .Dout(dout[11]), .WE(we[11]), .Reset(Reset));
reg32 r12 (.CLK(Clk), .Data(Din), .Dout(dout[12]), .WE(we[12]), .Reset(Reset));
reg32 r13 (.CLK(Clk), .Data(Din), .Dout(dout[13]), .WE(we[13]), .Reset(Reset));
reg32 r14 (.CLK(Clk), .Data(Din), .Dout(dout[14]), .WE(we[14]), .Reset(Reset));
reg32 r15 (.CLK(Clk), .Data(Din), .Dout(dout[15]), .WE(we[15]), .Reset(Reset));
reg32 r16 (.CLK(Clk), .Data(Din), .Dout(dout[16]), .WE(we[16]), .Reset(Reset));
reg32 r17 (.CLK(Clk), .Data(Din), .Dout(dout[17]), .WE(we[17]), .Reset(Reset));
reg32 r18 (.CLK(Clk), .Data(Din), .Dout(dout[18]), .WE(we[18]), .Reset(Reset));
reg32 r19 (.CLK(Clk), .Data(Din), .Dout(dout[19]), .WE(we[19]), .Reset(Reset));
reg32 r20 (.CLK(Clk), .Data(Din), .Dout(dout[20]), .WE(we[20]), .Reset(Reset));
reg32 r21 (.CLK(Clk), .Data(Din), .Dout(dout[21]), .WE(we[21]), .Reset(Reset));
reg32 r22 (.CLK(Clk), .Data(Din), .Dout(dout[22]), .WE(we[22]), .Reset(Reset));
reg32 r23 (.CLK(Clk), .Data(Din), .Dout(dout[23]), .WE(we[23]), .Reset(Reset));
reg32 r24 (.CLK(Clk), .Data(Din), .Dout(dout[24]), .WE(we[24]), .Reset(Reset));
reg32 r25 (.CLK(Clk), .Data(Din), .Dout(dout[25]), .WE(we[25]), .Reset(Reset));
reg32 r26 (.CLK(Clk), .Data(Din), .Dout(dout[26]), .WE(we[26]), .Reset(Reset));
reg32 r27 (.CLK(Clk), .Data(Din), .Dout(dout[27]), .WE(we[27]), .Reset(Reset));
reg32 r28 (.CLK(Clk), .Data(Din), .Dout(dout[28]), .WE(we[28]), .Reset(Reset));
reg32 r29 (.CLK(Clk), .Data(Din), .Dout(dout[29]), .WE(we[29]), .Reset(Reset));
reg32 r30 (.CLK(Clk), .Data(Din), .Dout(dout[30]), .WE(we[30]), .Reset(Reset));
reg32 r31 (.CLK(Clk), .Data(Din), .Dout(dout[31]), .WE(we[31]), .Reset(Reset));

mux32_inout32 m1 (.sel(Ard1),
						.muxin0(dout[0]),
						.muxin1(dout[1]), 
						.muxin2(dout[2]), 
						.muxin3(dout[3]),
						.muxin4(dout[4]),
						.muxin5(dout[5]),
						.muxin6(dout[6]),
						.muxin7(dout[7]),
						.muxin8(dout[8]),
						.muxin9(dout[9]),
						.muxin10(dout[10]),
						.muxin11(dout[11]),
						.muxin12(dout[12]),
						.muxin13(dout[13]),
						.muxin14(dout[14]),
						.muxin15(dout[15]),
						.muxin16(dout[16]),
						.muxin17(dout[17]),
						.muxin18(dout[18]),
						.muxin19(dout[19]),
						.muxin20(dout[20]),
						.muxin21(dout[21]),
						.muxin22(dout[22]),
						.muxin23(dout[23]),
						.muxin24(dout[24]),
						.muxin25(dout[25]),
						.muxin26(dout[26]),
						.muxin27(dout[27]),
						.muxin28(dout[28]),
						.muxin29(dout[29]), 
						.muxin30(dout[30]),
						.muxin31(dout[31]),
						.muxout(Dout1));

mux32_inout32 m2 (.sel(Ard2),
						.muxin0(dout[0]),
						.muxin1(dout[1]), 
						.muxin2(dout[2]), 
						.muxin3(dout[3]),
						.muxin4(dout[4]),
						.muxin5(dout[5]),
						.muxin6(dout[6]),
						.muxin7(dout[7]),
						.muxin8(dout[8]),
						.muxin9(dout[9]),
						.muxin10(dout[10]),
						.muxin11(dout[11]),
						.muxin12(dout[12]),
						.muxin13(dout[13]),
						.muxin14(dout[14]),
						.muxin15(dout[15]),
						.muxin16(dout[16]),
						.muxin17(dout[17]),
						.muxin18(dout[18]),
						.muxin19(dout[19]),
						.muxin20(dout[20]),
						.muxin21(dout[21]),
						.muxin22(dout[22]),
						.muxin23(dout[23]),
						.muxin24(dout[24]),
						.muxin25(dout[25]),
						.muxin26(dout[26]),
						.muxin27(dout[27]),
						.muxin28(dout[28]),
						.muxin29(dout[29]), 
						.muxin30(dout[30]),
						.muxin31(dout[31]),
						.muxout(Dout2));

endmodule
