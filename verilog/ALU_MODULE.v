`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:01 12/04/2021 
// Design Name: 
// Module Name:    ALU_MODULE 
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
module ALU_MODULE(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Op,
    output reg [31:0] Out,
    output reg Zero
    );

always @(*) begin
	case (Op)
		4'b0000: Out = A + B;
		4'b0001: Out = A - B;
		4'b0010: Out = A & B;
		4'b0011: Out = A | B;
		4'b0100: Out = ~A;
		4'b1000: begin
						Out = A >> 1;
						Out[31] = A[31];
					end
		4'b1010: Out = A >> 1;
		4'b1001: Out = A << 1;
		4'b1100: begin
						Out = A << 1;
						Out[0] = A[31];
					end
		4'b1101: begin
						Out = A >> 1;
						Out[31] = A[0];
					end
		default: Out = 32'hxxxx_xxxx;
	endcase
	
	Zero = ~|Out;
end

endmodule
