


module mu(input wire [3 : 0] x , output wire c);

      assign c  =  ~(x[3] | x[2] | x[1] | x[0]);


endmodule