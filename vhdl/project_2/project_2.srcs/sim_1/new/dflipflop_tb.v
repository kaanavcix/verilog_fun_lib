`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 10:19:58 PM
// Design Name: 
// Module Name: dflipflop_tb
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


module dflipflop_tb(
    );
    
    reg din,clk,reset;
    wire q,qnot;
    
 dflipflop uut(din,clk,q,qnot,reset);  
    initial begin 
    clk = 0;
    reset = 0;
    din = 0;
    
    
    #100;
    end
    
    always #10 clk = ~clk;
endmodule
