`include "Opcode.vh"

module ControlDec (input  [6:0]  opcode_i,
                   input  [2:0]  func3_i,
                   input         func2_i,
                   output [15:0] ctrl_o);

  reg [15:0] ctrl_res;
  
  always_comb begin
    case (opcode_i)
  
  	    `OPC_ARI_RTYPE: begin
  	      case (func3_i)
  	        `FNC_ADD_SUB: ctrl_res = func2_i ? 
                                     16'b0001_0110_0000_0001 : 
                                     16'b0001_0000_0000_0001;
            `FNC_SLL:     ctrl_res = 16'b0001_0000_1000_0001;
            `FNC_SLT:     ctrl_res = 16'b0001_0001_0000_0001;
            `FNC_SLTU:    ctrl_res = 16'b0001_0001_1000_0001;
            `FNC_XOR:     ctrl_res = 16'b0001_0010_0000_0001;
            `FNC_SRL_SRA: ctrl_res = func2_i ? 
                                     16'b0001_0110_1000_0001 : 
                                     16'b0001_0010_1000_0001;
  		      `FNC_OR:      ctrl_res = 16'b0001_0011_0000_0001;
  		      `FNC_AND:     ctrl_res = 16'b0001_0011_1000_0001;
  		      default:      ctrl_res = 16'hxxxx;
          endcase
        end
  
  
  	    `OPC_ARI_ITYPE: begin
          case (func3_i)
            `FNC_ADD_SUB: ctrl_res = 16'b0001_0000_0100_0001;
            `FNC_SLL:     ctrl_res = 16'b0001_0000_1100_0001;
            `FNC_SLT:     ctrl_res = 16'b0001_0001_0100_0001;
            `FNC_SLTU:    ctrl_res = 16'b0001_0001_1100_0001;
            `FNC_XOR:     ctrl_res = 16'b0001_0010_0100_0001;
            `FNC_SRL_SRA: ctrl_res = func2_i ? 
                                     16'b0001_0110_1100_0001 : 
                                     16'b0001_0010_1100_0001;
            `FNC_OR:      ctrl_res = 16'b0001_0011_0100_0001;
            `FNC_AND:     ctrl_res = 16'b0001_0011_1100_0001;
  	    	  default:      ctrl_res = 16'hxxxx;
  	      endcase
  	    end
  
      `OPC_BRANCH:        ctrl_res = func3_i[1] ? 
                                     16'b0000_0000_0111_0100 : 
                                     16'b0000_0000_0110_0100;
      `OPC_LOAD:          ctrl_res = func3_i[2] ? 
                                     16'b0000_0000_0101_0001 : 
                                     16'b0000_0000_0100_0001;
  	  `OPC_STORE:         ctrl_res = 16'b0000_1000_0100_0010;
  	  `OPC_AUIPC:         ctrl_res = 16'b0001_0000_0110_0111;
      `OPC_LUI:           ctrl_res = 16'b0001_0111_1110_0111;
      `OPC_JAL:           ctrl_res = 16'b0010_0000_0110_1001;
      `OPC_JALR:          ctrl_res = 16'b0010_0000_0100_0001;
  	  default:            ctrl_res = 16'hxxxx;
    endcase
  end
  
  assign ctrl_o = ctrl_res;

endmodule: ControlDec
