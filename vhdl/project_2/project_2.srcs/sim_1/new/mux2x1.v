`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:58:29 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(
Mux2In,Slct2,Mux2Out
    );
    
    input [1:0] Mux2In;
    input Slct2;
    output reg Mux2Out;
    
    always @(Mux2In,Slct2)
    begin
    
    case(Slct2)
    0: Mux2Out  = Mux2In[0];
    1: Mux2Out = Mux2In[1];
    endcase
    end
endmodule
