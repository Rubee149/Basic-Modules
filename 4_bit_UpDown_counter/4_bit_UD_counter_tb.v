`timescale 1ns/1ns
`include "4_bit_UD_counter.v"

module updowncounter_testbench();
reg clk,reset,up_down;
wire [3:0] counter;

up_down_counter dut(clk,reset,up_down,counter);

always   #5 clk=~clk;

initial begin

     $dumpfile("4_bit_UD_counter_tb.vcd");
     $dumpvars(0,updowncounter_testbench);

    clk=0;
    reset=1;
    up_down = 0;
    #20;
    reset=0;
    #200;
    up_down=1;
    //terminate simulation using $finish system task
    #500
    $display("Test Complete");
    $finish;
end
    
endmodule