module JALTargetID (input  [31:0] instr_i,
                    input  [31:0] pc_i,
                    output [31:0] jal_target_pc_o);

  wire [31:0] imm;
  assign imm = {{11{instr_i[31]}}, instr_i[31], instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0};
  assign jal_target_pc_o = pc_i + imm;

endmodule: JALTargetID
