module tb_mlkem;

    reg clk;
    reg rst;

    // DUT
    mlkem_accelerator uut (
        .clk(clk),
        .reset(rst)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;

        #1000;

        $finish;
    end

endmodule
