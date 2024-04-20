`include "Opcode.vh"
module ForwardingUnit(input rf_wen_X, rf_wen_WB,
                      input [4:0] rd_X,
                      input [4:0] rd_WB,
                      input [4:0] rs1_ID,
                      input [4:0] rs2_ID,
                      input [4:0] rs1_X,
                      input [4:0] rs2_X,
                      input [6:0] opcode,
                      output [1:0] fw_ID_A, fw_ID_B,
                      output fw_X_br_A, fw_X_br_B);

  assign fw_ID_A = ((rf_wen_WB & (rd_WB != 5'd0)) 
                      && 
                    !(rf_wen_X & (rd_X != 5'd0) & (rd_X == rs1_ID)) 
                      &&
                    (rd_WB == rs1_ID)) ? 2'b10 : ((rf_wen_X & (rd_X != 5'd0) & (rd_X == rs1_ID)) ? 2'b01 : 2'b00); 
  
  assign fw_ID_B = (rf_wen_WB & (rd_WB != 5'd0) 
                      &&                                 
                    !(rf_wen_X & (rd_X != 5'd0) & (rd_X == rs2_ID)) 
                      &&
                    (rd_WB == rs2_ID)) ? 2'b10 : ((rf_wen_X & (rd_X != 5'd0) & (rd_X == rs2_ID)) ? 2'b01 : 2'b00); 

  assign fw_X_br_A = (opcode == `OPC_LOAD) & (rd_WB != 5'd0) & (rd_WB == rs1_X);
  assign fw_X_br_B = (opcode == `OPC_LOAD) & (rd_WB != 5'd0) & (rd_WB == rs2_X);

endmodule: ForwardingUnit
