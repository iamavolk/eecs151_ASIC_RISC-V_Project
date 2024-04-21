module mem_output #(
    parameter WIDTH = 32
) (
    input  [WIDTH-1:0] dmem_out, 
    input  [WIDTH-1:0] bios_out,
    input  [WIDTH-1:0] alu_addr,
    input  uart_rx_valid,
    input  uart_tx_ready,
    input  [7:0] uart_rx_out,
    input  [WIDTH-1:0] cyc_ctr,
    input  [WIDTH-1:0] instr_ctr,
    output [WIDTH-1:0] mem_result,
    output uart_load_selected
);
    
    wire [WIDTH-1:0] ctr_value;
    mux2 #(.N(WIDTH))
    ctr_mux (.in0(cyc_ctr),
             .in1(instr_ctr),
             .sel(alu_addr[2]),
             .out(ctr_value));


    wire [WIDTH-1:0] uart_value;
    wire [WIDTH-1:0] uart_ctrl = {30'b0, uart_rx_valid, uart_tx_ready};
    wire [WIDTH-1:0] uart_incoming = {24'b0, uart_rx_out};
    mux2 #(.N(WIDTH))
    uart_mux (.in0(uart_ctrl),
              .in1(uart_incoming),
              .sel(alu_addr[2]),
              .out(uart_value));

    wire [WIDTH-1:0] io_value;
    mux2 #(.N(WIDTH))
    io_mux (.in0(uart_value),
            .in1(ctr_value),
            .sel(alu_addr[4]),
            .out(io_value));

    mux3 #(.N(WIDTH))
    mem_output_mux (.in0(dmem_out),
                    .in1(bios_out),
                    .in2(io_value),
                    .sel(alu_addr[31:30]),
                    .out(mem_result));
    assign uart_load_selected = (alu_addr[4] == 1'b0)
                                && (alu_addr[31:30] == 2'b10)
                                && (alu_addr[2] == 1'b1);
endmodule

