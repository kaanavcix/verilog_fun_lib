`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:30:14 PM
// Design Name: 
// Module Name: B3
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


module B3(
input a,b,c,output d
    );
    
    wire e;
    assign e = (a&b);
    
    assign d = e ^ c;
    
endmodule
