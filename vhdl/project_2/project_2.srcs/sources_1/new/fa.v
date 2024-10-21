`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 11:06:32 PM
// Design Name: 
// Module Name: fa
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


module fa(a,b,cin,s,cout
    );
    
    input a,b,cin;
    output s,cout;
    
    assign s = (a^b)^cin;
    assign cout = (a&b)| (b&cin)|(cin&a);
    
endmodule

module my_design #(parameter N=5)
(a,b,cin,s,cout);

input [N-1:0] a,b;
input cin;

output [N-1:0] cout, s;
genvar i;

generate
    for ( i=0 ; i<N ; i=i+1) begin : ahmet
    
    fa unit (a[i], b[i], (i==0)?0 : cout[i-1],s[i],cout[i]);
    
    end
    endgenerate
    endmodule