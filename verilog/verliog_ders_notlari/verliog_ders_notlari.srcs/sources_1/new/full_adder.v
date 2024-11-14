`timescale 1ns / 1ps




module half_adder (
  input a_i,
  input b_i,
  output sum_o,
  output carry_o
);


assign sum_o = a_i ^ b_i;
assign carry_o = a_i & b_i;

endmodule //full_adder


module full_adder (
  input a_i,
  input b_i,
  input cin_i,
  output sum_o,
  output carry_o
);

wire first_sum_w;
wire first_carry_w;
wire second_carry_w;


half_adder h1 ( .a_i(a_i), .b_i(b_i), .sum_o(first_sum_w), .carry_o(first_carry_w) );
half_adder h2 ( .a_i(first_sum_w), .b_i(cin_i), .sum_o(sum_o), .carry_o(second_carry_w) );


assign carry_o = first_carry_w  | second_carry_w;

endmodule //full_adder