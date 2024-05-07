module mux3 #(parameter N = 32)(input  [N-1:0] in0, in1, in2,
                                input  [1:0]   sel,
                                output [N-1:0] out);
  reg [N-1:0] res;

  always_comb begin
    case (sel)
        2'b00: res = in0;
        2'b01: res = in1;
        2'b10: res = in2;
        default: res = {N{1'bx}};
    endcase
  end
  assign out = res;

endmodule: mux3
