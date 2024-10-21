`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:22:21 PM
// Design Name: 
// Module Name: xorgate
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


module xorgate(
input a,b,
output y
    );
    
    wire nA;
    wire nB;
    not a1(nA,A);
    not a2(nB,B);
    
    wire BandnA;
    and(BandnA,B,nA);
    
    wire AandnB;
    and(AandnB,A,nB);
    
    or(y,BandnA,AandnB);
    
    
    
endmodule
