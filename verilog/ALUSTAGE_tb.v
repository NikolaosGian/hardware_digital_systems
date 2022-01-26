`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:16:55 01/03/2022
// Design Name:   ALUSTAGE
// Module Name:   /home/ise/Desktop/ise_projects/Project2src/ALUSTAGE_tb.v
// Project Name:  Project2src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUSTAGE_tb;

	// Inputs
	reg [31:0] RF_A;
	reg [31:0] RF_B;
	reg [31:0] Immed;
	reg ALU_Bin_sel;
	reg [3:0] ALU_func;
	

	// Outputs
	wire [31:0] ALU_out;

	// Instantiate the Unit Under Test (UUT)
	ALUSTAGE uut (
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.Immed(Immed), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.ALU_out(ALU_out)
	);

	initial begin
		RF_A = 0;
		RF_B = 0;
		Immed = 0;
		ALU_Bin_sel = 0;
		ALU_func = 0;
		#10;
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b0000;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b0001;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b0010;
		#10;
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b0011;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b0100; // !RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b1000; // SLL RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b1010; // SLR RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b1001; // SLR RF_A
		#10;
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b1100; // rotate aristera
		#10;	

		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 0;
		ALU_func = 4'b1101; // rotate de3ia
		#10;
		
		
		///////////////////////
		RF_A = 0;
		RF_B = 0;
		Immed = 0;
		ALU_Bin_sel = 1;
		ALU_func = 0;
		#10
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0000;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0001;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0010;
		#10;
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0011;
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b0100; // !RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b1000; // SLL RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b1010; // SLR RF_A
		#10;

	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b1001; // SLR RF_A
		#10;
		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b1100; // rotate aristera
		#10;	

		
	   RF_A = 1;
		RF_B = 2;
		Immed = 5;
		ALU_Bin_sel = 1;
		ALU_func = 4'b1101; // rotate de3ia
		#10;
		
	
		
	end
    
	initial begin
		$monitor("time = %3d RF_A = %b RF_B = %b Immed = %b ALU_func = %b ALU_Bin_sel = %b ALU_out = %b \n" , $time, RF_A, RF_B, Immed , ALU_func, ALU_Bin_sel, ALU_out);
	end
endmodule

