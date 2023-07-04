`timescale 1ns/1ns
`include "FSM.v"

module FSM_tb;

  reg clk;
  reg x;
  wire y;

  FSM uut (
    .clk(clk),
    .x(x),
    .y(y)
  );

  initial begin

  $dumpfile("FSM_tb.vcd");
  $dumpvars(0,FSM_tb);

    clk = 0;
    x = 0;

    // Reset the state initially
    #5;
    x = 1;
    #5;
    x = 0;

    // Test case 1
    #5;
    x = 1;
    #5;
    x = 0;

    // Test case 2
    #5;
    x = 1;
    #5;
    x = 1;
    #5;
    x = 1;

    // Test case 3
    #5;
    x = 0;
    #5;
    x = 0;

    // Additional test cases
    // ...
    $display("Test Complete");
    $finish;
  end

  always #5 clk = ~clk;

endmodule
