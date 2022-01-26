`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:12:10 12/13/2021
// Design Name:   ALU_MODULE
// Module Name:   /home/ise/Desktop/Egrasia/iosif_code/Project1src/ALU_MODULE_tb.v
// Project Name:  Project1src
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_MODULE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_MODULE_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] Op;

	// Outputs
	wire [31:0] Out;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU_MODULE dut (
		.A(A), 
		.B(B), 
		.Op(Op), 
		.Out(Out), 
		.Zero(Zero)
	);

	initial begin
		#10;
		
		// Addition
		$display("ADDITION");

		A = 32'd10;
		B = 32'd01;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'd10;
		B = -32'd01;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = -32'd10;
		B = 32'd01;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = -32'd10;
		B = -32'd01;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

			// Overflow/Underflow
		$display();
		$display("Overflow/Underflow");
		A = 32'h7FFF_FFFF;
		B = 32'h1;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'h8000_0000;
		B = -32'h1;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'hFFFF_FFFF;
		B = 32'h1;
		Op = 4'b0000;
		#5;
		$display("( %d ) + ( %d ) = ( %d ) (in hex 0x%h + 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		$display();
		$display();
		$display();
		// Subtraction
		$display("SUBTRACTION");

		A = 32'd10;
		B = 32'd01;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'd10;
		B = -32'd01;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = -32'd10;
		B = 32'd01;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = -32'd10;
		B = -32'd01;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		// Overflow/Underflow
		$display();
		$display("Overflow/Underflow");
		A = 32'h7FFF_FFFF;
		B = -32'h1;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'h8000_0000;
		B = 32'h1;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);

		A = 32'hFFFF_FFFF;
		B = -32'h1;
		Op = 4'b0001;
		#5;
		$display("( %d ) - ( %d ) = ( %d ) (in hex 0x%h - 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		$display();
		$display();
		$display();
		// Bitwise AND
		$display("Bitwise AND");

		A = 32'd1;
		B = -32'd1;
		Op = 4'b0010;
		#5;
		$display("( %d ) & ( %d ) = ( %d ) (in hex 0x%h & 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		A = 32'hFFFF_0000;
		B = 32'h0000_FFFF;
		Op = 4'b0010;
		#5;
		$display("( %d ) & ( %d ) = ( %d ) (in hex 0x%h & 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		
		$display();
		$display();
		$display();
		// Bitwise OR
		$display("Bitwise OR");

		A = 32'd1;
		B = -32'd1;
		Op = 4'b0011;
		#5;
		$display("( %d ) | ( %d ) = ( %d ) (in hex 0x%h | 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		A = 32'hFFFF_0000;
		B = 32'h0000_FFFF;
		Op = 4'b0011;
		#5;
		$display("( %d ) | ( %d ) = ( %d ) (in hex 0x%h | 0x%h = 0x%h), Zero: %b", $signed(A), $signed(B), $signed(Out), A, B, Out, Zero);
		
		$display();
		$display();
		$display();
		// Complement
		$display("Complement");

		A = 32'hFFFF_FFFF;
		Op = 4'b0100;
		#5;
		$display("!( %d ) = ( %d ) (in hex !0x%h = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// SRA
		$display("Shift Right Arithmetic");

		A = 32'h10;
		Op = 4'b1000;
		#5;
		$display("( %d ) >>> 1 = ( %d ) (in hex 0x%h >>> 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		A = 32'h8000_0000;
		Op = 4'b1000;
		#5;
		$display("( %d ) >>> 1 = ( %d ) (in hex 0x%h >>> 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// SRL
		$display("Shift Right Logical");

		A = 32'h10;
		Op = 4'b1010;
		#5;
		$display("( %d ) >> 1 = ( %d ) (in hex 0x%h >> 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		A = 32'h8000_0000;
		Op = 4'b1010;
		#5;
		$display("( %d ) >> 1 = ( %d ) (in hex 0x%h >> 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		A = 32'h1;
		Op = 4'b1010;
		#5;
		$display("( %d ) >> 1 = ( %d ) (in hex 0x%h >> 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// SLL
		$display("Shift Left Logical");

		A = 32'h01;
		Op = 4'b1001;
		#5;
		$display("( %d ) << 1 = ( %d ) (in hex 0x%h << 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		A = 32'h4000_0000;
		Op = 4'b1001;
		#5;
		$display("( %d ) << 1 = ( %d ) (in hex 0x%h << 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		A = 32'h8000_0000;
		Op = 4'b1001;
		#5;
		$display("( %d ) << 1 = ( %d ) (in hex 0x%h << 1 = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// ROL
		$display("Rotate Left Logical");

		A = 32'h8000_0000;
		Op = 4'b1100;
		#5;
		$display("ROL( %d ) = ( %d ) (in hex ROL( 0x%h ) = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// ROR
		$display("Rotate Right Logical");

		A = 32'h1;
		Op = 4'b1101;
		#5;
		$display("ROR( %d ) = ( %d ) (in hex ROR( 0x%h ) = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
		
		$display();
		$display();
		$display();
		// NOP
		$display("NOP, should give Zero");

		A = 32'hFFFF_FFFF;
		Op = 4'b1111;
		#5;
		$display("NOP( %d ) = ( %d ) (in hex NOP( 0x%h ) = 0x%h), Zero: %b", $signed(A), $signed(Out), A, Out, Zero);
	end
      
endmodule


