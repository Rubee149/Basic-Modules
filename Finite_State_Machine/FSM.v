module FSM(

        input clk,

        input x,

        output y);

    reg [1:0] state;

    assign y = state[1] & state[0] & x;

    always @ (posedge clk)

        case (state)

            2'b00: state <= x?2'b01:2'b00; // If the current state is 2'b00, it checks the value of signal x. If x is true (non-zero), it transitions to state 2'b01; otherwise, it stays in state 2'b00

            2'b01: state <= x?2'b10:2'b00; // If the current state is 2'b01, it checks the value of signal x. If x is true (non-zero), it transitions to state 2'b10; otherwise, it stays in state 2'b00

            2'b10: state <= x?2'b11:2'b00; // If the current state is 2'b10, it checks the value of signal x. If x is true (non-zero), it transitions to state 2'b11; otherwise, it stays in state 2'b00

            2'b11: state <= 2'b00; // If the current state is 2'b11, it always transitions back to state 2'b00
            
            default: state <= 2'b00;
        endcase

endmodule