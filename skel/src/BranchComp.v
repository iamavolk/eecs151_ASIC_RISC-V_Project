module BranchComp (input  [31:0] br_data0_i, br_data1_i,
                   input  br_un_i,
                   output br_eq_o, br_lt_o);

  wire b0_msb = br_data0_i[31];
  wire b1_msb = br_data1_i[31];

  assign br_eq_o = br_data0_i == br_data1_i;
  assign br_lt_o = (br_un_i || (b0_msb & b1_msb) || (~b0_msb & ~b1_msb)) ? br_data0_i < br_data1_i
                   : (b0_msb & ~b1_msb) ? 1'b1
                   : 1'b0;

endmodule: BranchComp
