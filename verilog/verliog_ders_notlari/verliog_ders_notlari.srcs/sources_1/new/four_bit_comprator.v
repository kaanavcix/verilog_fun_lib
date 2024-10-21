`timescale 1ns / 1ps

module four_bit_comprator(
    input wire [3:0] a,
    input wire [3: 0] b,
    output wire c
    );


    wire [3 : 0] temp;
    mx u1 ( .a(a[0]), .b(b[0]), .c(temp[0]));
    mx u2 ( .a(a[1]), .b(b[1]), .c(temp[1]));
    mx u3 ( .a(a[2]), .b(b[2]), .c(temp[2]));
    mx u4 ( .a(a[3]), .b(b[3]), .c(temp[3]));
    mu m1 ( .x(temp), .c(c));
endmodule
