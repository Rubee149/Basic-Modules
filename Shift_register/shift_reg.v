module shift_reg #(
    parameter MSB=8
) (
    input d,
    input clk,
    input en,
    input dir,
    input reset,
    output reg [MSB-1:0] out
);

always @(posedge clk) begin
//This always block will "always" be triggered on the rising edge of clock
    if(!reset)
      out <= 0; // Once it enters the block, it will first check to see if reset is 0 and if yes then reset register
    else begin
        if(en) //If no, then check to see if the shift register is enabled
        case (dir)
            0 : out <= {out[MSB-2:0],d};
            1 : out <= {d, out[MSB-1:1]}; 
        endcase
        else // If no, maintain previous output. If yes, then shift based on requested direction
          out <= out;
    end
    
end
    
endmodule