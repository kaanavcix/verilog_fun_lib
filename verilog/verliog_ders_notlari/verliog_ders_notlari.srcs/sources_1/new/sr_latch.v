`timescale 1ns / 1ps


module sr_latch( input wire s,r,output reg q, qbar);


 assign q = ~(s & qbar);
 assign qbar = ~(r & q);


 always @(s or r) begin
    
 end

endmodule
