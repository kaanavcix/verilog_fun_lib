`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:08:48 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(A,B,Cin,S,Cout
    );
    
    input A, B, Cin;
    output reg S, Cout;
    
    always @(A,B,Cin) 
    begin
    case(Cin)
    0: begin
    S = A^B; Cout= A & B;
        end
    1:begin
    S = A ~^ B; Cout = A | B;
       end
    endcase
    end
endmodule
