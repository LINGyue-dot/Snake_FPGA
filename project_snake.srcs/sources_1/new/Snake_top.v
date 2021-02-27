`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/27 17:35:26
// Design Name: 
// Module Name: Snake_top
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

//顶层模块

module Snake_top
(
    input clk,
	input rst,
	
	input left,
	input right,
	input up,
	input down,

    // vga 
	output hsync,
	output vsync,
	output  [3:0] vga_r,
	output [3:0] vga_g,
	output  [3:0] vga_b,
	
	// 数码管
	output [7:0]seg_out,
	output [3:0]sel
);

	wire left_key;
	wire right_key;
	wire up_key;
	wire down_key;
	
	//
	wire [1:0]position_color; // 背景颜色渲染
	
	wire [9:0]scan_x;// 实际像素坐标
	wire [9:0]scan_y;
	wire [5:0]Fruit_x;// 果实格坐标
	wire [4:0]Fruit_y;
	
	// 
	wire [5:0]head_x;
	wire [5:0]head_y;
	
	wire add_snake; // 加分信号
	wire[1:0]game_status;
	wire hit_body;
	wire die_flash;
	wire restart;
	wire [6:0]snake_num;
	
	wire rst_n;
	assign rst_n = ~rst;

    Game_init game_init (
        .clk(clk),
	    .rst(rst_n),
	    .left_key(left_key),
	    .right_key(right_key),
	    .up_key(up_key),
	    .down_key(down_key),
        .game_status(game_status),
		.hit_body(hit_body),
		.die_flash(die_flash),
		.restart(restart)		
	);
	
	Fruit_generate fruit_generate (
        .clk(clk),
		.rst(rst_n),
		.Fruit_x(Fruit_x),
		.Fruit_y(Fruit_y),
		.head_x(head_x),
		.head_y(head_y),
		.add_snake(add_snake)	
	);
	
	Snake_move snake_move (
	    .clk(clk),
		.rst(rst_n),
		.left_key(left_key),
		.right_key(right_key),
		.up_key(up_key),
		.down_key(down_key),
		.position_color(position_color),
		.scan_x(scan_x),
		.scan_y(scan_y),
		.head_x(head_x),
		.head_y(head_y),
		.add_snake(add_snake),
		.game_status(game_status),
		.snake_num(snake_num),
		.hit_body(hit_body),
		.die_flash(die_flash)
	);

	VGA_top vga_top (
		.clk(clk),
		.rst(rst),
		.hsync(hsync),
		.vsync(vsync),
		.position_color(position_color),
		.Fruit_x(Fruit_x),
		.Fruit_y(Fruit_y),
		.scan_x(scan_x),
		.scan_y(scan_y),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b)
	);
	
	Key_relive key (
		.clk(clk),
		.rst(rst_n),
		.left(left),
		.right(right),
		.up(up),
		.down(down),
		.left_key(left_key),
		.right_key(right_key),
		.up_key(up_key),
		.down_key(down_key)		
	);
	
	Seven_segments seven_segments (
		.clk(clk),
		.rst(rst_n),	
		.add_snake(add_snake),
		.game_status(game_status),
		.seg_out(seg_out),
		.sel(sel)	
	);
endmodule

