`include "util.vh"
`include "const.vh"
`include "CacheStates.vh"

module cache # (parameter LINES = 64,
                parameter CPU_WIDTH = `CPU_INST_BITS,
                parameter WORD_ADDR_BITS = `CPU_ADDR_BITS-`ceilLog2(`CPU_INST_BITS/8))
                (input clk,
                 input reset,

                 input                       cpu_req_valid,
                 output                      cpu_req_ready,
                 input [WORD_ADDR_BITS-1:0]  cpu_req_addr,

                 input [CPU_WIDTH-1:0]       cpu_req_data,
                 input [3:0]                 cpu_req_write,

                 output                      cpu_resp_valid,
                 output [CPU_WIDTH-1:0]      cpu_resp_data,

                 output                           mem_req_valid,
                 input                            mem_req_ready,
                 output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/CPU_WIDTH)] mem_req_addr,

                 output                           mem_req_rw,
                 output                           mem_req_data_valid,
                 input                            mem_req_data_ready,
                 output [`MEM_DATA_BITS-1:0]      mem_req_data_bits,

                 output [(`MEM_DATA_BITS/8)-1:0]  mem_req_data_mask,

                 input                            mem_resp_valid,
                 input [`MEM_DATA_BITS-1:0]       mem_resp_data);

  wire        write_req         = (| cpu_req_write);
  wire [19:0] tag_T             = cpu_req_addr[29:10];
  wire [5:0]  index_I           = cpu_req_addr[9:4];
  wire [3:0]  block_offset_O    = cpu_req_addr[3:0];
  wire [7:0]  sram_index        = {index_I, block_offset_O[3:2]};
  wire [1:0]  phys_sram_sel     = cpu_req_addr[1:0];
  wire [31:0] cpu_req_addr_full = cpu_req_addr << 2;

  reg         meta_write;
  reg [31:0]  meta_dv_tag_in, meta_dv_tag_out;

  reg [3:0]  sram_wmask;
  reg [7:0]  sram_index_walker;
  reg        sram_00_we, sram_01_we, sram_10_we, sram_11_we;
  reg [31:0] sram_00_din, sram_01_din, sram_10_din, sram_11_din; 
  reg [31:0] sram_00_dout, sram_01_dout, sram_10_dout, sram_11_dout;


  sram22_64x32m4w32 meta (.clk   (clk),
                          .we    (meta_write),
                          .wmask (meta_write),
                          .addr  (index_I),
                          .din   (meta_dv_tag_in),
                          .dout  (meta_dv_tag_out));

  sram22_256x32m4w8 sram_00 (.clk   (clk),
                             .we    (sram_00_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index_walker),
                             .din   (sram_00_din),
                             .dout  (sram_00_dout));

  sram22_256x32m4w8 sram_01 (.clk   (clk),
                             .we    (sram_01_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index_walker),
                             .din   (sram_01_din),
                             .dout  (sram_01_dout));

  sram22_256x32m4w8 sram_10 (.clk   (clk),
                             .we    (sram_10_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index_walker),
                             .din   (sram_10_din),
                             .dout  (sram_10_dout));

  sram22_256x32m4w8 sram_11 (.clk   (clk),
                             .we    (sram_11_we),
                             .wmask (sram_wmask),
                             .addr  (sram_index_walker),
                             .din   (sram_11_din),
                             .dout  (sram_11_dout));

  reg [3:0]   state, next_state;
  reg         cpu_request_ready;      // cache is ready to accept new request from cpu
  reg         cpu_response_valid;     // cache has output valid data after mem read
  reg         next_cpu_response_valid;
  reg [31:0]  cpu_response_data;      // data requested by cpu

  reg         mem_request_valid;      // cache asking memory for transaction
  reg [27:0]  mem_request_addr;       // cache gives this address to memory (max Mem addr = 0x20_0000 - 1)

  reg         mem_request_rw;         // 1 for write intent, 0 for read
  reg         mem_request_data_valid; // cache has valid data to offer to memory
  reg [127:0] mem_request_data_bits;  // actual data to be written to memory
  reg [15:0]  mem_request_data_mask;  // byte-level masking for memory write


  assign mem_req_rw         = mem_request_rw;
  assign mem_req_data_valid = mem_request_data_valid;
  assign mem_req_data_bits  = mem_request_data_bits;
  assign mem_req_data_mask  = mem_request_data_mask;
  assign mem_req_addr       = mem_request_addr;
  assign mem_req_valid      = mem_request_valid;

  assign cpu_req_fire       = cpu_request_ready & cpu_req_valid;
  assign cpu_resp_valid     = cpu_response_valid;
  assign cpu_req_ready      = cpu_request_ready;
  
  wire tag_valid = meta_dv_tag_out[20];
  wire tag_dirty = meta_dv_tag_out[21];
  wire tag_match = tag_T == meta_dv_tag_out[19:0];
  /////////////////////////////////////////////
  /////////////////////////////////////////////
  reg [1:0] block_service, next_block_service;
  always @(posedge clk) begin
    if (reset) begin
      block_service       <= 2'b00;
      state               <= `IDLE;
      cpu_response_valid  <= 1'd0;
    end else begin
      state               <= next_state;
      block_service       <= next_block_service;
      cpu_response_valid  <= next_cpu_response_valid;
    end
  end
  /////////////////////////////////////////////
  /////////////////////////////////////////////
  reg [31:0]  store_data;
  reg [3:0]   store_word_mask;
  reg         store_write_req;
  always @(posedge clk) begin
    if (reset || next_state == `IDLE) begin 
      store_data      <= 32'd0; 
      store_write_req <= 1'b0; 
      store_word_mask <= 4'b0000;
    end else if (write_req && state == `IDLE) begin 
      store_data      <= cpu_req_data;
      store_write_req <= 1'b1;
      store_word_mask <= cpu_req_write;
    end
  end
  /////////////////////////////////////////////
  /////////////////////////////////////////////
  reg flush_done;
  always @(posedge clk) begin
    if (reset || next_state == `IDLE)                         flush_done <= 1'b0;
    else if (state == `DRAM_WRITE && block_service == 2'b00)  flush_done <= 1'b1;
  end
  /////////////////////////////////////////////
  /////////////////////////////////////////////

  always_comb begin
    cpu_request_ready       = 1'b0;
    next_cpu_response_valid = 1'd0;
    cpu_response_data       = 32'd0;

    meta_write     = 1'b0;
    meta_dv_tag_in = 32'd0;
    sram_00_we     = 1'b0;
    sram_01_we     = 1'b0;
    sram_10_we     = 1'b0;
    sram_11_we     = 1'b0;
    sram_wmask     = 4'b0000;

    mem_request_rw    = 1'b0;
    mem_request_valid = 1'b0;
    mem_request_addr  = 28'd0;

    mem_request_data_valid = 1'b0; 
    mem_request_data_bits  = 128'd0;
    mem_request_data_mask  = 16'd0;

    next_block_service = 2'b00;
    sram_index_walker  = sram_index;

    case(state)
      `IDLE: begin
        cpu_request_ready = 1'b1;
        next_state = (cpu_req_fire) ? `CHECK_TAG : `IDLE;
      end

      `CHECK_TAG: begin
        if (tag_valid) begin
          if (tag_match) begin
              if (store_write_req) begin
                meta_write      = 1'b1;
                meta_dv_tag_in  = {10'b0, 2'b11, tag_T};
                sram_wmask      = store_word_mask;
                next_state      = `IDLE;
                case(phys_sram_sel)
                  2'b00: begin sram_00_din = store_data; sram_00_we = 1'b1; end
                  2'b01: begin sram_01_din = store_data; sram_01_we = 1'b1; end
                  2'b10: begin sram_10_din = store_data; sram_10_we = 1'b1; end
                  2'b11: begin sram_11_din = store_data; sram_11_we = 1'b1; end
                endcase
              end else begin
                next_state = `IDLE;
                next_cpu_response_valid = 1'b1;
                case(phys_sram_sel)
                  2'b00: cpu_response_data = sram_00_dout;
                  2'b01: cpu_response_data = sram_01_dout;
                  2'b10: cpu_response_data = sram_10_dout;
                  2'b11: cpu_response_data = sram_11_dout;
                endcase
              end
          end else next_state = tag_dirty && mem_req_ready ? `PREPARE_FLUSH : `WAIT_DRAM_READY;
        end else next_state = `WAIT_DRAM_READY;
      end  

      `PREPARE_FLUSH: begin
        mem_request_valid       = 1'b1;
        mem_request_rw          = 1'b1;
        mem_request_addr        = {meta_dv_tag_out[19:0], index_I, block_service};
        if (mem_req_data_ready) begin
          sram_index_walker     = {index_I, block_service};
          next_block_service    = block_service + 1;
          next_state            = `DRAM_WRITE;
        end else begin
          next_block_service    = block_service;
          sram_index_walker     = {index_I, block_service};
          next_state            = `PREPARE_FLUSH;
        end
      end

      `DRAM_WRITE: begin
        mem_request_data_valid  = 1'b1;
        mem_request_data_bits   = {sram_11_dout, sram_10_dout, sram_01_dout, sram_00_dout};
        mem_request_data_mask   = 16'hFFFF;

        if (block_service == 2'b00) next_state = `WAIT_DRAM_READY;
        else begin
          next_block_service    = block_service;
          sram_index_walker     = {index_I, block_service};
          next_state            = `PREPARE_FLUSH;
        end
      end
      
      `WAIT_DRAM_READY: begin
        mem_request_valid = 1'b1;
        mem_request_addr  = cpu_req_addr[29:2];
        next_state = mem_req_ready ? ((tag_dirty && ~flush_done) ? `PREPARE_FLUSH : `DRAM_READ) : `WAIT_DRAM_READY;
      end

      `DRAM_READ: begin
        if (mem_resp_valid) begin
          sram_wmask        = 4'b1111;
          
          sram_00_we        = 1'b1;
          sram_01_we        = 1'b1;
          sram_10_we        = 1'b1;
          sram_11_we        = 1'b1;

          sram_index_walker = {index_I, block_service};
          sram_00_din       = mem_resp_data[31:0];
          sram_01_din       = mem_resp_data[63:32];
          sram_10_din       = mem_resp_data[95:64];
          sram_11_din       = mem_resp_data[127:96];

          if (block_service == 2'b11) begin
            meta_write          = 1'b1;
            meta_dv_tag_in      = {10'b0, 2'b01, tag_T};
            next_state          = `SETTLE;
          end else begin
            next_block_service  = block_service + 1;
            next_state          = `DRAM_READ;
          end
        end else next_state = `DRAM_READ;
      end

      `SETTLE: begin
        next_state = store_write_req ? `CHECK_TAG : `GIVE_TO_CPU;
      end

      `GIVE_TO_CPU: begin
        next_cpu_response_valid = 1'b1;
        case(phys_sram_sel)
          2'b00: cpu_response_data = sram_00_dout;
          2'b01: cpu_response_data = sram_01_dout;
          2'b10: cpu_response_data = sram_10_dout;
          2'b11: cpu_response_data = sram_11_dout;
        endcase
        next_state = `IDLE;
      end

      default: next_state = `IDLE;

    endcase
  end

  wire [31:0] hold_instr;
  REGISTER_R_CE #(.N(32)) hold_instr_reg (.q(hold_instr),
                                          .d(cpu_response_data),
                                          .rst(reset),
                                          .ce(next_cpu_response_valid),
                                          .clk(clk));
  assign cpu_resp_data = hold_instr;

endmodule: cache
