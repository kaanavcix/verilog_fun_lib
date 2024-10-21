`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:47:53 PM
// Design Name: 
// Module Name: tb_mux
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


module tb_mux(

    );
    reg  [3:0] MuxIn;
    reg  [1:0] Slct;
    
    wire MuxOut;
    
    mux uut
    (.MuxIn(MuxIn),
     .Slct(Slct),
     .MuxOut(MuxOut));
     
     initial begin 
     
     MuxIn = 0;
     Slct = 0;
     
     #100;
     
     MuxIn = 4'b0001;
     Slct = 2'b00;
     
     #10;
      MuxIn = 4'b0011;
     Slct = 2'b01;
     end
endmodule
