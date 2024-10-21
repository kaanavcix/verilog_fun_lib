`timescale 1ns / 1ps


module t_flipflop(input clk, input rst, output p);

  wire d;

  d_flipflop d1 (.clk(clk), .rst(rst), .d(d), .q(p));
  not not1 (d , q);


endmodule
