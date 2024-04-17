module pc_sel_unit(
    input [15:0] instr_hex,
    input [6:0] opcode,
    input [2:0] func3,
    input [1:0] pc_sel_id,
    input BrEq, BrLt,
    output [1:0] pc_sel_x,
    output [1:0] PCSel
);
    //localparam HBEQ = 16'h0064;
    //localparam HBNE = 16'h4064;
    //localparam HBLT = 16'h8064;
    //localparam HBGE = 16'hC064;
    //localparam HBLTU = 16'h0074;
    //localparam HBGEU = 16'h4074;
    //localparam HJALR = 16'h2041;

    wire jal_id = (pc_sel_id == 2'b01) ? 1'b1 : 1'b0;
    wire br_jalr;
    assign br_jalr =
	//(instr_hex == HBEQ && BrEq) ||
	((opcode == `OPC_BRANCH && func3 == `FNC_BEQ && BrEq) ||
	//(instr_hex == HBNE && ~BrEq) ||
	(opcode == `OPC_BRANCH && func3 == `FNC_BNE && ~BrEq) ||
	//((instr_hex == HBLT || instr_hex == HBLTU) && BrLt) ||
	((opcode == `OPC_BRANCH && (func3 == `FNC_BLT || func3 == `FNC_BLTU)) && BrLt) ||
	//((instr_hex == HBGE || instr_hex == HBGEU) && ~BrLt) ||
	((opcode == `OPC_BRANCH && (func3 == `FNC_BGE || func3 == `FNC_BGEU)) && ~BrLt) ||
	//(instr_hex == HJALR)) && instr_hex != 16'h0000;
	(opcode == `OPC_JALR && func3 == 3'b000)) && (instr_hex != 16'b0);

    assign pc_sel_x = (br_jalr) ? 2'b10 : 2'b00;
    assign PCSel = (br_jalr) ? 2'b10 : (jal_id ? 2'b01 : 2'b00);
endmodule
