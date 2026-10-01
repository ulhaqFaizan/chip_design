`timescale 1ns/1ps

module tb_ram_single_port;

    // Parameters
    parameter ADDR_WIDTH = 16;
    parameter DATA_WIDTH = 32;

    // Testbench signals
    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // Instantiate DUT
    ram_single_port #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dut (
        .clk  (clk),
        .we   (we),
        .addr (addr),
        .din  (din),
        .dout (dout)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initialize inputs
        we   = 1'b0;
        addr = 16'h0000;
        din  = 32'h00000000;

        // Wait for a little
        #10;

        // ------------------------------------------------
        // TEST 1: Write data to address 0
        // ------------------------------------------------
        $display("TEST 1: Writing to address 0");

        addr = 16'h0000;
        din  = 32'hDEADBEEF;
        we   = 1'b1;

        @(posedge clk);
        #1;

        // Disable write
        we = 1'b0;

        // Because read is asynchronous, dout should
        // immediately reflect the contents of address 0
        #1;

        if (dout === 32'hDEADBEEF)
            $display("PASS: Address 0 contains DEADBEEF");
        else
            $display("FAIL: Address 0 contains %h", dout);


        // ------------------------------------------------
        // TEST 2: Write another address
        // ------------------------------------------------
        $display("TEST 2: Writing to address 1");

        addr = 16'h0001;
        din  = 32'h12345678;
        we   = 1'b1;

        @(posedge clk);
        #1;

        we = 1'b0;
        #1;

        if (dout === 32'h12345678)
            $display("PASS: Address 1 contains 12345678");
        else
            $display("FAIL: Address 1 contains %h", dout);


        // ------------------------------------------------
        // TEST 3: Verify address 0 was not overwritten
        // ------------------------------------------------
        $display("TEST 3: Checking address 0");

        addr = 16'h0000;
        #1;

        if (dout === 32'hDEADBEEF)
            $display("PASS: Address 0 still contains DEADBEEF");
        else
            $display("FAIL: Address 0 contains %h", dout);


        // ------------------------------------------------
        // TEST 4: Overwrite address 0
        // ------------------------------------------------
        $display("TEST 4: Overwriting address 0");

        addr = 16'h0000;
        din  = 32'hCAFEBABE;
        we   = 1'b1;

        @(posedge clk);
        #1;

        we = 1'b0;
        #1;

        if (dout === 32'hCAFEBABE)
            $display("PASS: Address 0 overwritten correctly");
        else
            $display("FAIL: Address 0 contains %h", dout);


        // ------------------------------------------------
        // TEST 5: Verify asynchronous read
        // ------------------------------------------------
        $display("TEST 5: Checking asynchronous read");

        addr = 16'h0001;

        // No clock edge here!
        #1;

        if (dout === 32'h12345678)
            $display("PASS: Asynchronous read works");
        else
            $display("FAIL: Expected 12345678, got %h", dout);


        // ------------------------------------------------
        // TEST 6: Verify write enable
        // ------------------------------------------------
        $display("TEST 6: Checking write enable");

        addr = 16'h0002;
        din  = 32'hAAAAAAAA;
        we   = 1'b0;

        @(posedge clk);
        #1;

        // Since we=0, memory should NOT be written.
        // This location has never been initialized,
        // so dout is expected to be X in simulation.
        if (dout === 32'hAAAAAAAA)
            $display("FAIL: Data was written even though we=0");
        else
            $display("PASS: Write correctly disabled");


        // ------------------------------------------------
        // Finish
        // ------------------------------------------------
        $display("--------------------------------");
        $display("RAM TESTBENCH COMPLETE");
        $display("--------------------------------");

        $finish;
    end

endmodule
