`include "Opcode.vh"
module imm_generator #(
    parameter N = 32
)
(
    input [N-1:0] instr,
    input [1:0] imm_sel,

    output [N-1:0] imm
);
    wire [2:0] func3 = instr[14:12];
    wire opcode_s_l = instr[4]; // 1 for shift, 0 for load

wire [N-1:0] s_type =
	{{N-12{instr[31]}},
	instr[31:25],
	instr[11:7]};

wire [11:0] i_type = instr[31:20];
wire [4:0] i_star_type = instr[24:20];

wire [N-1:0] u_type =
	{instr[31:12], {12{1'b0}}};

wire [N-1:0] b_type =
	{{N-13{instr[31]}},
	instr[31],
	instr[7],
	instr[30:25],
	instr[11:8],
	1'b0};

wire [N-1:0] i_type_ext =
	((func3 == `FNC_SLTU) && opcode_s_l)?
	{{N-12{instr[31]}}, i_type} :
	((func3 == `FNC_SLL || func3 == `FNC_SRL_SRA) && opcode_s_l ?
	{{N-5{1'b0}}, i_star_type} :
	{{N-12{instr[31]}}, i_type});

mux4 imm_gen(.in0(i_type_ext),
        .in1(s_type),
        .in2(b_type),
        .in3(u_type),
        .sel(imm_sel),
        .out(imm)
);

endmodule
