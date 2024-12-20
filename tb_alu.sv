`timescale 1ns / 1ps

module tb_alu;
    parameter n = 16;
  
    // Declare signals for testbench
    logic [n-1:0] a;
    logic [n-1:0] b;
    logic [1:0] op;
    logic [n-1:0] x0, x1, x2, x3 ,x4;

    // Instantiate the ALU
    alu #(n) alu_inst (
        .rs1(a),
        .rs2(b),
        .rd(op),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4)
    );

    // Test procedure
    initial begin 
        // Test case 1: 0 + 0
        a = 16'b0000_0000_0000_0000; 
        b = 16'b0000_0000_0000_0000;
        op = 2'b00; // Addition
        #10;

        // Test case 2: 8 + 1
        a = 16'b0000_0000_0000_1000; 
        b = 16'b0000_0000_0000_0001;
        op = 2'b00; // Addition
        #10;

        // Test case 3: 0 OR 1
        a = 16'b0000_0000_0000_0000; 
        b = 16'b0000_0000_0000_0001;
        op = 2'b11; // Bitwise OR
        #10;

        // Test case 4: 2 - 3
        a = 16'b0000_0000_0000_0010; 
        b = 16'b0000_0000_0000_0011;
        op = 2'b01; // Subtraction
        #10;

        // Test case 5: 2 & 3
        a = 16'b0000_0000_0000_0010; 
        b = 16'b0000_0000_0000_0011;
        op = 2'b10; // Bitwise AND
        #10;

        // Test case 6: 128 AND 4
        a = 16'b1000_0000_0000_0000; 
        b = 16'b0000_0000_0000_0100;
        op = 2'b10; // Bitwise AND
        #10;

        // Finish simulation
        $finish;
    end 
endmodule