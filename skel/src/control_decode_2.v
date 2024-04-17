`include "Opcode.vh"
module control_decode_2(
    input [31:0] instr,
    output [15:0] hex_control
);

reg [15:0] hex_control_res;

wire [6:0] opcode = instr[6:0];
wire [2:0] func3 = instr[14:12];
wire func2 = instr[30];

always @(*) begin
    case (opcode)
	`OPC_ARI_RTYPE: begin
	    case (func3)
	        `FNC_ADD_SUB:
                    if (func2 == `FNC2_ADD) hex_control_res = 16'h1001;
                    else if (func2 == `FNC2_SUB) hex_control_res = 16'h1601;
                `FNC_SLL: hex_control_res = 16'h1081;
                `FNC_SLT: hex_control_res = 16'h1101;
                `FNC_SLTU: hex_control_res = 16'h1181;
                `FNC_XOR: hex_control_res = 16'h1201;
                `FNC_SRL_SRA:
		   if (func2 == `FNC2_SRL) hex_control_res = 16'h1281;
		    else if (func2 == `FNC2_SRA) hex_control_res = 16'h1681;
		`FNC_OR: hex_control_res = 16'h1301;
		`FNC_AND: hex_control_res = 16'h1381;
		default: hex_control_res = 16'bx;
            endcase
        end
	`OPC_LOAD: begin
	    case (func3)
		`FNC_LB: hex_control_res = 16'h0041;
		`FNC_LH: hex_control_res = 16'h0041;
		`FNC_LW: hex_control_res = 16'h0041;
		`FNC_LBU: hex_control_res = 16'h0051;
		`FNC_LHU: hex_control_res = 16'h0051;
		default: hex_control_res = 16'bx;
	    endcase
	end
	`OPC_ARI_ITYPE: begin
            case (func3)
                `FNC_ADD_SUB: hex_control_res = 16'h1041;
                `FNC_SLL: hex_control_res = 16'h10C1;
                `FNC_SLT: hex_control_res = 16'h1141;
                `FNC_SLTU: hex_control_res = 16'h11C1;
                `FNC_XOR: hex_control_res = 16'h1241;
                `FNC_SRL_SRA:
                    if (func2 == `FNC2_SRL) hex_control_res = 16'h12C1;
                    else if (func2 == `FNC2_SRA) hex_control_res = 16'h16C1;
                `FNC_OR: hex_control_res = 16'h1341;
                `FNC_AND: hex_control_res = 16'h13C1;
		default: hex_control_res = 16'bx;
	    endcase
	end
	`OPC_STORE: begin
	    case (func3)
		`FNC_SB: hex_control_res = 16'h0842;
		`FNC_SH: hex_control_res = 16'h0842;
		`FNC_SW: hex_control_res = 16'h0842;
                default: hex_control_res = 16'bx;
	    endcase
	end
	`OPC_BRANCH: begin
	    case (func3)
		`FNC_BEQ: hex_control_res = 16'h0064;
		`FNC_BNE: hex_control_res = 16'h4064;
		`FNC_BLT: hex_control_res = 16'h8064;
		`FNC_BGE: hex_control_res = 16'hC064;
		`FNC_BLTU: hex_control_res = 16'h0074;
		`FNC_BGEU: hex_control_res = 16'h4074;
                default: hex_control_res = 16'bx;
	    endcase
	end
	`OPC_AUIPC: hex_control_res = 16'h1067;
        `OPC_LUI: hex_control_res = 16'h17E7;
        `OPC_JAL: hex_control_res = 16'h2069;
        `OPC_JALR: hex_control_res = 16'h2041;
	//default: ROMIn_res = 6'bxxxxxx;	// was here before I introduced CLEAR_NOP 
	default: hex_control_res = 16'h0080;	// undefined
    endcase
end

assign hex_control = hex_control_res;

endmodule
