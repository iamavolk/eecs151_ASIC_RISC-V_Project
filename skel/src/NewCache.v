`include "util.vh"
`include "const.vh"
`include "CacheStates.vh"

module NewCache # (parameter LINES = 64,
                parameter CPU_WIDTH = `CPU_INST_BITS,
                parameter WORD_ADDR_BITS = `CPU_ADDR_BITS-`ceilLog2(`CPU_INST_BITS/8))
 (input clk,
  input reset,

  input                       cpu_req_valid,
  output                      cpu_req_ready, // v
  input [WORD_ADDR_BITS-1:0]  cpu_req_addr,

  input [CPU_WIDTH-1:0]       cpu_req_data,
  input [3:0]                 cpu_req_write,

  output                      cpu_resp_valid, // ?
  output [CPU_WIDTH-1:0]      cpu_resp_data,  // v 

  output                           mem_req_valid, // v
  input                            mem_req_ready,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mem_req_addr, // v
  //output [27:0] mem_req_addr,
  output                           mem_req_rw, // v
  output                           mem_req_data_valid, // v
  input                            mem_req_data_ready,
  output [`MEM_DATA_BITS-1:0]      mem_req_data_bits, // v
  // byte level masking
  output [(`MEM_DATA_BITS/8)-1:0]  mem_req_data_mask, // v

  input                            mem_resp_valid,
  input [`MEM_DATA_BITS-1:0]       mem_resp_data);

  // Implement your cache here, then delete this comment

  wire [19:0] tag_T           = cpu_req_addr[29:10];
  wire [5:0]  index_I         = cpu_req_addr[9:4];
  wire [3:0]  block_offset_O  = cpu_req_addr[3:0];
  wire [7:0]  sram_index      = {index_I, block_offset_O[3:2]};
  wire [1:0]  phys_sram_sel   = cpu_req_addr[1:0];

  reg meta_we;
  reg meta_wmask;
  reg [31:0] meta_dv_tag_in;
  reg [31:0] meta_dv_tag_out;
  reg sram_00_we, sram_01_we, sram_10_we, sram_11_we;
  //reg [3:0] sram_00_wmask, sram_01_wmask, sram_10_wmask, sram_11_wmask;
  reg sram_we;
  reg [3:0] sram_wmask;
  reg [31:0] sram_00_din, sram_01_din, sram_10_din, sram_11_din;
  reg [31:0] sram_00_dout, sram_01_dout, sram_10_dout, sram_11_dout;

  sram22_64x32m4w32 meta (.clk   (clk),
                          .we    (meta_we),
                          .wmask (meta_wmask),
                          .addr  (index_I),
                          .din   (meta_dv_tag_in),
                          .dout  (meta_dv_tag_out));

  sram22_256x32m4w8 sram_00 (.clk   (clk),
                             .we    (sram_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index),
                             .din   (sram_00_din),
                             .dout  (sram_00_dout));

  sram22_256x32m4w8 sram_01 (.clk   (clk),
                             .we    (sram_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index),
                             .din   (sram_01_din),
                             .dout  (sram_01_dout));

  sram22_256x32m4w8 sram_10 (.clk   (clk),
                             .we    (sram_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index),
                             .din   (sram_10_din),
                             .dout  (sram_10_dout));

  sram22_256x32m4w8 sram_11 (.clk   (clk),
                             .we    (sram_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index),
                             .din   (sram_11_din),
                             .dout  (sram_11_dout));

  reg [3:0]   state, next_state;
  reg         cpu_request_ready;  // cache is ready to accept new request from cpu
  reg         cpu_response_valid; // cache has output valid data after mem read
  reg [31:0]  cpu_response_data; // data requested by cpu

  reg         mem_request_valid; // cache asking memory for transaction
  reg [27:0]  mem_request_addr; // cache gives this address to memory (4 words bus)

  reg         mem_request_rw; // 1 is cache wants to write, 0 is cache wants to read

  reg         mem_request_data_valid; // cache has valid data to write to memory
  reg [127:0] mem_request_data_bits; // data to write to memory
  reg [15:0]  mem_request_data_mask;  // byte-level masking for memory write

  reg [1:0] block_service, new_block_service;

  // 0 read, 1 write
  assign mem_req_rw         = mem_request_rw;
  // For writes
  assign mem_req_data_valid = mem_request_data_valid;
  assign mem_req_data_bits  = mem_request_data_bits;
  assign mem_req_data_mask  = mem_request_data_mask;

  assign mem_req_addr       = mem_request_addr;
  assign mem_req_valid      = mem_request_valid;

  assign cpu_req_fire       = cpu_request_ready & cpu_req_valid;
  assign cpu_resp_data      = cpu_response_data;
  assign cpu_resp_valid     = cpu_response_valid;
  assign cpu_req_ready      = cpu_request_ready;
  
  assign tag_valid = meta_dv_tag_out[20];
  assign tag_dirty = meta_dv_tag_out[21];

  reg [31:0] sram_tag_result;

  always_comb begin
    cpu_request_ready  = 1'b0;
    cpu_response_valid = 1'd0;
    cpu_response_data  = 32'd0;

    meta_we            = 1'b0;
    meta_wmask         = 1'b0;
    meta_dv_tag_in     = 32'd0;
    sram_we            = 1'b0;
    sram_wmask         = 4'b0000;

    mem_request_rw     = 1'b0;
    mem_request_valid  = 1'b0;
    mem_request_addr   = 28'd0;

    mem_request_data_valid = 1'b0; 
    mem_request_data_bits  = 128'd0;
    mem_request_data_mask  = 16'd0;

    next_block_service = 2'b00;
    
    case(state)
      `IDLE: begin
        cpu_request_ready = 1'b1;
        if (cpu_req_fire) begin
          next_state = `CHECK_TAG;
        end else begin
          next_state = `IDLE;
        end
      end

      `CHECK_TAG: begin
        if (tag_valid && (tag_T == meta_dv_tag_out[19:0])) begin
          next_state = `IDLE;
          cpu_response_valid = 1'b1;
          case(phys_sram_sel)
            2'b00: cpu_response_data = sram_00_dout;
            2'b01: cpu_response_data = sram_01_dout;
            2'b10: cpu_response_data = sram_10_dout;
            2'b11: cpu_response_data = sram_11_dout;
          endcase
        end else begin
          mem_request_valid = 1'b1;
          mem_request_addr  = cpu_req_addr[29:2];
          state = `WAIT_DRAM_READY;
        end
      end  

      `WAIT_DRAM_READY: begin
        mem_request_valid = 1'b1;
        if (mem_req_ready) begin
          next_state = `DRAM_READ;
        end else begin
          next_state = `WAIT_DRAM_READY;
        end
      end

      `DRAM_READ: begin
        if (mem_resp_valid) begin
          sram_wmask  = 4'b1111;
          sram_we     = 1'b1;
          sram_index  = {index_I, block_service};
          sram_00_din = mem_resp_data[31:0];
          sram_01_din = mem_resp_data[63:32];
          sram_10_din = mem_resp_data[95:64];
          sram_11_din = mem_resp_data[127:96];

          if (block_service == 2'b11) begin
            meta_we             = 1'b1;
            meta_wmask          = 1'b1;
            meta_dv_tag_in      = {10'b0, 2'b01, tag_T};
            next_state          = `GIVE_TO_CPU;
          end else begin
            next_block_service  = block_service + 1;
            next_state          = `DRAM_READ;
          end
        end else begin
          next_state = `DRAM_READ;
        end
      end

      `GIVE_TO_CPU: begin
        cpu_response_valid = 1'b1;
        case(phys_sram_sel)
          2'b00: cpu_response_data = sram_00_dout;
          2'b01: cpu_response_data = sram_01_dout;
          2'b10: cpu_response_data = sram_10_dout;
          2'b11: cpu_response_data = sram_11_dout;
        endcase
        next_state = `IDLE;
      end

    endcase
  end

  always @(posedge clk) begin
    if (reset) begin
      block_service   <= 2'b00;
      state <= `IDLE;
    end else begin
      state           <= next_state;
      block_service   <= next_block_service;
    end
  end

endmodule: NewCache
