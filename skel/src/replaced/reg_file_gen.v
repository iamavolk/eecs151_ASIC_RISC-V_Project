module reg_file_gen ( input [31:0]      data_i,
                      input [4:0]       raddra_i, raddrb_i, waddr_i,
                      input             wen_i,
                      input             clk_i,
                      input             rst_i,
                      output reg [31:0] douta_o, doutb_o);

  reg [31:0] regs [31];

  always_comb begin
    case (raddra_i)
      5'b0:     douta_o = 5'b0;
      default:  douta_o = regs[raddra_i];
    endcase
    case (raddrb_i)
      5'b0:     doutb_o = 5'b0;
      default:  doutb_o = regs[raddrb_i];
    endcase
  end
  
  //integer i;
  genvar i;
  generate
    for (i = 0; i < 32; i++) begin: gen_reg_file
      always @(posedge clk_i) begin
        if (rst_i) begin
          regs[i] <= 32'b0;
        end else if (waddr_i != 5'b0 & wen_i) begin
          regs[waddr_i] <= data_i;
        end
      end
    end
  endgenerate

endmodule: reg_file_gen
