module SatCtr(input clk,
              input reset,
              input enable,
              output reg [3:0] count);

  parameter MAX_COUNT = 4'b0100;

  // Process for counting
  always @(posedge clk) begin
      if (reset) begin
          count <= 4'h00;
      end
      else if (enable) begin
        if (count < MAX_COUNT) begin
            count <= count + 1;
        end
        else begin
            count <= MAX_COUNT;
        end
      end
  end

endmodule: SatCtr
