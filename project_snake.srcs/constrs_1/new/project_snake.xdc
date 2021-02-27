set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {vga_r[0]}]; 
IO_L8N_T1_AD14N_35 Sch = vga_r[0]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {vga_r[1]}]; 
IO_L7N_T1_AD6N_35 Sch = vga_r[1]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {vga_r[2]}]; 
IO_L1N_T0_AD4N_35 Sch = vga_r[2]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {vga_r[3]}]; 
IO_L8P_T1_AD14P_35 Sch = vga_r[3]

set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {vga_g[0]}]; 
IO_L1P_T0_AD4P_35 Sch = vga_g[0]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {vga_g[1]}]; 
IO_L3N_T0_DQS_AD5N_35 Sch = vga_g[1]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {vga_g[2]}]; 
IO_L2N_T0_AD12N_35 Sch = vga_g[2]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {vga_g[3]}]; 
IO_L3P_T0_DQS_AD5P_35 Sch =vga_g[3]

set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {vga_b[0]}]; 
IO_L2P_T0_AD12P_35 Sch = vga_b[0]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {vga_b[1]}]; 
IO_L4N_T0_35 Sch = vga_b[1]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {vga_b[2]}]; 
IO_L6N_T0_VREF_35 Sch = vga_b[2]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {vga_b[3]}]; 
IO_L4P_T0_35 Sch = vga_b[3]

set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports {hsync}]; 
IO_L4P_T0_15 Sch = hsync
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports {vsync}]; 
IO_L3N_T0_DQS_AD1N_15 Sch = vsync

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {rst}]; IO_L24N_T3_RS0_15 Sch = rst
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {clk}]; IO_L12P_T1_MRCC_35 Sch = clk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];


set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {seg_out[0]}]; IO_L24N_T3_A00_D16_14 Sch = seg_out[0]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {seg_out[1]}]; IO_25_14 Sch = seg_out[1]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {seg_out[2]}]; IO_25_15 Sch = seg_out[2]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {seg_out[3]}]; IO_L17P_T2_A26_15 Sch = seg_out[3]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {seg_out[4]}]; IO_L13P_T2_MRCC_14 Sch = seg_out[4]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {seg_out[5]}]; IO_L19P_T3_A10_D26_14 Sch = seg_out[5]
set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {seg_out[6]}]; IO_L4P_T0_D04_14 Sch = seg_out[6]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports {seg_out[7]}]; IO_L19N_T3_A21_VREF_15 Sch = seg_out[7]

set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {sel[3]}]; IO_L23P_T3_FOE_B_15 Sch = sel[3]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {sel[2]}]; IO_L23N_T3_FWE_B_15 Sch = sel[2]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {sel[1]}]; IO_L24P_T3_A01_D17_14 Sch = sel[1]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {sel[0]}]; IO_L19P_T3_A22_15 Sch = sel[0]

set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports {up}]; IO_L4N_T0_D05_14 Sch = up
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {left}]; IO_L12P_T1_MRCC_14 Sch = left
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports {right}]; IO_L10N_T1_D15_14 Sch = right
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {down}]; IO_L9N_T1_DQS_D13_14 Sch = down