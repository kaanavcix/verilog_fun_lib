`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 08:57:49 PM
// Design Name: 
// Module Name: clock_tb
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


module clock_tb(
    );
    
    reg clk_in;
    wire clk_out;
    
    clockdivider uut  (clk_in,clk_out);
    
    initial begin
    
    clk_in = 0;
    
    #100;
    end
    
    always 
    #10 clk_in = ~clk_in;
    
endmodule
