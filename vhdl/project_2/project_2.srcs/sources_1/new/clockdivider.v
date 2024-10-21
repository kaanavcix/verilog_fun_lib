`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 08:48:31 PM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(
clk_in,clk_out
    );
    
    input clk_in;
    output reg clk_out;
    initial clk_out=0;
    
    always @ (posedge clk_in) 
    begin
    clk_out = ~clk_out;
    end
    
    
    
    
    
endmodule
