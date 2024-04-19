`include "Opcode.vh"

module ImmGen(input  [31:0] instr_i,
              input  [1:0]  imm_sel_i,
              output [31:0] imm_o);

  wire [2:0] func3    = instr_i[14:12];
  wire opcode_s_l     = instr_i[4];

  wire [31:0] s_type  = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
  wire [31:0] u_type  = {instr_i[31:12], {12{1'b0}}};
  wire [31:0] b_type  = {{19{instr_i[31]}}, instr_i[31], instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};

  wire [11:0] i_imm       = instr_i[31:20];
  wire [4:0]  i_star_imm  = instr_i[24:20];
  wire [31:0] i_type      = ((func3 == `FNC_SLTU) && opcode_s_l) ? {{20{instr_i[31]}}, i_imm} 
                            : ((func3 == `FNC_SLL || func3 == `FNC_SRL_SRA) && opcode_s_l ? {{27{1'b0}}, i_star_imm} 
                            : {{20{instr_i[31]}}, i_imm});

  mux4 ImmGenMux(.in0(i_type),
                 .in1(s_type),
                 .in2(b_type),
                 .in3(u_type),
                 .sel(imm_sel_i),
                 .out(imm_o));

endmodule: ImmGen
