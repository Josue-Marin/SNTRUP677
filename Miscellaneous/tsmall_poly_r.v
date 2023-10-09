`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2023 16:50:59
// Design Name: 
// Module Name: tsmall_poly_r
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


module tsmall_poly_r(
    input clk,
    input write_enable,
    output reg write_done
    );
    
      
  parameter p=677;
  parameter t=101;
  wire [11:0]mem_output;
  reg [11:0]mem_input;
  reg [9:0]mem_address_i;
  reg [9:0]mem_address_o;
  wire [1:0]rand;
  reg [31:0]seed;
  integer zerocount=0;
  reg write_done1;
  
  RandomNG randut(
       .seed(seed),
       .rand(rand)
  );
  
  r rpoly(
      .clk(clk),
      .output_data(mem_output),
      .input_data(mem_input),
      .read_address(mem_address_o),
      .write_address(mem_address_i),
      .write_enable(write_enable)  
  );
  
  
  
  integer i=0;
  integer ran;
  always @(posedge clk) begin
      seed <= $random + 1;
      if (i < p) begin
         mem_input <= rand;
         if (rand==0 || rand==1 || rand==3) begin
             ran<=1;
         end
      end    
  end 
  always @(posedge clk) begin 
      if (ran && write_enable && (i < p)) begin
           mem_address_i <=i;
           write_done <= 0;
           i=i+1;
      end 
      else if(ran) begin
           write_done <= 1;
      end
  end
  integer j=0;
  integer Ad;
  integer minusco=0;
  integer onesco=0;
  always @(posedge clk) begin
     if (write_done && (j <= p)) begin
           mem_address_o <=j;
           //mem_address_i<=0;
           j=j+1;
           if (mem_output==0) begin
                 zerocount=zerocount+1;
           end
     end
  end
  integer k=0;
  integer flag=0;
  always @(posedge clk) begin
     if (j==p+1 && write_enable && zerocount<=(p-2*t)) begin
           if(k<=p && flag==0)begin
               mem_address_o <=k;
               Ad<=k;
               if (mem_output==1 && minusco<((((p-2*t)-zerocount)-100))) begin 
                     mem_input <= 0;
                     mem_address_i <=Ad;
                     minusco=minusco+1;
               end
               k=k+1;
           end
           else begin
                flag<=1;
           end    
           if(k>0 && flag) begin
               mem_address_o <=k;
               Ad<=k;
               if (mem_output==3 && onesco<(100)) begin
                 mem_input <= 0;
                 mem_address_i <=Ad; 
                 onesco=onesco+1;
               end
               k=k-1;
           end
           write_done1 <= 0;
     end
     else if(minusco!=0 && onesco!=0) begin
        write_done1 <= 1;
     end
  end
  integer zerocount1=0;
  integer c=0;
  integer v=0;
  always @(posedge clk) begin
     if (write_done1 && (c <= p)) begin
           mem_address_o <=c;
           v<=1;
           c=c+1;
           if (mem_output==0 && v) begin
                 zerocount1=zerocount1+1;
           end
      end
  end
endmodule