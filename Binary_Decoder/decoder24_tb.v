`timescale 1ns/1ns
`include "decoder24.v"

module decoder24_tb;

//input ports are decleared in reg(register)
reg a,b,en;

//output ports are decleared in wire(net)
wire [3:0]y;

//instanttiate design block
decoder24 dut(en,a,b,y);

initial begin

     $dumpfile("decoder24_tb.vcd");
     $dumpvars(0,decoder24_tb);

    $monitor("en=%b a=%b b=%b y=%b",en,a,b,y);
    // with reference to truth table provide input values
    en=1;a=1'bx;b=1'bx;#5
    en=0;a=0;b=0;#5
    en=0;a=0;b=1;#5
    en=0;a=1;b=0;#5
    en=0;a=1;b=1;#5

    $display("Test Complete");

    //terminate simulation using $finish system task
    $finish;
end
    
endmodule