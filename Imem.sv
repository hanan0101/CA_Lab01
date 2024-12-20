`timescale 1ns / 1ps



module Imem #(
    parameter IMEM_DEPTH = 64
)(
    input logic [$clog2(IMEM_DEPTH) - 1: 0]addr,
    output logic [7:0] inst
);

    // instruction memory 
    logic [7:0] imem [ 0 : IMEM_DEPTH];


    
    // initialize instruction memory, we have already added the below statement in the testbench, so no need to do that here
    initial begin   
    $readmemb("/home/it/Downloads/CX-204-Lab1/support_files/fib_im.mem",imem);
    end
    // read inst combinatinally ( continous assignment) 
    assign inst = imem[addr];




endmodule : Imem    
    

