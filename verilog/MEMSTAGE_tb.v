`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:15:41 01/03/2022
// Design Name:   MEMSTAGE
// Module Name:   /home/ise/Desktop/ise_projects/Project2src/MEMSTAGE_tb.v
// Project Name:  Project2src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEMSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEMSTAGE_tb;

	// Inputs
	reg clk;
	reg Mem_WrEn;
	reg [31:0] ALU_MEM_Addr;
	reg [31:0] MEM_DataIn;

	// Outputs
	wire [31:0] MEM_DataOut;

	// Instantiate the Unit Under Test (UUT)
	MEMSTAGE uut (
		.clk(clk), 
		.Mem_WrEn(Mem_WrEn), 
		.ALU_MEM_Addr(ALU_MEM_Addr), 
		.MEM_DataIn(MEM_DataIn), 
		.MEM_DataOut(MEM_DataOut)
	);
	initial begin 
		forever #5 clk = ~clk;
	end
	

	initial begin
		#10;
		// Write ad Addres = 1 (int)
		clk = 1;
		Mem_WrEn = 1; 
		ALU_MEM_Addr = 1;
		MEM_DataIn = 5;
		#10;
		// Read from Address 1 (int)
		clk = 1;
		Mem_WrEn = 0; 
		ALU_MEM_Addr = 1;
		#10;
		
		
		// Write ad Addres  2(int)
		clk = 1;
		Mem_WrEn = 1; 
		ALU_MEM_Addr = 2;
		MEM_DataIn = 500;
		#10;
		// Read from Address 2 (int)
		clk = 1;
		Mem_WrEn = 0; 
		ALU_MEM_Addr = 2;
		#10;
		
		// Write ad Addres  3(int)
		clk = 1;
		Mem_WrEn = 1; 
		ALU_MEM_Addr = 3;
		MEM_DataIn = -32;
		#10;
		// Read from Address 3 (int)
		clk = 1;
		Mem_WrEn = 0; 
		ALU_MEM_Addr = 3;
		#10;
		
		// Write ad Addres 4(int)
		clk = 1;
		Mem_WrEn = 1; 
		ALU_MEM_Addr = 4;
		MEM_DataIn = -60;
		#10;
		// Read from Address 3 (int)
		clk = 1;
		Mem_WrEn = 0; 
		ALU_MEM_Addr = 4;
		#10;
	end
	
	initial begin
		$monitor("time=%3d , clk = %b , Mem_WrEn = %b , ALU_MEM_Addr = %b , MEM_DataIn = %b MEM_DataOut = %b \n" , $time ,clk , Mem_WrEn, ALU_MEM_Addr, MEM_DataIn, MEM_DataOut);
	end
      
endmodule

