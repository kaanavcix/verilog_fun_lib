`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:28:54 PM
// Design Name: 
// Module Name: modularImp
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


module modularImp(
 input in1,in2,in3, output out
    );
    
    wire w1, w2;
    
    B1 block1( .a(in1), .b(in2), .c(w1));
    B2 block2( .a(in1), .b(in2), .c(w2));
    B3 block3 (.a(w1) , .b (w2), . c(in3), .d(out));
    
endmodule
