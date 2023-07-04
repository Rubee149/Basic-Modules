`timescale 1ns/1ns
`include "Mux_4to1.v"

module mux_4to1_tb;
  reg [3:0] a, b, c, d;
  reg [1:0] sel;
  wire [3:0] out;
  
  mux_4to1 uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .out(out)
  );
  
  initial begin

     $dumpfile("Mux_4to1_tb.vcd");
     $dumpvars(0,mux_4to1_tb);

    $monitor("a = %b, b = %b, c = %b, d = %b, sel = %b, out = %b", a, b, c, d, sel, out);
    
    // Test case 1
    a = 4'b0100;
    b = 4'b1010;
    c = 4'b0011;
    d = 4'b1100;
    sel = 2'b00;
    #10;
    
    // Test case 2
    sel = 2'b01;
    #10;
    
    // Test case 3
    sel = 2'b10;
    #10;
    
    // Test case 4
    sel = 2'b11;
    #10;
    
    // Additional test cases
    // ...
    $display("Test Complete");
    $finish;
  end
endmodule
