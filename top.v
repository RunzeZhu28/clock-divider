`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 01:28:19 PM
// Design Name: 
// Module Name: Reveal_Top
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


module Top(
input  wire [4:0]   okUH,
output wire [2:0]   okHU,
inout  wire [31:0]  okUHU,
inout  wire         okAA,
output wire [9:1] TEST_IO,
input  wire         sys_clk_p,
input  wire         sys_clk_n
//output wire [7:0] led
    );
wire clk;
wire reset;
wire clk_200,clk_90,clk_80,clk_70,clk_60;
  clk_wiz_0 inst
  (
  // Clock out ports  
  .clk_out1(clk),
  // Status and control signals               
  .reset(reset), 
 // Clock in ports
  .clk_in1_p(sys_clk_p ),
  .clk_in1_n(sys_clk_n)
  );

//  clk_wiz_1 inst_2
//  (
//  // Clock out ports  
//  .clk_out1(clk_90),
//  .clk_out2(clk_80),
//  .clk_out3(clk_70),
//  .clk_out4(clk_60),
//  // Status and control signals               
//  .reset(reset), 
// // Clock in ports
//  .clk_in1(clk)
//  );

// clk_wiz_2 inst_3

// (// Clock in ports
//  // Clock out ports
//      .clk_out1(clk_200),
//  // Status and control signals
//  .reset(reset),
//  .clk_in1(clk)
// );
//wire [31:0] count_1;
//wire [31:0] base_1;
//wire [31:0] count_2;
//wire [31:0] base_2;
//wire [31:0] count_3 ;
//wire [31:0] base_3 ;
//wire [31:0] count_4 ;
//wire [31:0] base_4;
//wire [31:0] count_5;
//wire [31:0] base_5;
//wire [31:0] count_6;
//wire [31:0] base_6;

//wire  base_clk_1;
//wire  base_clk_2;
//wire  base_clk_3;
//wire  base_clk_4;
//wire  base_clk_5;
//wire  base_clk_6;

wire [31:0] high_count_1;
wire [31:0] low_count_1;
wire [31:0] high_count_2;
wire [31:0] low_count_2;
wire [31:0] high_count_3;
wire [31:0] low_count_3;
wire [31:0] high_count_4;
wire [31:0] low_count_4;
wire [31:0] high_count_5;
wire [31:0] low_count_5;
wire [31:0] high_count_6;
wire [31:0] low_count_6;
wire [31:0] wait_count_1;
wire [31:0] wait_count_2;
wire [31:0] wait_count_3;
wire [31:0] wait_count_4;
wire [31:0] wait_count_5;
wire [31:0] wait_count_6;

wire rst;
wire         okClk;
wire [112:0] okHE;
wire [64:0]  okEH;
// Instantiate the okHost and connect endpoints.
//wire [65*2-1:0] okEHx;
okHost okHI(
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okAA(okAA),
	.okClk(okClk),
	.okHE(okHE), 
	.okEH(okEH)
);

//okWireOR # (.N(2)) wireOR (okEH, okEHx);
//okWireIn    ep00 (.okHE(okHE),   .ep_addr(8'h01), .ep_dataout(count_1));  
//okWireIn    ep01 (.okHE(okHE),   .ep_addr(8'h01), .ep_dataout(base_1));  


//okWireIn    ep02 (.okHE(okHE),   .ep_addr(8'h02), .ep_dataout(count_2));  
//okWireIn    ep03 (.okHE(okHE),   .ep_addr(8'h03), .ep_dataout(base_2));  
////okWireIn    wi04 (.okHE(okHE),   .ep_addr(8'h04), .ep_dataout(count_3));  
////okWireIn    wi05 (.okHE(okHE),   .ep_addr(8'h05), .ep_dataout(base_3));  
//okWireIn    wi06 (.okHE(okHE),   .ep_addr(8'h06), .ep_dataout(count_4));  
//okWireIn    wi07 (.okHE(okHE),   .ep_addr(8'h07), .ep_dataout(base_4)); 
////okWireIn    wi08 (.okHE(okHE),   .ep_addr(8'h08), .ep_dataout(count_5));  
////okWireIn    wi09 (.okHE(okHE),   .ep_addr(8'h09), .ep_dataout(base_5));  
//okWireIn    wi10 (.okHE(okHE),   .ep_addr(8'h0A), .ep_dataout(count_6));  
//okWireIn    wi11 (.okHE(okHE),   .ep_addr(8'h0B), .ep_dataout(base_6));
//okWireIn    wi12 (.okHE(okHE),   .ep_addr(8'h0C), .ep_dataout(rst));  

okWireIn    ep00 (.okHE(okHE),   .ep_addr(8'h00), .ep_dataout(high_count_1));  
okWireIn    ep01 (.okHE(okHE),   .ep_addr(8'h01), .ep_dataout(low_count_1));  
okWireIn    ep02 (.okHE(okHE),   .ep_addr(8'h02), .ep_dataout(wait_count_1)); 

okWireIn    ep03 (.okHE(okHE),   .ep_addr(8'h03), .ep_dataout(high_count_2));  
okWireIn    ep04 (.okHE(okHE),   .ep_addr(8'h04), .ep_dataout(low_count_2));  
okWireIn    ep05 (.okHE(okHE),   .ep_addr(8'h05), .ep_dataout(wait_count_2)); 

okWireIn    wi06 (.okHE(okHE),   .ep_addr(8'h06), .ep_dataout(high_count_3));  
okWireIn    wi07 (.okHE(okHE),   .ep_addr(8'h07), .ep_dataout(low_count_3));  
okWireIn    ep08 (.okHE(okHE),   .ep_addr(8'h08), .ep_dataout(wait_count_3)); 

okWireIn    wi09 (.okHE(okHE),   .ep_addr(8'h09), .ep_dataout(high_count_4));  
okWireIn    wi10 (.okHE(okHE),   .ep_addr(8'h0A), .ep_dataout(low_count_4)); 
okWireIn    ep11 (.okHE(okHE),   .ep_addr(8'h0B), .ep_dataout(wait_count_4)); 

okWireIn    wi12 (.okHE(okHE),   .ep_addr(8'h0C), .ep_dataout(high_count_5));  
okWireIn    wi13 (.okHE(okHE),   .ep_addr(8'h0D), .ep_dataout(low_count_5));  
okWireIn    ep14 (.okHE(okHE),   .ep_addr(8'h0E), .ep_dataout(wait_count_5)); 

okWireIn    wi15 (.okHE(okHE),   .ep_addr(8'h0F), .ep_dataout(high_count_6));  
okWireIn    wi16 (.okHE(okHE),   .ep_addr(8'h10), .ep_dataout(low_count_6));
okWireIn    ep17 (.okHE(okHE),   .ep_addr(8'h11), .ep_dataout(wait_count_6)); 

okWireIn    wi18 (.okHE(okHE),   .ep_addr(8'h12), .ep_dataout(rst));  
//wire [31:0] test;
//assign test = count_5;
//assign base_clk_1 = base_1 == 100 ? clk : (base_1 == 90 ? clk_90 :( base_1 == 80 ? clk_80 : (base_1 == 70 ? clk_70 : clk_60)) );
//assign base_clk_2 = (base_2 == 100) ? clk : (base_2 == 90 ? clk_90 :( base_2 == 80 ? clk_80 : (base_2 == 70 ? clk_70 : clk_60)) );
//assign base_clk_3 = base_3 == 100 ? clk : (base_3 == 90 ? clk_90 :( base_3 == 80 ? clk_80 : (base_3 == 70 ? clk_70 : clk_60)) );
//assign base_clk_4 = base_4 == 100 ? clk : (base_4 == 90 ? clk_90 :( base_4 == 80 ? clk_80 : (base_4 == 70 ? clk_70 : clk_60)) );
//assign base_clk_5 = base_5 == 100 ? clk : (base_5 == 90 ? clk_90 :( base_5 == 80 ? clk_80 : (base_5 == 70 ? clk_70 : clk_60)) );
//assign base_clk_6 = base_6 == 100 ? clk : (base_6 == 90 ? clk_90 :( base_6 == 80 ? clk_80 : (base_6 == 70 ? clk_70 : clk_60)) );
wire clk_1_o, clk_2_o, clk_3_o, clk_4_o, clk_5_o, clk_6_o;
//PLL  PLL_inst_1(base_clk_1, count_1, rst, clk_1_o);
//PLL  PLL_inst_2(base_clk_2, count_2, rst,clk_2_o);
//PLL  PLL_inst_3(clk, count_3, rst,clk_3_o);
//PLL  PLL_inst_4(clk, count_4, rst,clk_4_o);
//PLL  PLL_inst_5(base_clk_5, count_5, rst,clk_5_o);
//PLL  PLL_inst_6(base_clk_6, count_6, rst,clk_6_o);
PLL  PLL_inst_1(clk, high_count_1, low_count_1, rst, wait_count_1, clk_1_o);
PLL  PLL_inst_2(clk, high_count_2, low_count_2, rst, wait_count_2, clk_2_o);
PLL  PLL_inst_3(clk, high_count_3, low_count_3, rst, wait_count_3, clk_3_o);
PLL  PLL_inst_4(clk, high_count_4, low_count_4, rst, wait_count_4, clk_4_o);
PLL  PLL_inst_5(clk, high_count_5, low_count_5, rst, wait_count_5, clk_5_o);
PLL  PLL_inst_6(clk, high_count_6, low_count_6, rst, wait_count_6, clk_6_o);

assign TEST_IO[1] = clk;
assign TEST_IO[2] = clk_1_o ;
assign TEST_IO[3] = clk_2_o ;
assign TEST_IO[4] = clk_3_o ;
assign TEST_IO[5] = clk_4_o  ;
assign TEST_IO[6] = clk_5_o ; 
assign TEST_IO[7] = clk_6_o ;
assign TEST_IO[8] = clk ;
assign TEST_IO[9] = clk ;
endmodule
