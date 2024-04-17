// Module: ALUdecoder
// Desc:   Sets the ALU operation
// Inputs: opcode: the top 6 bits of the instruction
//         funct: the funct, in the case of r-type instructions
//         add_rshift_type: selects whether an ADD vs SUB, or an SRA vs SRL
// Outputs: ALUop: Selects the ALU's operation
//

`include "Opcode.vh"
`include "ALUop.vh"

module ALUdec( input       [6:0] opcode,
               input       [2:0] funct,
               input             add_rshift_type,
               output reg  [3:0] ALUop);

  always_comb begin
    case (opcode)
      `OPC_ARI_RTYPE, 
      `OPC_ARI_ITYPE:
        case(funct)
          `FNC_SLL:         ALUop = `ALU_SLL;
          `FNC_SLT:         ALUop = `ALU_SLT;
          `FNC_SLTU:        ALUop = `ALU_SLTU;
          `FNC_XOR:         ALUop = `ALU_XOR;
          `FNC_OR:          ALUop = `ALU_OR;
          `FNC_AND:         ALUop = `ALU_AND;
          `FNC_ADD_SUB:
            if (opcode == `OPC_ARI_RTYPE) begin
                            ALUop = (add_rshift_type == `FNC2_ADD) ? `ALU_ADD: 
                                    (add_rshift_type == `FNC2_SUB) ? `ALU_SUB: 
                                                                     `ALU_XXX;
            end else if (opcode == `OPC_ARI_ITYPE) begin
                            ALUop = `ALU_ADD;
            end else        ALUop = `ALU_XXX;
          `FNC_SRL_SRA:
                            ALUop = (add_rshift_type == `FNC2_SRL) ? `ALU_SRL:
                                    (add_rshift_type == `FNC2_SRA) ? `ALU_SRA:
                                                                     `ALU_XXX;
            default:        ALUop = `ALU_XXX;
        endcase
      `OPC_AUIPC:           ALUop = `ALU_ADD;
      `OPC_JAL:             ALUop = `ALU_ADD;
      `OPC_JALR:            ALUop = `ALU_ADD;
      `OPC_BRANCH:          ALUop = `ALU_ADD;
      `OPC_STORE:           ALUop = `ALU_ADD;
      `OPC_LOAD:            ALUop = `ALU_ADD;
      `OPC_LUI:             ALUop = `ALU_COPY_B;
      default:              ALUop = `ALU_XXX;
    endcase
  end

endmodule
