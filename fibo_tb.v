module fibo_tb();
    reg clk;
    reg reset;
    reg enable;
    wire [15:0] fib_out;
    wire done;
        fibo uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .fib_out(fib_out),
        .done(done)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        enable = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 enable = 1;
        #10 enable = 0;  
        #10 enable = 1;
        #10 enable = 0;
        #10 enable = 1;
        #10 enable = 0;
        #20 $finish;
    end
    initial begin
        $monitor("Time: %0t, fib_out: %d, done: %b", $time, fib_out, done);
    end
endmodule
