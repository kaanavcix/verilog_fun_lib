`timescale 1ns / 1ps

module uart_tx
#(parameter  CLK_PER_BIT = 87) 
(
    input clk,
    input i_data_av,  // if high , start transmission
    input [7:0] i_data, 
    output reg o_active, // high while busy transmitting
    output reg o_done, // high for one clock when completed
    output reg o_tx // connect this to tx line
    );

    localparam IDLE_STATE = 2'b00;
    localparam START_STATE = 2'b01;
    localparam SEND_BIT_STATE = 2'b10;
    localparam STOP_STATE = 2'b11;

    reg [1:0] state;
    reg [2:0] bit_index; // 3 bit ediyor oda 2^3 = 8 bitlik data için	
    reg [7:0] data;
    reg [15:0] counter;


    always @(posedge clk ) begin
        case (state)
            IDLE_STATE:
            begin
                o_tx <= 1;
                o_done <= 0;
                counter <= 0;
                bit_index <= 0;

                if(i_data_av == 1)
                begin 
                    o_active <= 1;
                    data <= i_data;
                    state <= START_STATE;
                end
                else
                state <= IDLE_STATE;
            end
            START_STATE:
            begin
               if(counter < CLK_PER_BIT - 1)
               begin 
                counter <= counter + 16'b1;
                state <= START_STATE;
               end
               else 
               begin 
                counter <= 0;
                state <= SEND_BIT_STATE;
               end
            end
            SEND_BIT_STATE:
            begin 
                o_tx <= data[bit_index]; // send the bit
                if(counter < CLK_PER_BIT - 1)
                begin
                    counter <= counter + 16'b1;
                    state <= SEND_BIT_STATE;
                end
                else
                begin
                    counter <= 0;
                    if(bit_index < 7)
                    begin 
                        bit_index <= bit_index + 3'b1;
                        state <= SEND_BIT_STATE;
                    end
                    else
                    begin
                        bit_index <= 0;
                        state <= STOP_STATE;
                    end
                 end
                end
            STOP_STATE:
            begin 
                o_tx <= 1;

                if(counter < CLK_PER_BIT - 1)
                begin 
                    counter <= counter + 16'b1;
                    state <= STOP_STATE;
                end
                else
                begin
                  o_done <= 1;
                    o_active <= 0;
                    state <= IDLE_STATE;  
                end
            end 
            default: state <= IDLE_STATE;
        endcase
    end
endmodule


// Only nand gate u can use for any digital circuit
