`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2023 18:44:44
// Design Name: 
// Module Name: mem2_2
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


module mem2_2(
    input clk,
    input write_enable,
    input read_address, 
    input write_address,
    input input_data,
    input [10:0]deg,
    output [10:0]dego,
    output output_data
    );
    
   parameter RAM_WIDTH = 26;
   parameter RAM_ADDR_BITS = 11;

   (* ram_style="distributed" *)
   reg [RAM_WIDTH-1:0] mem2_2 [(2**RAM_ADDR_BITS)-1:0];

   wire [RAM_WIDTH-1:0] output_data;

   wire [RAM_ADDR_BITS-1:0] read_address, write_address;
   wire [RAM_WIDTH-1:0] input_data;

   always @(posedge clk)
      if (write_enable)
         mem2_2[write_address] <= input_data;

   assign output_data = mem2_2[read_address];
   assign dego=deg;
endmodule
