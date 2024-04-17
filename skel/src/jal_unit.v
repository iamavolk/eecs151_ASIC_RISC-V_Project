module jal_unit(
    input [31:0] instr,
    input [31:0] pc,
    output [31:0] jal_pc
);
    wire [31:0] imm;
    assign imm =
	{{11{instr[31]}},
    instr[31],
	instr[19:12],
	instr[20],
	instr[30:21],
	1'b0};
    assign jal_pc = pc + imm;
endmodule
