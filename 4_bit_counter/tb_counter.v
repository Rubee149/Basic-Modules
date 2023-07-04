`timescale 1ps/1ps
`include "counter.v"


module tb_counter;
 reg clk;
 reg rstn;
 wire [3:0] out;

 //Instantiate counter design and connect with Testbench variables
 counter c0(.clk(clk),
            .rstn(rstn),
            .out(out));
 
 //Generate a clock that should be driven to design
 //This clock will flip its value every 5ns -> time period = 10ns -> freq 100MHz
 always #5 clk = ~clk;

 //This initial block forms the stimulus of the testbench
initial begin

     $dumpfile("tb_counter.vcd");
     $dumpvars(0,tb_counter);
    //1. Initialize testbench variables to 0 at start of simulation
    clk <= 0;
    rstn <= 0;

    //2.Drive rest of stimulus, reset is assert in between
    #20 rstn <= 1;
    #80 rstn <= 0;
    #50 rstn <= 1;

    //3. Finising the stimulus after 200ns
    #20 $finish;

    $display("Test Complete");
end

 

 endmodule