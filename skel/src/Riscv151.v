`include "const.vh"
`include "Opcode.vh"

module Riscv151(input clk,
                input reset,

                /* Memory system ports */
                // into icache
                output        icache_re,
                output [31:0] icache_addr,
                // into dcache
                output        dcache_re,
                output [31:0] dcache_addr,
                output [31:0] dcache_din,
                output [3:0]  dcache_we,

                // from caches
                input  [31:0] dcache_dout, // From dcache
                input  [31:0] icache_dout, // From icache
                input         stall,       // cache signals to stall pipeline

                output [31:0] csr);


  //`define X0_ADDR 5'b00000

  localparam X0_ADDR = 5'b00000;
  localparam DWIDTH  = 32;
  localparam CWIDTH  = 16;
  localparam HCLEAR  = 16'h0;
  

  //wire [4:0] hella_cnt;
  //WrapCtr wrap_ctr (.clk(clk),
  //                  .reset(reset),
  //                  .enable(1'b1),
  //                  .count(hella_cnt));

  wire no_stall = ~stall;
  //wire no_stall = 1'b1;
  //wire no_stall = (hella_cnt != 4);
  //wire no_stall = (hella_cnt != 4) & (hella_cnt != 5) & (hella_cnt != 6);
  //wire no_stall = (hella_cnt[0] != 1'b0);

  assign icache_re = ~stall;
  //assign icache_re = 1'b1;
  //assign dcache_re = ~stall;
  //assign dcache_re = 1'b0;
  //assign dcache_re = ~stall && ~icache_re && (instr_X[6:0] != `OPC_LOAD) && (instr_X[6:0] != `OPC_STORE);

  wire              csr_we;
  wire [DWIDTH-1:0] csr_dout, csr_din;
  REGISTER_R_CE #(.N(DWIDTH)) csr_reg (.q(csr_dout),
                                       .d(csr_din),
                                       .rst(reset),
                                       .ce(csr_we),
                                       .clk(clk));
  assign csr = csr_dout;
  
  wire [1:0]        pc_select;
  wire [DWIDTH-1:0] pc_IF, jal_select, br_jalr_select, pc_sel_mux_out;
  mux3 #(.N(DWIDTH)) pc_sel_mux (.in0(pc_IF + 4),
                                 .in1(jal_select),
                                 .in2(br_jalr_select),
                                 .sel(pc_select),
                                 .out(pc_sel_mux_out));

  REGISTER_R_CE #(.N(DWIDTH), .INIT(`PC_RESET)) pc_reg (.q(pc_IF),
                                                        .d(pc_sel_mux_out),
                                                        .rst(reset),
                                                        .ce(no_stall),
                                                        .clk(clk));

  wire [DWIDTH-1:0] pc_ID;
  REGISTER_R_CE #(.N(DWIDTH)) pc_IF_ID (.q(pc_ID),
                                        .d(pc_IF),
	                                      .rst(reset),
                                        .ce(no_stall),
	                                      .clk(clk));

  wire [DWIDTH-1:0] instr_IF;
  //assign icache_addr = pc_IF;
  assign icache_addr = no_stall ? pc_IF : pc_IF - 4;
  assign instr_IF = icache_dout;

  wire instr_kill_control;
  wire [1:0] pc_sel_check_ID, pc_select_jalrb_WB;
  InstrKillID InstrKill(.pc_sel_JAL_X_i     (pc_sel_check_ID),
                        .pc_sel_JALR_B_WB_i (pc_select_jalrb_WB),
                        .instr_kill_res_o   (instr_kill_control));


  wire [DWIDTH-1:0] instr_ID;
  wire instr_kill = (pc_IF == `PC_RESET) | instr_kill_control;
  mux2 #(.N(DWIDTH)) instr_kill_mux (.in0(instr_IF),
                                     .in1(`CLEAR_NOP),
                                     .sel(instr_kill),
                                     .out(instr_ID));

  ////////////////////////////////////////////////////
  //
  //     ID Stage BEGIN 
  //
  ////////////////////////////////////////////////////


  localparam RF_AWIDTH = 5;
  wire [RF_AWIDTH-1:0] wa, ra1, ra2;
  wire [DWIDTH-1:0]    wd, rd1, rd2;
  wire                 we;

  //RegFile rf(.data_i   (wd),
  //           .raddra_i (ra1),
  //           .raddrb_i (ra2),
  //           .waddr_i  (wa),
  //           .wen_i    (we),
  //           .clk_i    (clk),
  //           .rst_i    (reset),
  //           .douta_o  (rd1),
  //           .doutb_o  (rd2));

  ASYNC_2R1WRAM_JWSTYLE #(.DEPTH(32), .WIDTH(32)) rf2 (.clk(clk),
                                                       .rst(reset),
                                                       .we(we),
                                                       .waddr0(wa),
                                                       .wdata(wd),
                                                       .raddr0(ra1),
                                                       .raddr1(ra2),
                                                       .rdata0(rd1),
                                                       .rdata1(rd2));
  assign ra1 = instr_ID[19:15];
  assign ra2 = instr_ID[24:20];

  wire [1:0] fw_A;
  wire [DWIDTH-1:0] alu_rs1_res, wb_rs1_res, fwd_ID_rs1_res;
  // FW_ID_MUX_rs1
  mux3 #(.N(DWIDTH)) fw_ID_mux_rs1 (.in0(rd1),
                                    .in1(alu_rs1_res),
                                    .in2(wb_rs1_res),
                                    .sel(fw_A),
                                    .out(fwd_ID_rs1_res));

  wire [1:0] fw_B;
  wire [DWIDTH-1:0] alu_rs2_res, wb_rs2_res, fwd_ID_rs2_res;
  // FW_ID_MUX_rs2
  mux3 #(.N(DWIDTH)) fw_ID_mux_rs2 (.in0(rd2),
                                    .in1(alu_rs2_res),
                                    .in2(wb_rs2_res),
                                    .sel(fw_B),
                                    .out(fwd_ID_rs2_res));

  wire [CWIDTH-1:0] ctrl_ID;
  /* Control Signal Generator 
   * [15:0] = {} */
 // ControlDec CtrlDec(.instr_i (instr_ID),
 //                    .ctrl_o  (ctrl_ID));
  ControlDec CtrlDec(.opcode_i (instr_ID[6:0]),
                     .func3_i  (instr_ID[14:12]),
                     .func2_i  (instr_ID[30]),
                     .ctrl_o   (ctrl_ID));

  wire [DWIDTH-1:0] imm_ID;
  wire [2:0] imm_sel_ID = ctrl_ID[3:1];
  /* Immediate Generator 
  *  Output: value of Immediate in ID stage */
  ImmGen ImmGen(.instr_i   (instr_ID),
                .imm_sel_i (imm_sel_ID[1:0]),
                .imm_o     (imm_ID));

  /* Jump Target Generator early in the ID stage */
  JALTargetID JALTarget (.instr_i         (instr_ID),
                         .pc_i            (pc_ID),
	                       .jal_target_pc_o (jal_select));

  /* Presense of a JAL instr is propagated further down the pipeline
   * into PC-select unit */
  wire [1:0] pc_sel_jal_ID = (instr_ID[6:0] == `OPC_JAL) ? 2'b01 : 2'b00;

  ////////////////////////////////////////////////////
  //
  //     ID Stage END; Pipeline registers BEGIN
  //
  ////////////////////////////////////////////////////
  
  wire [1:0] pc_sel_jal_X;
  REGISTER_R_CE #(.N(2)) pc_sel_jal_ID_X (.q(pc_sel_jal_X),
                                          .d(pc_sel_jal_ID),
                                          .rst(reset),
                                          .ce(no_stall),
                                          .clk(clk));

  assign pc_sel_check_ID = pc_sel_jal_X;

  wire [DWIDTH-1:0] imm_X;
  REGISTER_R_CE #(.N(DWIDTH)) imm_ID_X (.q(imm_X),
                                        .d(imm_ID),
                                        .rst(reset),
                                        .ce(no_stall),
                                        .clk(clk));

  wire [CWIDTH-1:0] ctrl_X_pre;
  REGISTER_R_CE #(.N(CWIDTH)) ctrl_ID_X (.q(ctrl_X_pre),
                                         .d(ctrl_ID),
                                         .rst(reset),
                                         .ce(no_stall),
                                         .clk(clk));

  wire [DWIDTH-1:0] rs1_X;
  REGISTER_R_CE #(.N(DWIDTH)) rs1_ID_X (.q(rs1_X),
                                        .d(fwd_ID_rs1_res),
                                        .rst(reset),
                                        .ce(no_stall),
                                        .clk(clk));

  wire [DWIDTH-1:0] rs2_X;
  REGISTER_R_CE #(.N(DWIDTH)) rs2_ID_X (.q(rs2_X),
                                        .d(fwd_ID_rs2_res),
                                        .rst(reset),
                                        .ce(no_stall),
                                        .clk(clk));

  wire [DWIDTH-1:0] instr_X;
  REGISTER_R_CE #(.N(DWIDTH)) instr_ID_X (.q(instr_X), 
                                          .d(instr_ID),
                                          .rst(reset),
                                          .ce(no_stall),
                                          .clk(clk));

  wire [DWIDTH-1:0] pc_X;
  REGISTER_R_CE #(.N(DWIDTH)) pc_ID_X (.q(pc_X),
	                                     .d(pc_ID),
	                                     .rst(reset),
                                       .ce(no_stall),
	                                     .clk(clk));

  wire [DWIDTH-1:0] csr_uimm_X;
  wire [DWIDTH-1:0] csr_uimm_extend = {27'b0,instr_ID[19:15]};
  REGISTER_R_CE #(.N(DWIDTH)) csr_uImm_ID_X (.q(csr_uimm_X),
                                             .d(csr_uimm_extend),
                                             .rst(reset),
                                             .ce(no_stall),
                                             .clk(clk));

  ////////////////////////////////////////////////////
  //
  //     X Stage BEGIN; Pipeline registers END
  //
  ////////////////////////////////////////////////////
  
  // Ctrl kill mux
  wire [CWIDTH-1:0] ctrl_X;
  wire ctrl_kill_x = pc_select_jalrb_WB == 2'b10;
  mux2 #(.N(CWIDTH)) ctrl_kill_mux (.in0(ctrl_X_pre),
                                    .in1(HCLEAR),
                                    .sel(ctrl_kill_x),
                                    .out(ctrl_X));

  // X-stage control signals
  wire RegWEn_X       = ctrl_X[0];
  /* ctrl_ID[3:1] was used in ID stage, not used in X stage */
  wire BrLUn          = ctrl_X[4];
  wire ASel           = ctrl_X[5];
  wire BSel           = ctrl_X[6];
  wire [3:0] ALUSel_X = ctrl_X[10:7];
  wire MemRW          = ctrl_X[11];

  // Forwarding mux A for BR after LOAD -- fwd into Branch Comparator 
  wire fw_branch_A;
  wire [DWIDTH-1:0] fwd_branch_rs1;
  wire [DWIDTH-1:0] wb_res_br_A;
  mux2 #(.N(DWIDTH)) fwd_br_mux_A (.in0(rs1_X),
                                   .in1(wb_res_br_A),
                                   .sel(fw_branch_A),
                                   .out(fwd_branch_rs1));

  // Forwarding mux B for BR after LOAD -- fwd into Branch Comparator 
  wire fw_branch_B;
  wire [DWIDTH-1:0] fwd_branch_rs2;
  wire [DWIDTH-1:0] wb_res_br_B;
  mux2 #(.N(DWIDTH)) fwd_br_mux_B (.in0(rs2_X),
                                   .in1(wb_res_br_B),
                                   .sel(fw_branch_B),
                                   .out(fwd_branch_rs2));

  /* Branch Comparator 
  *  Outputs: BrLt, BrEq */
  wire BrLt, BrEq;
  BranchComp BranchComp (.br_data0_i(fwd_branch_rs1),
                         .br_data1_i(fwd_branch_rs2),
                         .br_un_i(BrLUn),
                         .br_eq_o(BrEq),
                         .br_lt_o(BrLt));

  // CSR mux 
  wire [DWIDTH-1:0] csr_X;
  mux2 #(.N(DWIDTH)) csr_mux_X (.in0(rs1_X),
                                .in1(csr_uimm_X),
                                .sel(instr_X[14]),
                                .out(csr_X));
  assign csr_din = csr_X;
  assign csr_we = (instr_X[6:0] == `OPC_CSR);
  //assign csr_we = (instr_X[6:0] == `OPC_CSR) & no_stall;

  wire [DWIDTH-1:0] alu_A;
  mux2 #(.N(DWIDTH)) alu_A_mux (.in0(fwd_branch_rs1),
	                              .in1(pc_X),
	                              .sel(ASel),
	                              .out(alu_A));

  wire [DWIDTH-1:0] alu_B;
  mux2 #(.N(DWIDTH)) alu_B_mux (.in0(fwd_branch_rs2),
	                              .in1(imm_X),
	                              .sel(BSel),
	                              .out(alu_B));

  wire [DWIDTH-1:0] alu_res_X;
  ALU alu(.a_i       (alu_A), 
          .b_i       (alu_B), 
          .alu_sel_i (ALUSel_X), 
          .alu_res_o (alu_res_X));

  assign alu_rs1_res    = alu_res_X;
  assign alu_rs2_res    = alu_res_X;
  assign br_jalr_select = alu_res_X;

  wire [1:0] pc_sel_x;
  PCSelect PCSelect (.ctrl_kill_X_i (ctrl_kill_x),
	                   .opcode_X_i    (instr_X[6:0]),
	                   .func3_X_i     (instr_X[14:12]),
                     .pc_sel_ID_i   (pc_sel_jal_ID),
                     .br_eq_i       (BrEq),
                     .br_lt_i       (BrLt),
                     .pc_sel_X_o    (pc_sel_x),
                     .pc_select_o   (pc_select));

  // Mask selector, pre-MEM entry data processing
  wire [3:0] dmem_mask;
  wire [DWIDTH-1:0] rs2_X_shifted;
  wire [1:0] offset = alu_res_X[1:0];
  StoreMask #(.WIDTH(DWIDTH)) StoreMask (.mem_write_X_i   (MemRW),
                                         .func3_2lsb_X_i  (instr_X[13:12]),
                                         .byte_offset_i   (offset),
                                         .data_i          (fwd_branch_rs2),
                                         .mem_wea_mask_o  (dmem_mask),
                                         .data_out_o      (rs2_X_shifted));

  assign dcache_we    = no_stall ? dmem_mask : 4'b0000;
  //assign dcache_we    = dmem_mask;
  //assign dcache_addr  = alu_res_X;
  assign dcache_din   = rs2_X_shifted;

  wire bubble_inside  = ((instr_X == `INST_NOP) || (instr_X == `CLEAR_NOP) || (ctrl_X == HCLEAR)) ? 1'b1: 1'b0;

  ////////////////////////////////////////////////////
  //
  //     X Stage END; Pipeline registers BEGIN
  //
  ////////////////////////////////////////////////////
  
  wire bubble_inside_wb;
  REGISTER_R_CE #(.N(1), .INIT(1'b0)) bubble_X_WB (.q(bubble_inside_wb),
                                                   .d(bubble_inside),
                                                   .rst(reset),
                                                   .ce(no_stall),
                                                   .clk(clk));

  wire [1:0] pc_select_WB;
  REGISTER_R_CE #(.N(2)) pc_select_X_WB (.q(pc_select_WB),
                                         .d(pc_sel_x),
                                         .rst(reset),
                                         .ce(no_stall),
                                         .clk(clk));

  assign pc_select_jalrb_WB = pc_select_WB; 

  wire [DWIDTH-1:0] alu_res_WB;
  REGISTER_R_CE #(.N(DWIDTH)) alu_X_WB (.q(alu_res_WB),
                                        .d(alu_res_X),
                                        .rst(reset),
                                        .ce(no_stall),
                                        .clk(clk));
   
  wire [CWIDTH-1:0] ctrl_WB;
  REGISTER_R_CE #(.N(CWIDTH)) ctrl_X_WB (.q(ctrl_WB),
                                         .d(ctrl_X),
                                         .rst(reset),
                                         .ce(no_stall),
                                         .clk(clk));
   
  wire [DWIDTH-1:0] instr_WB;
  REGISTER_R_CE #(.N(DWIDTH)) instr_X_WB (.q(instr_WB),
                                          .d(instr_X),
                                          .rst(reset),
                                          .ce(no_stall),
                                          .clk(clk));

  wire [DWIDTH-1:0] pc_WB;
  REGISTER_R_CE #(.N(DWIDTH)) pc_X_WB (.q(pc_WB),
                                       .d(pc_X),
                                       .rst(reset),
                                       .ce(no_stall),
                                       .clk(clk));

  ////////////////////////////////////////////////////
  //
  //     WB Stage BEGIN; Pipeline registers END
  //
  ////////////////////////////////////////////////////

  assign dcache_addr  = no_stall ? alu_res_X : alu_res_WB;
  //assign dcache_addr  = alu_res_X;
  
  wire [DWIDTH-1:0] mem_output;
  assign mem_output = dcache_dout;

  wire [DWIDTH-1:0] mem_masked;
  MemLoadMask #(.WIDTH(DWIDTH)) MemLoadMasked (.addr_i           (alu_res_WB[1:0]),
                                               .func3_i          (instr_WB[14:12]),
                                               .mem_res_i        (mem_output),
                                               .mem_res_masked_o (mem_masked));

  wire RegWEn       = ctrl_WB[0];
  wire [1:0] WBSel  = ctrl_WB[13:12];

  // Write-back selector
  wire [DWIDTH-1:0] res_WB;
  mux3 #(.N(DWIDTH)) wb_mux (.in0(mem_masked),
                             .in1(alu_res_WB),
                             .in2(pc_WB + 4),
                             .sel(WBSel),
                             .out(res_WB));

  // Writeback wire forwared to X, ID stages
  assign wb_rs1_res  = res_WB;
  assign wb_rs2_res  = res_WB;
  assign wb_res_br_A = res_WB;
  assign wb_res_br_B = res_WB;

  // RegFile signals. wa = addr0, wd = data0, we is asserted unless rd = x0 
  assign wa = instr_WB[11:7];
  assign wd = res_WB;
  assign we = ((wa == X0_ADDR) || (stall)) ? 1'b0 : RegWEn;

  ForwardingUnit forwarding (.rf_wen_X(RegWEn_X),
                             .rf_wen_WB(RegWEn),
                             .opcode(instr_WB[6:0]),
                             .rd_X(instr_X[11:7]),
                             .rd_WB(instr_WB[11:7]),
                             .rs1_ID(instr_ID[19:15]),
                             .rs2_ID(instr_ID[24:20]),
                             .rs1_X(instr_X[19:15]),
                             .rs2_X(instr_X[24:20]),
                             .fw_ID_A(fw_A), 
                             .fw_ID_B(fw_B),
                             .fw_X_br_A(fw_branch_A),
                             .fw_X_br_B(fw_branch_B));


  //wire [31:0] tiny_cache_data_o;
  //wire [7:0]  tiny_cache_addr_i = {3'b0, hella_cnt};
  //TinyCache tcache (.clk     (clk),
  //                  .reset   (reset),
  //                  .addr_i  (tiny_cache_addr_i),
  //                  .data_i  (instr_IF),
  //                  //.we_i    (hella_cnt == 4),
  //                  .we_i    (1'b1),
  //                  .wmask_i (4'b1111),
  //                  .data_o  (tiny_cache_data_o));

  wire load_in_X    = instr_X[6:0] == `OPC_LOAD;
  wire store_in_X   = instr_X[6:0] == `OPC_STORE;
  assign dcache_re  = ~stall && (load_in_X || store_in_X);
  //assign dcache_re = 1'b1;

endmodule
