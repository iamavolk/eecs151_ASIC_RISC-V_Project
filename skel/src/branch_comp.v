module branch_comp #(parameter N = 32) (input [N-1:0] br_data0, br_data1,
                                        input BrUn,
                                        output BrEq, BrLt);

  reg BrLt_res;
  
  wire b0 = br_data0[N-1];
  wire b1 = br_data1[N-1];

  always_comb begin
    //if (BrUn) BrLt_res = br_data0 < br_data1;
    //else begin
        if  (BrUn || b0 & b1 || ~b0 & ~b1) BrLt_res = br_data0 < br_data1;
        else if (b0 & ~b1)   BrLt_res = 1'b1;
        //else if (~b0 & b1)   BrLt_res = 1'b0;
        //else if (~b0 & ~b1)  BrLt_res = br_data0 < br_data1;   
        else                 BrLt_res = 1'b0;
    //end
  end

  assign BrEq = br_data0 == br_data1; // equal regardless of sign system
  assign BrLt = BrLt_res;

endmodule: branch_comp
