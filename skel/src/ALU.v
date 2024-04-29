module ALU (input  [31:0] a_i, b_i,
            input  [3:0]  alu_sel_i,
            output [31:0] alu_res_o);

  reg [31:0] res;
  //always_comb begin
  always @(*) begin
      case (alu_sel_i)
          4'b0000: res = a_i + b_i;
          4'b0001: res = a_i << b_i[4:0];
          4'b0011: res = {{31{1'b0}}, (a_i < b_i)};
          4'b0010: res = {{31{1'b0}}, ($signed(a_i) < $signed(b_i))};
          4'b0100: res = a_i ^ b_i;
          4'b0101: res = a_i >> b_i[4:0];
          4'b0110: res = a_i | b_i;
          4'b0111: res = a_i & b_i;
          4'b1100: res = a_i - b_i;
          4'b1101: res = $signed(a_i) >>> b_i[4:0];
          4'b1111: res = b_i;
          default: res = {32{1'b0}};
      endcase
  end
  
  assign alu_res_o = res;

endmodule: ALU
