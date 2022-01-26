`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:16:27 01/03/2022
// Design Name:   DECSTAGE
// Module Name:   /home/ise/Desktop/ise_projects/Project2src/DECSTAGE_tb.v
// Project Name:  Project2src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DECSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DECSTAGE_tb;

	// Inputs
	reg [31:0] Instr;
	reg RF_WrEn;
	reg [31:0] ALU_out;
	reg [31:0] MEM_out;
	reg RF_WrData_sel;
	reg RF_B_sel;
	reg Clk;

	// Outputs
	wire [31:0] Immed;
	wire [31:0] RF_A;
	wire [31:0] RF_B;
	
	// Instantiate the Unit Under Test (UUT)
	DECSTAGE uut (
		.Instr(Instr), 
		.RF_WrEn(RF_WrEn), 
		.ALU_out(ALU_out), 
		.MEM_out(MEM_out), 
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_B_sel(RF_B_sel), 
		.Clk(Clk), 
		.Immed(Immed), 
		.RF_A(RF_A), 
		.RF_B(RF_B)
//		,.Reset(Reset)//added later in part 3, tested in RF_tb, not used
	);
	
	initial begin
		#10;
		Instr = 0;
		RF_WrEn = 1;
		ALU_out = 3;
		MEM_out = 0;
		RF_WrData_sel = 0;
		RF_B_sel = 0;
		Clk = 1;
		#10;
		
		Instr = 1;
		RF_WrEn = 1;
		ALU_out = 4;
		MEM_out = 3;
		RF_WrData_sel = 1;
		RF_B_sel = 0;
		Clk = 1;
		#10;
		
		Instr = 3;
		RF_WrEn = 1;
		ALU_out = 10;
		MEM_out = 3;
		RF_WrData_sel = 0;
		RF_B_sel = 1;
		Clk = 1;
		#10;
		
		Instr = 3;
		RF_WrEn = 1;
		ALU_out = 10;
		MEM_out = 3;
		RF_WrData_sel = 1;
		RF_B_sel = 1;
		Clk = 1;
		
	end
	
	initial begin
		forever #5 Clk = ~Clk;
	end
	initial begin
		$monitor("time = %3d Instr = %b RF_WrEn = %d ALU_out = %d MEM_out = %d RF_WrData_sel = %b RF_B_sel = %b Clk = %b Immed = %d RF_A = %d RF_B = %d\n" , $time,Instr, RF_WrEn,  ALU_out, MEM_out, RF_WrData_sel, RF_B_sel, Clk , Immed, RF_A, RF_B);
	end
      
endmodule

