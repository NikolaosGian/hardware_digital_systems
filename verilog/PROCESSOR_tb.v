`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:09:44 01/13/2022
// Design Name:   PROCESSOR
// Module Name:   /home/ise/Project3src/PROCESSOR_tb.v
// Project Name:  Project3src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_tb;

	// Inputs
	reg Reset;
	reg Clk;

	// Outputs
	wire [31:0] Instr;
	wire PC_sel;
	wire PC_LdEn;
	wire RF_WrEn;
	wire RF_WrData_sel;
	wire ALU_Bin_sel;
	wire [3:0] ALU_func;
	wire MEM_WrEn;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.Instr(Instr), 
		.PC_sel(PC_sel), 
		.PC_LdEn(PC_LdEn),
		.RF_WrEn(RF_WrEn), 
		.RF_WrData_sel(RF_WrData_sel), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.MEM_WrEn(MEM_WrEn), 
		.Reset(Reset), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		Reset = 1;
		Clk = 1;
		
		#30;
		Reset = 0;
        
		// Add stimulus here
		
	end
	
	initial begin
		forever #5 Clk = ~Clk;
	end
      
endmodule

