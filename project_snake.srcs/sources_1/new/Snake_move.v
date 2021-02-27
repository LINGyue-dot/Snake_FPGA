`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/27 19:13:10
// Design Name: 
// Module Name: Snake_move
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

//���˶��������ģ��
module Snake_move
(
	input clk,
	input rst,
	
	input left_key,
	input right_key,
	input up_key,
	input down_key,
	
	output reg  [1:0]position_color,//����ʶ����Ⱦ��ɫ״̬  0 �Ǳ���  1�� ����
	
	input [9:0]scan_x,
	input [9:0]scan_y,//ɨ������  ��λ��"���ص�"
	
	output [5:0]head_x,	
	output [5:0]head_y,//ͷ��������
	
	input add_snake,//�����峤�ź�
	
	input [1:0]game_status,//������Ϸ״̬
	
	output reg [6:0]snake_num, // ����
	
	output reg hit_body,   //ײ�������ź�
	input die_flash        //�����ź�
);
	

	

	
	reg[31:0]cnt; // ʱ�Ӽ�ʱ��
	
	wire[1:0]direct;  // ����
	reg [1:0]direct_r;     //�Ĵ淽��
	assign direct = direct_r;//�Ĵ���һ������
	reg[1:0]direct_next;
	
	reg change_to_left;
	reg change_to_right;
	reg change_to_up;
	reg change_to_down;
	
	reg [5:0]snake_x[15:0]; // ��ÿ�� ������
	reg [5:0]snake_y[15:0];
	reg [15:0]snake;  // ��ʾ����  1�ͱ�ʾ��ڴ��� .... ���Ż� 
	
	reg addsnake_state;
	
	assign head_x = snake_x[0]; // ͷ������
	assign head_y = snake_y[0]; 
	
	// ״̬��ʾ
    localparam UP = 2'b00;
	localparam DOWN = 2'b01;
	localparam LEFT = 2'b10;
	localparam RIGHT = 2'b11;
	
	localparam NONE = 2'b00; //  ���Ż� ����һλ��ʾ
	localparam HEAD = 2'b01;

    localparam RESTART = 2'b00;
	localparam PLAY = 2'b10;
	
		//  ����ɨ��
		always @(scan_x or scan_y ) begin				
		if(scan_x >= 0 && scan_x < 640 && scan_y >= 0 && scan_y < 480) begin

			 if(scan_x[9:4] == snake_x[0] && scan_y[9:4] == snake_y[0] && snake[0] == 1) 
				position_color = (die_flash == 1) ? HEAD: NONE; //
			else if
				((scan_x[9:4] == snake_x[1] && scan_y[9:4] == snake_y[1] && snake[1] == 1)|
				 (scan_x[9:4] == snake_x[2] && scan_y[9:4] == snake_y[2] && snake[2] == 1)|
				 (scan_x[9:4] == snake_x[3] && scan_y[9:4] == snake_y[3] && snake[3] == 1)|
				 (scan_x[9:4] == snake_x[4] && scan_y[9:4] == snake_y[4] && snake[4] == 1)|
				 (scan_x[9:4] == snake_x[5] && scan_y[9:4] == snake_y[5] && snake[5] == 1)|
				 (scan_x[9:4] == snake_x[6] && scan_y[9:4] == snake_y[6] && snake[6] == 1)|
				 (scan_x[9:4] == snake_x[7] && scan_y[9:4] == snake_y[7] && snake[7] == 1)|
				 (scan_x[9:4] == snake_x[8] && scan_y[9:4] == snake_y[8] && snake[8] == 1)|
				 (scan_x[9:4] == snake_x[9] && scan_y[9:4] == snake_y[9] && snake[9] == 1)|
				 (scan_x[9:4] == snake_x[10] && scan_y[9:4] == snake_y[10] && snake[10] == 1)|
				 (scan_x[9:4] == snake_x[11] && scan_y[9:4] == snake_y[11] && snake[11] == 1)|
				 (scan_x[9:4] == snake_x[12] && scan_y[9:4] == snake_y[12] && snake[12] == 1)|
				 (scan_x[9:4] == snake_x[13] && scan_y[9:4] == snake_y[13] && snake[13] == 1)|
				 (scan_x[9:4] == snake_x[14] && scan_y[9:4] == snake_y[14] && snake[14] == 1)|
				 (scan_x[9:4] == snake_x[15] && scan_y[9:4] == snake_y[15] && snake[15] == 1))
				 position_color = (die_flash == 1) ? HEAD :NONE;//ɨ������
			else
			 position_color=NONE;
		end
	end
	
	
	
	
	
	
	
	always @(posedge clk or negedge rst) begin		
		if(!rst)
		// ��ͷĬ�� ��ʼ����
			direct_r <= RIGHT; 
		else if(game_status == RESTART) 
		    direct_r <= RIGHT;
		else
			direct_r <= direct_next;
	end

    
	always @(posedge clk or negedge rst) begin
		if(!rst) begin
			cnt <= 0;
								
			snake_x[0] <= 12;
			snake_y[0] <= 7;
					
			snake_x[1] <= 11;
			snake_y[1] <= 7;
					
			snake_x[2] <= 0;
			snake_y[2] <= 0;

			snake_x[3] <= 0;
			snake_y[3] <= 0;
					
			snake_x[4] <= 0;
			snake_y[4] <= 0;
					
			snake_x[5] <= 0;
			snake_y[5] <= 0;
					
			snake_x[6] <= 0;
			snake_y[6] <= 0;
					
			snake_x[7] <= 0;
			snake_y[7] <= 0;
					
			snake_x[8] <= 0;
			snake_y[8] <= 0;
					
			snake_x[9] <= 0;
			snake_y[9] <= 0;					
					
			snake_x[10] <= 0;
			snake_y[10] <= 0;
					
			snake_x[11] <= 0;
			snake_y[11] <= 0;
					
            snake_x[12] <= 0;
			snake_y[12] <= 0;
					
			snake_x[13] <= 0;
			snake_y[13] <= 0;
					
			snake_x[14] <= 0;
			snake_y[14] <= 0;
					
			snake_x[15] <= 0;
			snake_y[15] <= 0;

			hit_body <= 0;
		end		
		else if(game_status == RESTART) begin
                    cnt <= 0;
                                                    
			         snake_x[0] <= 12;
			         snake_y[0] <= 7;
					
			         snake_x[1] <= 11;
			         snake_y[1] <= 7;
					
			         snake_x[2] <= 0;
			         snake_y[2] <= 0;
                    
                    snake_x[3] <= 0;
                    snake_y[3] <= 0;
                                        
                    snake_x[4] <= 0;
                    snake_y[4] <= 0;
                                        
                    snake_x[5] <= 0;
                    snake_y[5] <= 0;
                                        
                    snake_x[6] <= 0;
                    snake_y[6] <= 0;
                                        
                    snake_x[7] <= 0;
                    snake_y[7] <= 0;
                                        
                    snake_x[8] <= 0;
                    snake_y[8] <= 0;
                                        
                    snake_x[9] <= 0;
                    snake_y[9] <= 0;
                                        
                    snake_x[10] <= 0;
                    snake_y[10] <= 0;
                                        
                    snake_x[11] <= 0;
                    snake_y[11] <= 0;
                                        
                    snake_x[12] <= 0;
                    snake_y[12] <= 0;
                                        
                    snake_x[13] <= 0;
                    snake_y[13] <= 0;
                                        
                    snake_x[14] <= 0;
                    snake_y[14] <= 0;
                                        
                    snake_x[15] <= 0;
                    snake_y[15] <= 0;

                    hit_body <= 0;                            
        end
		else begin
			cnt <= cnt + 1;
			if(cnt == 24_500_000) begin   // �ƶ��ٶȿ���   2��/s
				cnt <= 0;
				if(game_status == PLAY) begin // ��ǽ
                    if(direct==UP&&snake_y[0] ==0)
                        snake_y[0]<=29;
                    else if(direct==DOWN&&snake_y[0]==29)
                        snake_y[0]<=0;
                    else if(direct==LEFT&&snake_x[0]==0)
                        snake_x[0]<=39;
                     else if(direct==RIGHT&&snake_x[0]==39)
                        snake_x[0]<=0;
					   

					else
					// ������ ��ͷ��������� ����ĸ�����  ˵�������Լ������� 
					 if((snake_y[0] == snake_y[1] && snake_x[0] == snake_x[1] && snake[1] == 1)|
							(snake_y[0] == snake_y[2] && snake_x[0] == snake_x[2] && snake[2] == 1)|
							(snake_y[0] == snake_y[3] && snake_x[0] == snake_x[3] && snake[3] == 1)|
							(snake_y[0] == snake_y[4] && snake_x[0] == snake_x[4] && snake[4] == 1)|
							(snake_y[0] == snake_y[5] && snake_x[0] == snake_x[5] && snake[5] == 1)|
							(snake_y[0] == snake_y[6] && snake_x[0] == snake_x[6] && snake[6] == 1)|
							(snake_y[0] == snake_y[7] && snake_x[0] == snake_x[7] && snake[7] == 1)|
							(snake_y[0] == snake_y[8] && snake_x[0] == snake_x[8] && snake[8] == 1)|
							(snake_y[0] == snake_y[9] && snake_x[0] == snake_x[9] && snake[9] == 1)|
							(snake_y[0] == snake_y[10] && snake_x[0] == snake_x[10] && snake[10] == 1)|
							(snake_y[0] == snake_y[11] && snake_x[0] == snake_x[11] && snake[11] == 1)|
							(snake_y[0] == snake_y[12] && snake_x[0] == snake_x[12] && snake[12] == 1)|
							(snake_y[0] == snake_y[13] && snake_x[0] == snake_x[13] && snake[13] == 1)|
							(snake_y[0] == snake_y[14] && snake_x[0] == snake_x[14] && snake[14] == 1)|
							(snake_y[0] == snake_y[15] && snake_x[0] == snake_x[15] && snake[15] == 1))
							hit_body <= 1;
					else begin
						snake_x[1] <= snake_x[0];
						snake_y[1] <= snake_y[0];
										
						snake_x[2] <= snake_x[1];
						snake_y[2] <= snake_y[1];
										
						snake_x[3] <= snake_x[2];
						snake_y[3] <= snake_y[2];
										
						snake_x[4] <= snake_x[3];
						snake_y[4] <= snake_y[3];
										
						snake_x[5] <= snake_x[4];
						snake_y[5] <= snake_y[4];
										
						snake_x[6] <= snake_x[5];
						snake_y[6] <= snake_y[5];
										
						snake_x[7] <= snake_x[6];
						snake_y[7] <= snake_y[6];
										
						snake_x[8] <= snake_x[7];
						snake_y[8] <= snake_y[7];
										
						snake_x[9] <= snake_x[8];
						snake_y[9] <= snake_y[8];
										
						snake_x[10] <= snake_x[9];
						snake_y[10] <= snake_y[9];
										
						snake_x[11] <= snake_x[10];
						snake_y[11] <= snake_y[10];
										
						snake_x[12] <= snake_x[11];
						snake_y[12] <= snake_y[11];
										 
						snake_x[13] <= snake_x[12];
						snake_y[13] <= snake_y[12];
										
						snake_x[14] <= snake_x[13];
						snake_y[14] <= snake_y[13];
										
						snake_x[15] <= snake_x[14];
						snake_y[15] <= snake_y[14];
						
						
						//  �ƶ�����
						case(direct)							
							UP: begin
									snake_y[0] <= snake_y[0]-1;
							end
									
							DOWN: begin
									snake_y[0] <= snake_y[0] + 1;
							end
										
							LEFT: begin
									snake_x[0] <= snake_x[0] - 1;											
							end

							RIGHT: begin
									snake_x[0] <= snake_x[0] + 1;
							end
						endcase			
					end
				end
			end
		end
	end
	

	
	
	
	
	
	always @(*) begin  
		direct_next = direct;		
        case(direct)	 // ����ѡ�� ����ʱ�� direct --> direct_next -->direct_r  --> direct
		    UP: begin   
			    if(change_to_left)
				    direct_next = LEFT;
			    else if(change_to_right)
				    direct_next = RIGHT;
			    else
				    direct_next = UP;			
		    end		
			
		    DOWN: begin
			    if(change_to_left)
				    direct_next = LEFT;
			    else if(change_to_right)
			        direct_next = RIGHT;
			    else
				    direct_next = DOWN;			
		    end		
			
		    LEFT: begin
			    if(change_to_up)
				    direct_next = UP;
			    else if(change_to_down)
    			    direct_next = DOWN;
			    else
				    direct_next = LEFT;			
		    end
		
		    RIGHT: begin
			    if(change_to_up)
				    direct_next = UP;
			    else if(change_to_down)
				    direct_next = DOWN;
			    else
				    direct_next = RIGHT;
		    end	
	    endcase
	end
	
	always @(posedge clk) begin     //���ĸ�������ֵ
		if(left_key == 1)
			change_to_left <= 1;
		else if(right_key == 1)
			change_to_right <= 1;
		else if(up_key == 1)
			change_to_up <= 1;
		else if(down_key == 1)
			change_to_down <= 1;
		else begin
			change_to_left <= 0;
			change_to_right <= 0;
			change_to_up <= 0;
			change_to_down <= 0;
		end
	end
	
	
	// ���ȿ���
	always @(posedge clk or negedge rst) begin
		if(!rst) begin
			snake <= 16'd3;
			snake_num <= 2; // ���ȳ�ʼ��Ϊ2
			addsnake_state <= 0;
		end  
		else if (game_status == RESTART) begin
		      snake <= 16'd3;
              snake_num <= 2;
              addsnake_state <= 0;
         end
		else begin			
			case(addsnake_state)  
				0:begin
					if(add_snake) begin
						snake_num <= snake_num + 1;
						snake[snake_num] <= 1;
						addsnake_state <= 1;// ����䳤
					end						
				end
				1:begin
					if(!add_snake)
						addsnake_state <= 0;				
				end
			endcase
		end
	end


	

endmodule
