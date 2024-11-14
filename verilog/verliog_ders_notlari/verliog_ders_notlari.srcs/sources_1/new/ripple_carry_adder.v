`timescale 1ns / 1ps



module ripple_carry_adder #(
  parameter integer N = 4
)(
  input a_i [N-1 : 0],
  input b_i [N-1 : 0],
  input cin_i,
  output sum_o [N-1 : 0],
  output cout_o
);

wire carry [N : 0];

genvar i;



generate
  for (i = 0; i< N ; i = i + 1)
  g_RAPID_CARRY_BLOCK : begin
    full_adder fa (
      .a_i(a_i[i]),
      .b_i(b_i[i]),
      .cin_i(carry[i]),
      .sum_o(sum_o[i]),
      .carry_o(carry[i+1])
    );
  end
endgenerate

 assign cin_i = carry[0];
 assign cout_o = carry[N];

endmodule