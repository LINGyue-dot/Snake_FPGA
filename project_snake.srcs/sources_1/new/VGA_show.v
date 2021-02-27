`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/26 22:39:06
// Design Name: 
// Module Name: VGA_show
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


module VGA_show(
	input clk,
	input rst,
	
	input [1:0]position_color,
	input [5:0]Fruit_x, // ��ʵ��ʵ�ʸ�����
	input [4:0]Fruit_y,
	
	//  Ϊ�˽�����ź��ٸ�ֵ������˿�
	output reg[9:0]scan_x, // ��ǰɨ������� vga
	output reg[9:0]scan_y,	
	output reg hsync, // ��ɨ��
	output reg vsync, // ֡ɨ��
	output reg [3:0] vga_r,
	output reg [3:0] vga_g,
	output reg [3:0] vga_b
    );
    
    
    reg [9:0]hsync_count; //  ��ɨ�� ��� 800 
	reg [9:0]vsync_count;//  ֡ɨ�� ��� 525
	
	localparam NONE = 2'b00; // ����
	localparam HEAD = 2'b01; // ͷ
	localparam BODY = 2'b10; // ����
	
	localparam HEAD_COLOR = 12'b0000_1111_0000;
	localparam BODY_COLOR = 12'b0000_1111_1111;
	
	
	reg [3:0]lox;
	reg [3:0]loy;
		
	always@(posedge clk or negedge rst) begin
		if(rst) begin  // ����
			hsync_count <= 0;
			vsync_count <= 0;
			hsync <= 1;
			vsync <= 1;
		end
		else begin
		    scan_x <= hsync_count - 144; // 96+48 �͵�ƽ+��ʾǰ��
			scan_y <= vsync_count - 35; // 2+33 �͵�ƽ+ ��ʾǰ��	
			if(hsync_count == 0) begin
			    hsync <= 0;
				hsync_count <= hsync_count + 1;
            end
			else if(hsync_count == 96) begin //
				hsync <= 1;
				hsync_count <= hsync_count + 1;
            end
			else if(hsync_count == 800) begin
				hsync_count <= 0;
				vsync_count <= vsync_count + 1;
			end
			else hsync_count <= hsync_count + 1;
			if(vsync_count == 0) begin
				vsync <= 0;
            end
			else if(vsync_count == 2) begin
				vsync <= 1;
			end
			else if(vsync_count == 525) begin
				vsync_count <= 0;
				vsync <= 0;
			end
			
			if(scan_x >= 0 && scan_x < 640 && scan_y >= 0 && scan_y < 480) begin
			    lox = scan_x[3:0];
				loy = scan_y[3:0];			
                 // ��ʵ��С 15x15			
				if(scan_x[9:4] == Fruit_x && scan_y[9:4] == Fruit_y)begin
				
					 vga_r=4'b1111;
                     vga_g=4'b0000;						
                     vga_b=4'b0000;		
						
                 end
				else if(position_color == NONE)begin // background
					vga_r=4'b0000;
                    vga_g=4'b0000;						
                    vga_b=4'b0000;	
			     end
				else if(position_color==HEAD) begin   // 1 Ϊ��
					vga_r=4'b0000;
                    vga_g=4'b1111;						
                    vga_b=4'b0000;	
				end
			end
		    else begin 
			        vga_r=4'b0000;
                    vga_g=4'b0000;						
                    vga_b=4'b0000;	
             end
		end
    end
endmodule
