`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 08.09.2026 11:57:54
// Design Name:
// Module Name: tb_counter
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


module tb_counter ();


    reg        clk    ;
    reg        rst    ;
    reg        load   ;
    reg  [3:0] data_in;
    reg        en     ;
    reg        up_down;
    wire [3:0] count  ;

    counter dut (
        .clk    (clk    ),
        .en     (en     ),
        .rst    (rst    ),
        .load   (load   ),
        .data_in(data_in),
        .count  (count  ),
        .up_down(up_down)
    );



    task automatic check_count;
        input [3:0] expected;
        input [200*8-1:0] name;                                             // У завданні "input string name" але для verilog нема такої змінної тому трішки змінено.

        begin
            if (count === expected) begin
                $display("[PASS] %-35s | count = %0d", name, count);
            end else begin
                $display("[FAIL] %-35s | count = %0d (expected = %0d)", name, count, expected);
            end
        end



    endtask









/*НАПИСАТИ TESTBENCH ДЛЯ COUNTER
Створити файл tb_counter.v. У ньому по черзі:

Оголосити сигнали: clk, rst, load, data_in, en, up_down (усі reg, бо ви ними керуєте) і count (wire, бо це вихід DUT).

Інстанціювати counter, підключивши всі сигнали з пункту 1.

Додати генератор такту clk з частотою на ваш вибір.*/



    initial begin
        clk =0;
        rst = 0;
        load =0;
        data_in = 4'b0;
        en = 0;
        up_down = 0;
    end

    always begin
        #5 clk = ~clk;
    end

/*ПЕРЕВІРИТИ ЗАВАНТАЖЕННЯ (LOAD)
rst=1 на один такт, потім rst=0.
load=1, data_in=4'd10, зачекати фронт такту (@(posedge clk); #1;).
load=0.
Перевірити (if/else + $display PASS/FAIL): count === 10.*/


    initial begin
        #5
            rst = 1;
        #5
            rst = 0;
        check_count(4'd0, "RESET");
        load=1;

        data_in=4'd10;
        @(posedge clk); #1
            load = 0;
        @(posedge clk); #1
            if (count === 4'd10)
//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 10",count);
                check_count(4'd10, "LOAD");


/*
ПЕРЕВІРИТИ РАХУНОК ВГОРУ, ВКЛЮЧНО З ПЕРЕХОДОМ ЧЕРЕЗ МЕЖУ
Це основне навантаження завдання — не одна перевірка, а ПОСЛІДОВНІСТЬ:

Від значення 10 (продовження з пункту 3): en=1, up_down=1, зробити 3 такти поспіль (3 рази @(posedge clk); #1;).
Перевірити: count === 13.
Зробити ще 3 такти поспіль (усе ще en=1, up_down=1) — тепер лічильник має перейти через межу 15 -> 0.
Перевірити: count === 0.
        */




        en=1;
        up_down=1;
        @(posedge clk); #1
            en=1;
        up_down=1;
        @(posedge clk); #1
            en=1;
        up_down=1;
        @(posedge clk); #1
            if (count === 4'd13)



//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 13",count);
                check_count(4'd13, "en = 1, up_down=1");


        en=1;
        up_down=1;
        @(posedge clk); #1
            en=1;
        up_down=1;
        @(posedge clk); #1
            en=1;
        up_down=1;
        @(posedge clk); #1
            if (count === 4'd0)
//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 0",count);
                check_count(4'd0, "en = 1, up_down=1");



/*
ПЕРЕВІРИТИ УТРИМАННЯ ЗНАЧЕННЯ (EN=0)
en=0 (up_down лишити яким завгодно — не повинен впливати).
Зробити 2 такти поспіль.
Перевірити: count не змінився (усе ще === 0 з кінця пункту 4).
        */


        en=0;
        @(posedge clk); #1
            en=0;
        @(posedge clk); #1
            if (count === 4'd0)
//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 0",count);
                check_count(4'd0, "EN=0 HOLD");


/*
ПЕРЕВІРИТИ РАХУНОК ВНИЗ ІЗ ПЕРЕХОДОМ ЧЕРЕЗ МЕЖУ
en=1, up_down=0.
Один такт.
Перевірити: count === 15 (перехід 0 -> 15 у зворотний бік). */



        en=1;
        up_down=0;
        @(posedge clk); #1
            if (count === 4'd15)
//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 15",count);
                check_count(4'd15, "en=1, up_down=0");


/*
ПЕРЕВІРИТИ ПРІОРИТЕТ LOAD НАД EN
Це прямо перевіряє порядок пріоритету з пункту 1 — навмисно встановіть ОБИДВА сигнали разом:

load=1, data_in=4'd5, І ОДНОЧАСНО en=1, up_down=1.
Один такт.
Перевірити: count === 5 (не 16 чи інше значення від лічби — саме завантажене число, бо load має пріоритет). */



        load=1;
        data_in=4'd5;
        en=1;
        up_down=1;
        @(posedge clk); #1
            if (count === 4'd5)
//$display("PASS count = %d", count);
//else $display("FAIL count = %d expected = 5",count);
                check_count(4'd5, "LOAD under EN");



/*
ЗІБРАТИ ВСІ ПЕРЕВІРКИ В TASK
Написати task automatic з іменем check_count, який приймає очікуване значення (input [3:0] expected) і текстову назву кроку (input string name).
Тіло task: порівняти count з expected (===), вивести PASS/FAIL через $display із назвою кроку.
Замінити ручні перевірки з пунктів 3-7 на виклики check_count(...) — по одному виклику одразу після кожної зміни входів і очікування такту.
Зверніть увагу: сам такт (@(posedge clk); #1;) task не робить — він лишається в основному коді, бо кількість тактів очікування різна для різних кроків. Task відповідає тільки за порівняння й вивід. */


/*
БОНУС (ОПЦІЙНО)

Написати ще один тестовий випадок, якого немає в пунктах вище: рахунок ВНИЗ від значення, відмінного від 0/15, 
БЕЗ переходу через межу (наприклад, завантажити 8, порахувати вниз один раз, перевірити 7) — переконатись, що звичайний, 
"не крайовий" випадок теж працює, а не тільки межові значення.  */

load=1;
data_in=4'd8;
@(posedge clk); #1
load=0;
en=1;
up_down=0;
@(posedge clk); #1
check_count(4'd7, "Bonus");


        $finish;
    end

endmodule
