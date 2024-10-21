`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 05:02:34 PM
// Design Name: 
// Module Name: mux8x1
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


module mux8x1( Mux8In, Slct, Mux8Out
    );
    
    input [7:0] Mux8In;
    input [2:0] Slct;
    output Mux8Out;
    wire M1,M2;
    
    mux uut (Mux8In[7:4],Slct[1:0], M1);
    mux uut1 (Mux8In[3:0],Slct[1:0], M2);
    mux2x1 uut2(M1,M2,Slct[2],Mux8Out);
endmodule
