`timescale 1ns / 1ps


// CLK_PER_BIT CLK/BAUD_RATE RATE
module uart_rx
    #(parameter CLK_PER_BIT = 534)
    (
    input           clk,
    input           i_rx,
    output          o_data_av,
    output [7:0]    o_data // Bu sadece output olduğu ,için data store özelliği olmuyor ondan içeride reg ile bir store olayı yapıyoruz
    );

    localparam      IDLE_STATE      = 2'b00;
    localparam      START_STATE     = 2'b01;
    localparam      GET_BIT_STATE   = 2'b10;
    localparam      STOP_STATE      = 2'b11;


    reg rx_buffer =  1'b1;
    reg rx        =  1'b1;


    reg [1:0]       state = 0 ;         // State 2 bitlik yani 0,1,2,3 oluyor
    reg [15:0]      counter = 0;        // 16 bitlik counter 2^16 = 65536	
    reg [2:0]       bit_index = 0;      // 3 bitlik bit index 2^3 = 8 8 bit = 1 byte veri bunu indexlemek için kullanıyoruz
    reg             data_av = 0;        // Data available
    reg [7:0]       data = 0;           // 8 bitlik data


    assign          o_data_av  = data_av;
    assign          o_data     = data;

    // Double buffer the incoming RX line. This allow it to be used in the UART RX Clock Domain
    //and removes problems caused by metastability.
    always @(posedge clk) begin
        rx_buffer   <= i_rx;
        rx          <= rx_buffer;
    end

    always @(posedge clk) begin
       case (state)
        IDLE_STATE:
        begin 
            data_av     <= 0;
            counter     <= 0;
            bit_index   <= 0;

            if(rx == 0)
                state <= START_STATE;
            else
                STATE <= IDLE_STATE;
        end 
        START_STATE:
        begin
            if(counter == (CLK_PER_BIT - 1 / 2)) // Yarı durumda bakıyor çünkü start yarı durum oluyor ve rx biti 0 sa o zaman ok diyor
            begin
                if(rx == 0)
                begin
                   counter <= 0;
                   state <= GET_BIT_STATE; 
                end
                else
                begin
                    state <= IDLE_STATE;
                end
            end
            else
            begin
                counter <= counter + 16'b1;
             end
        end
        GET_BIT_STATE:
        begin
            if (counter < CLK_PER_BIT - 1) // 1 bitlik süre içinde counter küçükse 
            begin
                counter <= counter + 16'b1; //Bir sonraki bite geç
                state <= GET_BIT_STATE;
            end
            else
            begin
                counter <= 0;
                data[bit_index] <= rx;
                //check if we have a recieved all bits
                if(bit_index < 7)
                begin 
                    bit_index <= bit_index + 3'b1;
                    state <= GET_BIT_STATE;
                end
                else
                begin 
                    bit_index <= 0;
                    state <= STOP_STATE;
                end
            end

            STOP_STATE:
            if(counter < CLK_PER_BIT - 1)
            begin
                counter <= counter + 16'b1;
                state <= STOP_STATE;
            end
            else
            begin
                counter <= 0;
                data_av <= 1;
                state <= IDLE_STATE;
            end
        end
        default: state <= IDLE_STATE;
       endcase
    end

endmodule