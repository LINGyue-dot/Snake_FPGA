`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/2717:40:46
// Design Name: 
// Module Name: Game_init
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:   游戏初始化准备
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



// 
module Game_init
(
	input clk,
	input rst,
	input left_key,
	input right_key,
	input up_key,
	input down_key,
	
	output reg [1:0]game_status,
	input hit_body,
	output reg die_flash,
	output reg restart		
);
	
	localparam RESTART = 2'b00;
	localparam START = 2'b01;
	localparam PLAY = 2'b10;
	localparam DIE = 2'b11;
	
	reg[31:0]clk_cnt; // 计时器
	
	always@(posedge clk or negedge rst)
	begin
		if(!rst) begin //   重置
			game_status <= START;
			clk_cnt <= 0;
			die_flash <= 1;
			restart <= 0;
		end
		else begin
			case(game_status)			
				RESTART:begin           //游戏开始等待 ,  做延迟处理
					if(clk_cnt <= 5) begin 
						clk_cnt <= clk_cnt + 1;
						restart <= 1;						
					end
					else begin
						game_status <= START;
						clk_cnt <= 0;
						restart <= 0;
					end
				end
				START:begin
					if (left_key | right_key | up_key | down_key)
                        game_status <= PLAY;
					else 
					    game_status <= START;
				end
				PLAY:begin
					if(hit_body)
					   game_status <= DIE;
					else
					   game_status <= PLAY;
				end					
				DIE:begin
					if(clk_cnt <= 300_000_000) begin
						clk_cnt <= clk_cnt + 1'b1;
					   if(clk_cnt ==100_000_000)
					       die_flash <= 0;
					   else if(clk_cnt == 150_000_000)
					       die_flash <= 1'b0;
					   else if(clk_cnt == 270_000_000)
					       die_flash <= 1'b1;
				    end                        
					else
						begin
							die_flash <= 1;
							clk_cnt <= 0;
							game_status <= RESTART;
						end
					end
			endcase
		end
	end
endmodule
