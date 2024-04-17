module mux4 #(
    parameter N = 32
)
(
    input [N-1:0] in0, in1, in2, in3,
    input [1:0] sel,

    output [N-1:0] out
);
reg [N-1:0] res;

always @(*) begin
    case (sel)
        2'b00: res = in0;
        2'b01: res = in1;
        2'b10: res = in2;
        2'b11: res = in3;
        default: res = {N{1'bx}};
    endcase
end
assign out = res;

endmodule
