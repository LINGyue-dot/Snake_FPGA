`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/27 19:28:53
// Design Name: 
// Module Name: Key_relive
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


//按键检测模块 延时消抖
module Key_relive(
	input clk,
	input rst,
	
	input left,
	input right,
	input up,
	input down,
	
	output reg left_key,
	output reg right_key,
	output reg up_key,
	output reg down_key
);

	reg [19:0]clk_cnt; // 定时器  用于按键消抖判断
	
	// 记录上次按键
	reg left_key_last;
	reg right_key_last;
	reg up_key_last;
	reg down_key_last;
	
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			clk_cnt <= 0;
			left_key <= 0;
			right_key <= 0;
			up_key <= 0;
			down_key <= 0;
					
			left_key_last <= 0;
			right_key_last <= 0;
			up_key_last <= 0;
			down_key_last <= 0;					
		end	
		else begin
			if(clk_cnt == 20'd999_999) begin // 20,ms 最大值 开始计时
				clk_cnt <= 0;
				left_key_last <= left;
				right_key_last <= right;
				up_key_last <= up;
				down_key_last <= down;
					
				if(left_key_last == 0 && left == 1) 
					left_key <= 1;
				if(right_key_last == 0 && right == 1)
					right_key <= 1;
				if(up_key_last == 0 && up == 1)
					up_key <= 1;
				if(down_key_last == 0 && down == 1)
					down_key <= 1;
			end						
			else begin
				clk_cnt <= clk_cnt + 1;
				left_key <= 0;
				right_key<= 0;
				up_key <= 0;
				down_key <= 0;
			end
		end	
	end				
endmodule
