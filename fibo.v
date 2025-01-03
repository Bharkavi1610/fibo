module fibo(
    input clk,
    input reset,
    input enable,
    output reg [15:0] fib_out,
    output reg done
);                                            
    reg [15:0] fib_0, fib_1;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            fib_0 <= 16'd0;
            fib_1 <= 16'd1;
            fib_out <= 16'd0;
            done <= 0;
        end else if (enable) begin
            fib_out <= fib_0;
            fib_0 <= fib_1;
            fib_1 <= fib_0 + fib_1;
            done <= 1;
        end else begin
            done <= 0;
        end
    end
endmodule
