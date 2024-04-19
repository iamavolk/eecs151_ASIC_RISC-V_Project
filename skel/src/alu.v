module alu #(
    parameter N = 32
)
(
    input [N-1:0] A,
    input [N-1:0] B,
    input [3:0] ALUSel,

    output [N-1:0] ALURes
);

reg [N-1:0] res;
wire msb_a = A[N-1];
wire msb_b = B[N-1];
always @(*) begin
    case (ALUSel)
        4'b0000: res = A + B;
        4'b0001: res = A << B[4:0];
        4'b0011: res = {{N-1{1'b0}}, (A < B)};
        4'b0010: res = {{N-1{1'b0}}, ($signed(A) < $signed(B))};
        4'b0100: res = A ^ B;
        4'b0101: res = A >> B[4:0];
        4'b0110: res = A | B;
        4'b0111: res = A & B;
        4'b1100: res = A - B;
        4'b1101: res = $signed(A) >>> B[4:0];
        4'b1111: res = B;
        default: res = {N{1'b0}};
    endcase
end

assign ALURes = res;
endmodule
