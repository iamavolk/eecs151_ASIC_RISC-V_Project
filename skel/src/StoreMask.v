module StoreMask #(parameter WIDTH = 32)(input              mem_write_X_i,
                                         input [1:0]        func3_2lsb_X_i,
                                         input [1:0]        byte_offset_i,
                                         input [WIDTH-1:0]  data_i,
                                         output [3:0]       mem_wea_mask_o,
                                         output [WIDTH-1:0] data_out_o);
    
  reg [3:0] mask;
  reg [WIDTH-1:0] data_out_reg;

  always_comb begin
    case (func3_2lsb_X_i)
      2'b00: begin
        mask = 4'b0001 << byte_offset_i;
        data_out_reg = data_i << (8 * byte_offset_i);
      end

      2'b01: begin
        mask = 4'b0011 << byte_offset_i;
        data_out_reg = data_i << (8 * byte_offset_i);
      end

      2'b10: begin
        mask = 4'b1111;
        data_out_reg = data_i;
      end

      default: begin
        mask = 4'b0000;
        data_out_reg = data_i;
      end   
    endcase
  end

  assign mem_wea_mask_o = mem_write_X_i ? mask : 4'b0000;
  assign data_out_o     = data_out_reg;

endmodule: StoreMask
