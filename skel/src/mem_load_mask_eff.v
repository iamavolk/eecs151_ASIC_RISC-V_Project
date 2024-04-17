module mem_load_mask_eff #(
    parameter WIDTH = 32
) (
    input [1:0] addr,
    input [2:0] func3,
    input [WIDTH-1:0] mem_res,
    output [WIDTH-1:0] mem_masked_out
);
    localparam BYTE = 8;
    localparam HALF = 16;

    wire [BYTE-1:0] byte_in;
    mux4 #(.N(BYTE))
    b_mux (.in0(mem_res[7:0]),
           .in1(mem_res[15:8]),
           .in2(mem_res[23:16]),
           .in3(mem_res[31:24]),
           .sel(addr),
           .out(byte_in));

    wire [HALF-1:0] half_in;
    mux2 #(.N(HALF))
    h_mux (.in0(mem_res[15:0]), 
           .in1(mem_res[31:16]),
           .sel(addr[1]),
           .out(half_in)); 

    wire byte_msb;
    mux2 #(.N(1))
    b_sign_mux (.in0(byte_in[7]), 
                .in1(1'b0),
                .sel(func3[2]),
                .out(byte_msb)); 

    wire half_msb;
    mux2 #(.N(1))
    h_sign_mux (.in0(half_in[15]), 
                .in1(1'b0),
                .sel(func3[2]),
                .out(half_msb)); 
    
    wire [WIDTH-1:0] byte_res = {{WIDTH-BYTE{byte_msb}}, byte_in}; 
    wire [WIDTH-1:0] half_res = {{WIDTH-HALF{half_msb}}, half_in}; 
    mux3 #(.N(WIDTH))
    res_mux (.in0(byte_res),
             .in1(half_res),
             .in2(mem_res),
             .sel(func3[1:0]),
             .out(mem_masked_out)); 
endmodule
