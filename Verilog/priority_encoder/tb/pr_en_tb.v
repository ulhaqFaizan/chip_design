module tb_pr_en;
    reg [7:0] a;              // Test input 0 (highest priority)
    reg [7:0] b;              // Test input 1
    reg [7:0] c;              // Test input 2
    reg [7:0] d;              // Test input 3 (lowest priority)
    wire [7:0] out;           // Encoder output
    reg [1:0] sel;            // Priority select signal
    integer i;

    // Instantiate the priority encoder
    pr_en pr_en0 ( .a (a),
                   .b (b),
                   .c (c),
                   .d (d),
                   .sel (sel),
                   .out (out));

    initial begin
        sel <= 0;

        // Initialize inputs with random values
        a <= $random;
        b <= $random;
        c <= $random;
        d <= $random;

        // Test all priority levels
        for (i = 1; i < 4; i = i + 1) begin
            #5 sel <= i;      // Change priority select every 5 time units
        end

        #5 $finish;           // End simulation
    end
endmodule