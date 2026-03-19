module tb_mlkem;

    reg clk;
    reg reset;

    // DUT
    mlkem_accelerator uut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #20;
        reset = 0;

        #1000;

        $finish;
    end

endmodule
