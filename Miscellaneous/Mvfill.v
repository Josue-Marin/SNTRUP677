`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2023 09:42:39
// Design Name: 
// Module Name: Mvfill
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


module Mvfill(
//  input clk,
  input [10:0]index,
  output reg[12:0]data
  );
  parameter p=677;
  
  always @(index)
        case (index)
            p : begin
                data <= 13'b01; 
            end
            1 : begin
                data <= -13'd1; 
            end                     
            0: begin
                data <= -13'b1; 
            end
            2047: begin
                data <= p; 
            end
            default: begin
                data <= 13'b00;  
            end
      endcase
     
endmodule 