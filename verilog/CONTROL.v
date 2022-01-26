`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:44 12/21/2021 
// Design Name: 
// Module Name:    CONTROL 
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
module CONTROL(
    output reg PC_sel,
    output reg PC_LdEn,
    output reg RF_WrData_sel,
    output reg RF_B_sel,
	 output reg RF_WrEn,
    output reg ALU_Bin_sel,
    output reg [3:0] ALU_func,
    output reg MEM_WrEn,
    input wire [31:0] Instr,
	 input wire Zero,
    input wire Clk,
    input wire Reset
    );

//Localparams for each opcode	 
localparam alu = 6'b100000; //opcode for R type commands

localparam li = 6'b111000;
localparam lui = 6'b111001;
localparam addi = 6'b110000;
localparam andi = 6'b110010;
localparam ori = 6'b110011;

localparam b = 6'b111111;
localparam beq = 6'b000000;
localparam bne = 6'b000001;

localparam lb = 6'b000011;
localparam sb = 6'b000111;
localparam lw = 6'b001111;
localparam sw = 6'b011111;


//Localparams for ALU function control (input ALU_func)
localparam add = 4'b0000;
localparam sub = 4'b0001;
localparam bw_and = 4'b0010;
localparam bw_or = 4'b0011;
localparam bw_not = 4'b0100;
localparam sra = 4'b1000;
localparam srl = 4'b1010;
localparam sll = 4'b1001;
localparam rol = 4'b1100;
localparam ror = 4'b1101;

/*
//Localparams for the given states (4 bits, >8 states)
localparam i_fetch = 4'b0000;
localparam decode_rr = 4'b1000;
localparam branch = 4'b1010;
localparam mem_addr = 4'b1100;
localparam mem_wr = 4'b1101;
localparam mem_rd = 4'b1110;
localparam ld_wb = 4'b1111;
localparam alu_exec = 4'b1001;
localparam alu_wb = 4'b1011;
*/

//Localparams for more easy and readable mux control
//RF muxes
localparam read_rt = 1'b0;
localparam read_rd = 1'b1;
localparam from_ALU = 1'b0;
localparam from_MEM = 1'b1;
//IF mux
localparam next_instr = 1'b0;
localparam jump = 1'b1;
//ALU mux
localparam alu_regB = 1'b0;
localparam alu_immed = 1'b1;

//Localparams for impemented states (3 bits, 8 states)
localparam i_fetch = 3'b000;
localparam branch = 3'b111;
localparam mem_wr = 3'b001;
localparam mem_rd = 3'b011;
localparam ld_wb = 3'b010;
localparam alu_wb = 3'b100;
localparam comb_exec = 3'b101;
localparam i_load = 3'b110;

//reg [3:0] next_state, current_state;
reg [2:0] next_state, current_state;

//Combinatinal logic that dictates the next state
//based on the given instruction and current state
always @(current_state or Reset or Instr) begin : NEXT_STATE_LOGIC
	if (Reset) begin
		next_state = i_fetch;
		end
	else
		begin
			case (current_state)
							
					i_fetch:	next_state = i_load;
					
					i_load: next_state = comb_exec;
					
               comb_exec:  begin
                                case (Instr[31:26])
                                    alu, li, lui, addi, andi, ori: begin
															if (Instr[20:16] == 5'b00000)	//check if rd == r0. if true, skip instr
																next_state = i_fetch;
															else
																next_state = alu_wb;
														end
                                    lb, lw: begin
															if (Instr[20:16] == 5'b00000)	//check if rd == r0. if true, skip instr
																next_state = i_fetch;
															else
																next_state = mem_rd;
													end
                                    sb, sw: next_state = mem_wr;
                                    b, beq, bne: begin
															if (Instr[15:0] == 16'h0000)	//check if immediate part == 0. if true, skip instr. 
																next_state = i_fetch;		//this is because beq shares the same opcode with NOP
															else
																next_state = branch;
													end
                                    default:    begin
														next_state = i_fetch;
														$display("[%t]Unknown OPCODE given or NOP, CHANGED AT COMB_EXEC %b", $time, Instr);
											    end
                                endcase
                            end 

				branch: 	begin
								next_state = i_fetch;
							end
				
				
				mem_wr: 	begin
								next_state = i_fetch;
							end
				
				mem_rd: 	begin
								next_state = ld_wb;
							end
				
				ld_wb: 	begin
								next_state = i_fetch;
							end
				
				alu_wb: 	begin
								next_state = i_fetch;
							end
							
				default: 	begin
							next_state = i_fetch;
							$display("[%t]Unknown Next State, SHOULD NOT HAPPEN", $time);
							end
			endcase
		end
end


//State FFs implementation
always @(posedge Clk) begin : STATE_MEMORY
	if (Reset)
		current_state <= i_fetch;
	else
		current_state <= next_state;
end


//Combinatinal logic that dictates the output for datapath control
//based on the given instruction, current state and output Zero (in case of conditional branching)
always @(current_state or Zero or Instr or Reset) begin : CURRENT_STATE_LOGIC
if (Reset) begin
								PC_LdEn = 1'b0;
								PC_sel = 1'b0;
								RF_WrData_sel = 1'b0;
								RF_B_sel = 1'b0;
								RF_WrEn = 1'b0;
								ALU_Bin_sel = 1'b0;
								ALU_func = 4'b0000;
								MEM_WrEn = 1'b0;
end
else begin
	case (current_state)			
				i_fetch:	begin
								PC_LdEn = 1'b1;	//updates the value of PC at the next clock
								RF_WrEn = 1'b0;	//disables the ability to write to RF
								MEM_WrEn = 1'b0;	//disables the ability to write to MEM
							end
							
				i_load:	begin
								PC_LdEn = 1'b0;	//PC has already been updated, load the new instruction from IMEM
								RF_WrEn = 1'b0;	//(optional)
								MEM_WrEn = 1'b0;	//(optional)
							end
				
                comb_exec:  begin
                                PC_LdEn = 1'b0;	//(optional)
                                
                                case (Instr[31:26])
                                    b, beq, bne:   begin
                                       RF_B_sel = read_rd;			//read from rd for comparison
                                       ALU_Bin_sel = alu_regB;		//read from RF
                                       ALU_func = sub;				//execute subtraction between $rs and $rd
                                    end
                                    sb, sw, lb, lw, lui, li: begin
													RF_B_sel = read_rd;			//read rd for storing to MEM, not needed for writing to RF
													ALU_Bin_sel = alu_immed;	//read from Immediate
													ALU_func = add;				//execute addition (Immed + 0 in the case of li, lui, as $rs = 0)
                                    end
                                    addi, andi, ori:	begin
                                       RF_B_sel = read_rd;			//read from rd
													ALU_Bin_sel = alu_immed;	//read from Immediate
													ALU_func = Instr[29:26];	//execute operation according to the instruction
												end
                                    alu:	begin
													RF_B_sel = read_rt;			//read from rt
													ALU_Bin_sel = alu_regB;		//read from RF
													ALU_func = Instr[3:0];		//execute operation according to the instruction
												end
                                    default: 	begin
													PC_sel = 1'bx;
													PC_LdEn = 1'bx;
													RF_WrData_sel = 1'bx;
													RF_B_sel = 1'bx;
													RF_WrEn = 1'bx;
													ALU_Bin_sel = 1'bx;
													ALU_func = 4'bxxxx;
													MEM_WrEn = 1'bx;
													$display("[%t]Unknown State in general (look at NEXT_STATE_LOGIC), SHOULD NOT HAPPEN", $time);
													//$finish();
												end
                                endcase
                end 

				//final states, branch, alu_wb, ld_wb, mem_wr dictate the value of PC_sel
				branch: 	begin
								case (Instr[31:26])							//dictates the next value of PC, branches if condition is met
									b:		begin
												PC_sel = jump;
											end
									beq:	begin
												if (Zero) PC_sel = jump;
												else PC_sel = next_instr;
											end
									bne:	begin
												if (~Zero) PC_sel = jump;
												else PC_sel = next_instr;
											end
									default: begin
												PC_sel = 1'bx;
												PC_LdEn = 1'bx;
												RF_WrData_sel = 1'bx;
												RF_B_sel = 1'bx;
												RF_WrEn = 1'bx;
												ALU_Bin_sel = 1'bx;
												ALU_func = 4'bxxxx;
												MEM_WrEn = 1'bx;
												$display("[%t]Unknown State at BRANCH, SHOULD NOT HAPPEN", $time);
												//$finish();
												end
								endcase
							end
				
				mem_wr:	begin
								PC_sel = 1'b0;		//load next instruction's address at the next clock
								MEM_WrEn = 1'b1;	//enable the ability to write to the MEM
							end
				
				mem_rd: 	begin
								MEM_WrEn = 1'b0;	//enable the ability to read from the MEM (optional)
							end
				
				ld_wb: 	begin
								PC_sel = 1'b0;
								RF_WrData_sel = from_MEM;	//read the value returned from MEM
								RF_WrEn = 1'b1;				//enable the ability to write in RF
							end
				
				alu_wb: 	begin
								PC_sel = 1'b0;
                        RF_WrData_sel = from_ALU;	//read the value returned from ALU
                        RF_WrEn = 1'b1;
							end
				
				default: 	begin
							PC_sel = 1'bx;
							PC_LdEn = 1'bx;
							RF_WrData_sel = 1'bx;
							RF_B_sel = 1'bx;
							RF_WrEn = 1'bx;
							ALU_Bin_sel = 1'bx;
							ALU_func = 4'bxxxx;
							MEM_WrEn = 1'bx;
							$display("[%t]Unknown State in general (look at NEXT_STATE_LOGIC), SHOULD NOT HAPPEN", $time);
							//$finish();
							end
		endcase
end
end

endmodule
