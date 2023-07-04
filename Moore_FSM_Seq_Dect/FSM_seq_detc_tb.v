`timescale 1ns/1ns
`include "FSM_seq_detc.v"

// Verilog project: Verilog code for Sequence Detector using Moore FSM
// Verilog Testbench for Sequence Detector using Moore FSM 
module tb_Sequence_Detector_Moore_FSM_Verilog;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
 Sequence_Detector_MOORE_Verilog uut (
  .sequence_in(sequence_in), 
  .clock(clock), 
  .reset(reset), 
  .detector_out(detector_out)
 );

 always #5 clock = ~clock;
 
 initial begin
 clock = 0;
 end 

 initial begin

  $dumpfile("FSM_seq_detc_tb.vcd");
  $dumpvars(0,tb_Sequence_Detector_Moore_FSM_Verilog);
  // Initialize Inputs
  sequence_in = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
      reset = 0;
  #40;
  sequence_in = 1;
  #10;
  sequence_in = 0;
  #10;
  sequence_in = 1; 
  #20;
  sequence_in = 0; 
  #20;
  sequence_in = 1; 
  #20;
  sequence_in = 0;  
  // Add stimulus here
  
  $display("Test Complete");
  $finish;
 end
      
endmodule

