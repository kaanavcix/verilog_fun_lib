`timescale 1ns / 1ps


module d_flipflop( input clk, rst, d, output reg q);


always @(posedge rst or negedge clk) begin
    if(rst)begin
        q = 1'b0;
    end else begin
        q = d;
    end
end
endmodule
