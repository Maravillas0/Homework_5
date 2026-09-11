`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 08.09.2026 11:25:22
// Design Name:
// Module Name: counter
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


module counter (
    input  wire           clk    , //— тактовий сигнал
    input  wire           rst    , //— асинхронний reset, активний високим рівнем
    input  wire           load   , //— синхронне завантаження
    input  wire     [3:0] data_in, //— значення для завантаження
    input  wire           en     , //— дозвіл рахувати
    input  wire           up_down, //— 1 = рахувати вгору, 0 = вниз
    output      reg [3:0] count    //— поточне значення (реєстрове)
);


    /* Якщо rst=1: count стає 0 (незалежно від решти сигналів, спрацьовує асинхронно, не чекаючи фронту).
    Інакше якщо load=1: count <= data_in (навіть якщо en=1 — load має пріоритет над en).
    Інакше якщо en=1: count <= count+1, якщо up_down=1; count <= count-1, якщо up_down=0.
    Інакше (load=0 і en=0): count лишається без змін.
    */

    always @(posedge clk or posedge rst) begin

        if (rst) begin

            count <= 4'b0;

        end else begin

            if (load) begin

                count <= data_in;

            end else begin

                if (en) begin

                    count <= (up_down ? count + 1'b1 : count - 1'b1 );

                end
            end
        end
    end



endmodule
