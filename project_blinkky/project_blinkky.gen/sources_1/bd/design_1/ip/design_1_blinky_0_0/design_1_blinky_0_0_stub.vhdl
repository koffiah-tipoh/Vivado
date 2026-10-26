-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1.1 (lin64) Build 5094488 Fri Jun 14 08:57:50 MDT 2024
-- Date        : Sat Oct 24 23:40:29 2026
-- Host        : khoffy running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/koffiah/Workspace/FPGA/Vivado/project_blinkky/project_blinkky.gen/sources_1/bd/design_1/ip/design_1_blinky_0_0/design_1_blinky_0_0_stub.vhdl
-- Design      : design_1_blinky_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_blinky_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    led0 : out STD_LOGIC;
    led1 : out STD_LOGIC
  );

end design_1_blinky_0_0;

architecture stub of design_1_blinky_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,led0,led1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "blinky,Vivado 2024.1.1";
begin
end;
