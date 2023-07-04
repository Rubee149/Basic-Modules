`timescale 1ns/1ns
`include "shift_reg.v"

module shift_reg_tb;
 parameter MSB =16;

 reg data;
 reg clk;
 reg en;
 reg dir;
 reg reset;
 wire [MSB-1:0] out;

//Initiate design (16-bit shift register) by passing MSB and connect with Testbench signals
 shift_reg #(MSB) sr0 (.d(data),
                       .clk(clk),
                       .en(en),
                       .dir(dir),
                       .reset(reset),
                       .out(out));
 always #10 clk = ~clk;

 initial begin
     $dumpfile("shift_reg_tb.vcd");
     $dumpvars(0,shift_reg_tb);

    clk <= 0;
    en <= 0;
    dir <= 0;
    reset <= 0;
    data <= 'h1;
 end

 initial begin

    //Apply reset and deassert reset after 10ns
    reset <= 0;
    #20 reset <= 1;
        en <= 1;
    //For 7 clock cycles, drive alternate vakues to data pin
    repeat (7) @ (posedge clk)
     data <= ~data;
    // Next 7 clock cycles, change shift direction and drive alternative values todata pin
    #10 dir <= 1;
    repeat (7) @ (posedge clk)
     data <= ~data;
    // Drive nothing for next 7 clocks, allow shift register to simply shift based on direction
    repeat (7) @ (posedge clk);

    $display("Test Complete");
    $finish;
 end
 initial
    $monitor ("reset=%b, data=%b, en=%b, dir=%b, out=%b",reset,data,en,dir,out);
    
endmodule