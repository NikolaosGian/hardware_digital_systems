`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:08 01/03/2022
// Design Name:   IFSTAGE
// Module Name:   /home/ise/Desktop/ise_projects/Project2src/IFSTAGE_tb.v
// Project Name:  Project2src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IFSTAGE_tb;

	// Inputs
	reg [31:0] PC_Immed;
	reg PC_sel;
	reg PC_LdEn;
	reg Reset;
	reg Clk;

	// Outputs
	wire [31:0] Instr;
	

		
	time t;
	
	// Instantiate the Unit Under Test (UUT)
	IFSTAGE uut (
		.PC_Immed(PC_Immed), 
		.PC_sel(PC_sel), 
		.PC_LdEn(PC_LdEn), 
		.Reset(Reset), 
		.Clk(Clk), 
		.Instr(Instr)
	);
	initial begin 
		forever #5 Clk = ~Clk;
	end
	
	
	
	initial begin
			/*
				Testing if reading all values at rom.data without PC_Immed enable
			*/
			
			#10;
			
			//Set Clk = 1 , Reset = 1
			PC_Immed = 0;
			PC_sel = 0;
			PC_LdEn = 0;
			Reset = 1;
			Clk = 1;
			#10;
			
			//PC_LdEn = 1  Read all rom.data next value 
			PC_Immed = 0;
			PC_sel = 0;
			PC_LdEn = 1;
			Reset = 0;
			Clk = 1;
			#10;
	end
	

	
	initial begin
			/*
				Testing if reading all values at rom.data with PC_Immed = 2 (int)
			*/
			
			t = 325;
			#335;
			
			
			//Set Clk = 1 , Reset = 1 PC_Immed = 2( int)
			PC_Immed = 4;
			PC_sel = 1;
			PC_LdEn = 0;
			Reset = 1;
			Clk = 1;
			#($time - t);
			
			//PC_LdEn = 1  Read all rom.data with PC_Immed
			PC_Immed = 4;
			PC_sel = 1;
			PC_LdEn = 1;
			Reset = 0;
			Clk = 1;
			#($time - t);
	end
	
	initial begin
		$monitor("time=%3d , PC_Immed = %b , PC_sel = %b , PC_LdEn = %b , Reset = %b Instr = %b \n" , $time ,PC_Immed , PC_sel, PC_LdEn, Reset, Instr);
	end
endmodule

