`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:43:21 PM
// Design Name: 
// Module Name: mux
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


module mux(  MuxIn,  Slct, MuxOut
    );
    
    input [3:0] MuxIn; 
    input [1:0] Slct; 
    output reg MuxOut;
    
    always @ (Slct,MuxIn)
    begin
    
    case(Slct)
    2'b00: MuxOut = MuxIn[0];
    2'b01: MuxOut = MuxIn[1];
    2'b10: MuxOut = MuxIn[2];
    2'b11: MuxOut = MuxIn[3];
    endcase
    end
endmodule
