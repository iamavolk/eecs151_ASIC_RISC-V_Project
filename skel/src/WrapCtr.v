module WrapCtr(input clk,
               input reset,
               input enable,
               output reg [4:0] count);

  parameter MAX_COUNT = 15;

  always @(posedge clk) begin
    if (reset) begin
      count <= 0;
    end
    else if (enable) begin
      if (count == MAX_COUNT) count <= 0;
      else count <= count + 1;
    end
  end

endmodule: WrapCtr
