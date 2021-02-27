`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/26 21:35:29
// Design Name: 
// Module Name: clk_unit
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

 // fengping 100M to 25M
 // four part
module clk_unit(
    input clk,
    input rst,
    output vga_clk
    );
    reg vga_clk;
    reg clk_tmp;
    always@(posedge clk_tmp or posedge rst)begin
        if(rst)
            vga_clk<=0;
         else
            vga_clk<=~vga_clk;
      end
      
      always@(posedge  clk or posedge rst)begin
           if(rst)
                clk_tmp<=0;
            else
                clk_tmp<=~clk_tmp;
        end
endmodule
