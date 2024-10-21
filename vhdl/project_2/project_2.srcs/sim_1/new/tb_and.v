`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 03:15:55 PM
// Design Name: 
// Module Name: tb_and
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


module tb_and(

    );
    
    reg a;
    reg b;
    reg c;
    //output
    wire d;
    
    andgate uul(
    .a(a),
    .b(b),
    .c(c),
    .d(d)
    );
    
    initial begin 
    
    a = 0; b = 0; c = 0;
    
    #100;
    
    a = 0; b = 0; c = 1;
    
    #20;   
    
    a = 1; b = 0; c = 1;
    
    #10;   
    
    end
    
endmodule
