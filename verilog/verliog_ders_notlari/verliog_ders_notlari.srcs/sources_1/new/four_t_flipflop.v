

module four_t_flipflop (input clk, input rst, output [3:0] q);


t_flipflop t1 (.clk(clk), .rst(rst),  .p(q[0]));
t_flipflop t2 (.clk(q[0]), .rst(rst), .p(q[1]));
t_flipflop t3 (.clk(q[1]), .rst(rst), .p(q[2]));
t_flipflop t4 (.clk(q[2]), .rst(rst), .p(q[3]));
endmodule