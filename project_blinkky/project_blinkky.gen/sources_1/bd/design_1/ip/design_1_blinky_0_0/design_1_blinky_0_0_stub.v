// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.1 (lin64) Build 5094488 Fri Jun 14 08:57:50 MDT 2024
// Date        : Sat Oct 24 23:40:29 2026
// Host        : khoffy running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/koffiah/Workspace/FPGA/Vivado/project_blinkky/project_blinkky.gen/sources_1/bd/design_1/ip/design_1_blinky_0_0/design_1_blinky_0_0_stub.v
// Design      : design_1_blinky_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "blinky,Vivado 2024.1.1" *)
module design_1_blinky_0_0(clk, led0, led1)
/* synthesis syn_black_box black_box_pad_pin="led0,led1" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  output led0;
  output led1;
endmodule
