// Module: ALU.v
// Desc:   32-bit ALU for the RISC-V Processor
// Inputs: 
//    A: 32-bit value
//    B: 32-bit value
//    ALUop: Selects the ALU's operation 
// 						
// Outputs:
//    Out: The chosen function mapped to A and B.

`include "Opcode.vh"
`include "ALUop.vh"

module ALU( input       [31:0] A,B,
            input       [3:0]  ALUop,
            output reg  [31:0] Out);

  reg [31:0] res;

  always_comb begin
    case (ALUop)
      `ALU_ADD:     res = A + B;                                        // 4'b0000
      `ALU_SUB:     res = A - B;                                        // 4'b0001
      `ALU_AND:     res = A & B;                                        // 4'b0010
      `ALU_OR:      res = A | B;                                        // 4'b0011
      `ALU_XOR:     res = A ^ B;                                        // 4'b0100
      `ALU_SLT:     res = {{31{1'b0}}, ($signed(A) < $signed(B))};      // 4'b0101
      `ALU_SLTU:    res = {{31{1'b0}}, (A < B)};                        // 4'b0110
      `ALU_SLL:     res = A << B[4:0];                                  // 4'b0111
      `ALU_SRA:     res = $signed(A) >>> B[4:0];                        // 4'b1000
      `ALU_SRL:     res = A >> B[4:0];                                  // 4'b1001
      `ALU_COPY_B:  res = B;                                            // 4'b1010
      default:      res = {32{1'bx}};
    endcase
  end

  assign Out = res;

endmodule
