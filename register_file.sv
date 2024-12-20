`timescale 1ns / 1ps

module register_file #(
    parameter NUM_REGS = 4,        
    parameter REG_WIDTH = 16        
)(
    input logic clk,           
    input logic rst_n,              
    input logic en,                
    input logic [REG_WIDTH-1:0] data_in,  
    input logic [1:0] rs1,         
    input logic [1:0] rs2,         
    input logic [1:0] rd, // distation         
    output logic [REG_WIDTH-1:0] op1,  // output rd 1
    output logic [REG_WIDTH-1:0] op2   // Output rd 2
);

    // Register array
    logic [REG_WIDTH-1:0] reg_array [0:NUM_REGS-1];
    assign reg_array[0] =0;
    
   

    always_ff @( posedge clk, negedge rst_n) begin
        if (~rst_n) begin 
            for (int i = 1; i < NUM_REGS; i++) begin
                reg_array[i] <= 0; 
            end
            
       end else begin // wire data 
         reg_array[rd] <= data_in;  
        
      end
   end 
    

    assign op1 = reg_array[rs1]; 
    assign op2 = reg_array[rs2]; 

endmodule
