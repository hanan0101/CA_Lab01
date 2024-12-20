`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 02:12:04 AM
// Design Name: 
// Module Name: n_bit_counter
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


module n_bit_counter#(
    parameter PROG_VALUE = 3
)(
    input logic clk, 
    input logic reset_n, 
    output logic [$clog2(PROG_VALUE) - 1:0] count
);

    always_ff @(posedge clk, negedge reset_n)
    begin 
        if(~reset_n) begin 
            count <= 0;
        end else begin 
            count <= count + 1;
        end 
    end

endmodule : n_bit_counter

