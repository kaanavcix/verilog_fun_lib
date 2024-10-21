`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:53:42 PM
// Design Name: 
// Module Name: ders4
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


module ders4(
input a,b,c, output reg d,e
    );
    initial d = 0;
    always @ (a, b, c) // sadece a deðiþtiðinde yap
    begin
    
   // d = a | b; //Blocking
    // e = d & c;
    
    d <= a | b; //non Blocking
    e <= d & c;
    end
endmodule
