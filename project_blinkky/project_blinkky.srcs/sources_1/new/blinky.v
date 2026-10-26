`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2026 11:31:40 PM
// Design Name: 
// Module Name: blinky
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


module blinky(
    input clk,
    output led0,
    output led1
    );
    
    reg[26:0] counter;
    
    always @(posedge clk)
        counter <= counter + 1'b1;
        
    assign led0 = counter[26];
    assign led1 = counter[25];
    
endmodule
