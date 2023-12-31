`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 10:22:55
// Design Name: 
// Module Name: Modulo
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


module Modulo_top(
    input clk,
    input signed[12:0]N,
    input [11:0]M,
    input start,
    output busy,
    output [12:0]mod
    );
    
    wire R1,R2, R3, R4, R5, R6,R7, R8,R9,R10;
    wire [12:0] V;
    wire signed [12:0] nega;
    wire [11:0] C;
    wire [12:0] M1;
    
    Modulo_DP Datapath (
        .clk(clk),
        .N(N),
        .M(M),
        .mod(mod),
        .R1(R1),
        .R2(R2),
        .R3(R3),
        .R4(R4),
        .R5(R5),
        .R6(R6),
        .R7(R7),
        .R8(R8),
        .R9(R9),
        .R10(R10),
        .V(V),
        .C(C),
        .nega(nega),
        .M1(M1)
        );

    Modulo_FSM Control_Unit (
            .clk(clk),
            .start(start),
            .busy(busy),
            .N(N),
            .M(M),
            .R1(R1),
            .R2(R2),
            .R3(R3),
            .R4(R4),
            .R5(R5),
            .R6(R6),
            .R7(R7),
            .R8(R8),
            .R9(R9),
            .R10(R10),
            .V(V),
            .nega(nega),
            .C(C),
            .M1(M1)
            );
    
endmodule
