`timescale 1ns / 1ps


module alu
#(parameter N = 32)
(

input                    clk,
input                    rst,
input [1 : 0]            opcode,
input   [N - 1 : 0]      a_i,
input   [N - 1 : 0]      b_i,
output  [N - 1 : 0]      o
);


localparam ADD = 2'b00;
localparam SUB = 2'b01;
localparam MUL = 2'b10;
localparam DIV = 2'b11;

reg [N - 1: 0] o_reg;

always @ (posedge clk or posedge rst)
begin

if (rst)begin
 o_reg <= 0;
end else begin
    case (opcode)
    ADD: o_reg <= a_i + b_i;
    SUB: o_reg <= a_i - b_i;
    MUL: o_reg <= a_i * b_i;
    DIV: o_reg <= a_i / b_i;
    default : o_reg <= 0;
    endcase
end
end

assign o = o_reg;
endmodule
