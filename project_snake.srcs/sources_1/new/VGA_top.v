`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/26 22:22:08
// Design Name: 
// Module Name: VGA_top
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


module VGA_top(
    input clk,
    input rst,
    input [1:0]position_color,
    input [5:0]Fruit_x,
    input [4:0]Fruit_y,
    output [9:0]scan_x,
    output [9:0]scan_y,    
    output hsync, // hang 同步
    output vsync, // zhen 同步
    
   	output  [3:0] vga_r,
	output [3:0] vga_g,
	output  [3:0] vga_b
    );
    
    wire vga_clk;
    
    clk_unit vgaClk(
        .clk(clk),
        .rst(rst),
        .vga_clk(vga_clk)
        );
        
     VGA_show vgaShow(
        .clk(vga_clk),
		.rst(rst),
		.position_color(position_color),
		.Fruit_x(Fruit_x),
		.Fruit_y(Fruit_y),
		.scan_x(scan_x),
		.scan_y(scan_y),
		.hsync(hsync),
		.vsync(vsync),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b)
		);

      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
