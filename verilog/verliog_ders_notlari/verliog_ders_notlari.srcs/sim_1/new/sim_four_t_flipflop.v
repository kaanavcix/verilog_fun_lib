`timescale 1ns / 1ps


module sim_four_t_flipflop();

    
    reg clk; 
    reg reset;
    wire [3:0] q_out;
    four_t_flipflop u1 ( .clk(clk), .rst(reset), .q(q_out));
    initial clk = 1'b0;
    always #5 clk = ~clk;

       //Concurnet Testbench ddiyoruz olay direkt çalışıyor
      initial begin
       reset = 1'b1;
      #15 reset = 1'b0;
      #180 reset = 1'b1;
      #10 reset = 1'b0;
      #20 $stop;
      end

      initial begin
        $monitor("q_out=%b", q_out);
      end

endmodule
