`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 01:04:17 PM
// Design Name: 
// Module Name: PLL
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


//module PLL //#(parameter count = 2) //parameter duty_cycle=1, parameter start_time=1)
//(
//input clk_i,
//input [31:0] count,
//input [31:0] high_count,
//input rst,
//input [31:0] wait_count,

//output reg clk_o
//    );
//reg [31:0] counter;
//reg [31:0] wait_counter;
////reg flag = 0;

//always@(posedge clk_i)
//begin
////    test <= counter[0];
////    if(flag == 0)
////    begin
////        flag <= 1;
////        clk_o <= 0;
////        counter <= 0;
////    end
////    else if(counter == count/2 - 1 )
//    if(rst)
//    begin
//        counter <= 0;
//        clk_o <= 0;
//        wait_counter = wait_count;
//    end
//    else if (wait_counter != 0)
//    begin
//        wait_counter = wait_counter - 1;
//    end
//    else
//    begin
////        if(counter == (count>>1 - 1) )
////        begin
////            counter <= 0;
////            clk_o <= ~clk_o;
////        end
////        else
////            counter <= counter + 1;
         
        
//    end
//end
//endmodule
module PLL //#(parameter count = 2) //parameter duty_cycle=1, parameter start_time=1)
(
input clk_i,
input [31:0] high_count,
input [31:0] low_count,
input rst,
input [31:0] wait_count,
output reg clk_o
    );
reg [31:0] low_counter;
reg [31:0] high_counter;
reg [31:0] wait_counter;
reg low;
//reg flag = 0;

always@(posedge clk_i)
begin
//    test <= counter[0];
//    if(flag == 0)
//    begin
//        flag <= 1;
//        clk_o <= 0;
//        counter <= 0;
//    end
//    else if(counter == count/2 - 1 )
    if(rst)
    begin
        clk_o <= 0;
        //wait_counter = wait_count;
        wait_counter <= wait_count;
        high_counter <= 0;
        low_counter <= 0;
        low <= 1;
    end
    else if (wait_counter != 0)
    begin
        wait_counter <= wait_counter - 1;
    end
    else
    begin
        if(low)
        begin 
            if (low_counter == low_count - 1)
            begin
                low <= ~low;
                low_counter <= 0;
                clk_o <= ~ clk_o;
            end
            else
            begin
                low_counter <= low_counter + 1;
                clk_o <=  clk_o;
            end
        end
        else 
        begin 
            if (high_counter == high_count - 1)
            begin
                low <= ~low;
                high_counter <= 0;
                clk_o <= ~ clk_o;
            end
            else
            begin
                high_counter <= high_counter + 1;
                clk_o <=  clk_o;
            end
        end
//        if(counter == (count>>1 - 1) )
//        begin
//            counter <= 0;
//            clk_o <= ~clk_o;
//        end
//        else
//            counter <= counter + 1;
         
        
    end
end
endmodule