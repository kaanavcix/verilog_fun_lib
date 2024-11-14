`timescale 1ns/1ps


module add_sub
#(parameter  integer N = 32)
(
  input [N - 1 : 0] a_i,
  input [N - 1 : 0] b_i,
  input op_i, // Add 0 sub 1
  output [N - 1 : 0] res_o,
  output carr_o
);



always @ * begin
  if (op_i == 1'b0) begin
    {res_o,carr_o} = a_i + b_i;
  end else begin
    {res_o,carr_o} = a_i - b_i;
  end
end

endmodule