# Ultra96-V2 Blinky — PL-Only

Minimal FPGA blinky design for the **Ultra96-V2** board, targeting only the
Zynq UltraScale+ MPSoC **Programmable Logic (PL)** fabric. Two radio LEDs
blink at different rates. No PS software or PetaLinux required.

## Hardware

| Item | Notes |
|------|-------|
| Ultra96-V2 board | Zynq UltraScale+ MPSoC (xczu3eg-sbva484-1-i) |
| 12 V DC power supply | Barrel jack |
| USB micro cable | For JTAG programming |

## Software

| Item | Version |
|------|---------|
| Xilinx Vivado | 2024.1+ |
| Avnet Ultra96-V2 Board Definition Files (BDF) | Latest from [Avnet GitHub](https://github.com/Avnet/Ultra96-V2-Board-Definition-Files) |

## Project Structure

project_blinkky/
├── project_blinkky.srcs/
│ ├── constrs_1/
│ │ └── new/
│ │ └── blinky.xdc # Pin constraints (A9, B9)
│ └── sources_1/
│ └── bd/
│ └── design_1/
│ └── hdl/
│ └── design_1_wrapper.v # Auto-generated wrapper
├── project_blinkky.gen/
│ └── sources_1/
│ └── bd/
│ └── design_1/
│ └── synth/
│ └── design_1.v # Block design HDL
├── project_blinkky.runs/
│ ├── synth_1/
│ ├── impl_1/
│ └── impl_1/
│ └── design_1_wrapper.bit # Final bitstream
└── blinky.v # RTL source (top-level module)


## RTL

`blinky.v` — 27-bit free-running counter; bit 26 drives LED0, bit 25 drives LED1.

```verilog
module blinky (
    input  clk,
    output led0,
    output led1
);
    reg [26:0] counter;

    always @(posedge clk)
        counter <= counter + 1'b1;

    assign led0 = counter[26];  // ~0.75 Hz
    assign led1 = counter[25];  // ~1.5 Hz
endmodule

Pin Mapping
Port	FPGA Pin	Board LED	Color	Rate
led0	A9	D9	Yellow	~0.75 Hz
led1	B9	D10	Blue	~1.5 Hz

I/O Standard: LVCMOS18 (Bank 26)

Build Steps
Open Vivado → File → Open Project → select project_blinkky.xpr
Run Bitstream (Project Navigator → right-click project → Run Bitstream)
This executes: Synthesis → Implementation → Bitstream
Output: project_blinkky.runs/impl_1/design_1_wrapper.bit
Programming
Connect Ultra96-V2 to PC via micro-USB (JTAG)
Power the board (12 V)
In Vivado: Open Hardware Manager → Open Target → Auto Connect
Right-click the device → Program Device → select design_1_wrapper.bit
Confirm — LEDs should begin blinking immediately
Expected Result
LED	Color	Blink Rate
D9	Yellow	~0.75 Hz (toggle every ~0.67 s)
D10	Blue	~1.5 Hz (toggle every ~0.33 s)

Notes
The PS (ARM cores) is not programmed in this design. The MPSoC IP is
included in the block design solely to provide pl_clk0 (100 MHz) and
board-level MIO configuration via Block Automation.
maxihpm0_fpd_aclk and maxihpm1_fpd_aclk are tied to pl_clk0 to
satisfy clock validation (no AXI HP master is used).
No reset is applied to the counter; it begins toggling within a few
cycles of configuration.
