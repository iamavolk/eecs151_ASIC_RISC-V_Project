module mux2 #(
    parameter N = 32
)
(
    input [N-1:0] in0, in1,
    input sel,

    output [N-1:0] out
);

assign out = sel ? in1 : in0;

endmodule
