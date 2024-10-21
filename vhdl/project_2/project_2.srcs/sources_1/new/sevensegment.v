`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 10:28:16 PM
// Design Name: 
// Module Name: sevensegment
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


module sevensegment( num_in,ss_out
    );
    input [3:0] num_in;
    output reg [6:0] ss_out;
    
    always @(num_in) begin
    
    case(num_in)
    4'b0000 : ss_out = 7'b0000001;
    4'b0001 : ss_out = 7'b1001000;
    4'b0010 : ss_out =  7'b0010010;
    //4'b0011: ss_out =
    
    endcase
    
    end
endmodule
