module MemLoadMask #(parameter WIDTH = 32)(input  [1:0]       addr_i,
                                           input  [2:0]       func3_i,
                                           input  [WIDTH-1:0] mem_res_i,
                                           output [WIDTH-1:0] mem_res_masked_o);
  localparam BYTE = 8;
  localparam HALF = 16;

  wire [BYTE-1:0] byte_in;
  mux4 #(.N(BYTE)) b_mux (.in0(mem_res_i[7:0]),
                          .in1(mem_res_i[15:8]),
                          .in2(mem_res_i[23:16]),
                          .in3(mem_res_i[31:24]),
                          .sel(addr_i),
                          .out(byte_in));

  wire [HALF-1:0] half_in;
  mux2 #(.N(HALF)) h_mux (.in0(mem_res_i[15:0]), 
                          .in1(mem_res_i[31:16]),
                          .sel(addr_i[1]),
                          .out(half_in)); 

  wire byte_msb = func3_i[2] ? 1'b0 : byte_in[7];
  wire half_msb = func3_i[2] ? 1'b0 : half_in[15];
  wire [WIDTH-1:0] byte_res = {{WIDTH-BYTE{byte_msb}}, byte_in}; 
  wire [WIDTH-1:0] half_res = {{WIDTH-HALF{half_msb}}, half_in}; 

  mux3 #(.N(WIDTH)) res_mux (.in0(byte_res),
                             .in1(half_res),
                             .in2(mem_res_i),
                             .sel(func3_i[1:0]),
                             .out(mem_res_masked_o)); 

endmodule: MemLoadMask
