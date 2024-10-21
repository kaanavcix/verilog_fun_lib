`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:00:43 PM
// Design Name: 
// Module Name: half_adder
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


module half_adder(
input a,b,output reg s,c //Deðer atamasý olacaðý için output reg
    );
    
   // assign  s = (a ^ b);
    //assign  c = (a & b);
    /*
    always @ (a,b)
    begin 
    
    if((a==0) & (b==0)) begin
    
    s <= 0;
    c <= 0;
    end
    else if((a==0) & (b==1)) begin
    
    s <= 1;
    c <= 0;
    end
    else if((a==1) & (b==0)) begin
    
    s <= 1;
    c <= 0;
    end
    else if((a==1) & (b==0)) begin
    
    s <= 0;
    c <= 0;
    end
    
    end
    */
    
  
    
endmodule
