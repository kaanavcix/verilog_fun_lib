`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 05:10:01 PM
// Design Name: 
// Module Name: flipflop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flipflop(clk, d_in, q_out, qnot_out
    );
    
    input clk, d_in;
    output reg q_out, qnot_out;
    
    always @ (posedge clk )
    begin
    
    
    q_out = d_in;
    qnot_out = ~d_in;

    end
    
    
endmodule
