`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/27 20:02:59
// Design Name: 
// Module Name: Fruit_generate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  果实随机生成
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//苹果产生控制模块
module Fruit_generate
(
	input clk,
	input rst,
	
	input [5:0]head_x, //头 格坐标 用于判断是否迟到果实
	input [5:0]head_y,
	output reg [5:0]Fruit_x,
	output reg [4:0]Fruit_y,
	output reg add_snake
);

	reg [31:0]clk_cnt;
	reg [10:0]random_num;
	
	always@(posedge clk)
		random_num <= random_num + 999; ///// ??????
		// 生成 11 位   果实 x 高6位 ,  y低5位
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			clk_cnt <= 0;
			Fruit_x <= 13;
			Fruit_y <= 9;
			add_snake <= 0;
		end
		else begin
			clk_cnt <= clk_cnt+1;
			if(clk_cnt == 250_000) begin
				clk_cnt <= 0;
				if(Fruit_x == head_x && Fruit_y == head_y) begin // 吃到果实
					add_snake <= 1;
					Fruit_x <= (random_num[10:5] > 39) ? (random_num[10:5] - 25) : (random_num[10:5] == 0) ? 1 : random_num[10:5];
					Fruit_x <= (random_num[4:0] > 29) ? (random_num[4:0] - 3) : (random_num[4:0] == 0) ? 1:random_num[4:0];
				end  
				else
					add_snake <= 0;
			end
		end
	end
endmodule