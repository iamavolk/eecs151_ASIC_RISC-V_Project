module instr_kill_unit(
    input [1:0] pc_select_jal_x,
    input [1:0] pc_select_jalr_b_wb,
    output instr_kill_res
);
    assign instr_kill_res = 
        ((pc_select_jal_x == 2'b01) || (pc_select_jalr_b_wb == 2'b10)) ? 1'b1 : 1'b0;
endmodule
