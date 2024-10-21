`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 10:12:33 PM
// Design Name: 
// Module Name: dflipflop
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


module dflipflop(din,clk,q,qnot,reset
    );
    
    input din,clk,reset;
    output reg q,qnot;
    
    always @ (posedge clk, posedge reset) begin //
    
    if(reset == 1) begin
    q = 0;
    qnot = 1;
    end
    
    else begin
    
    q = din;
    qnot = ~din;
    
    end
    end
endmodule
