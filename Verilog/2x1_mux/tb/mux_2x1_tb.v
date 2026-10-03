module tb; 
    // declare all imputs and outputs
    reg a, b, sel;
    wire c, c1;

    integer i;

    // instantiate mux module
    mux_2x1 u0 (.a(a), .b(b), .sel(sel), .c(c));

    mux1_2x1 u1 (.a(a), .b(b), .sel(sel), .c(c1));

    initial begin
        // create waveforms
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);

        // iniliaze inputs
        a = 0;
        b = 0;
        sel = 0;

        $monitor("a=%0b, b=%0b, sel=%0b, c=%0b, c1=%0b", a, b, sel, c, c1);

        for(i = 0; i < 8; i++) begin
            {a,b,sel} = i;
            #10;
        end

        // test for sel = x
        sel = 1'bx;
        for(i = 0; i < 4; i++) begin
            {a,b} = i;
            #10;
        end

        // test for sel = z
        sel = 1'bz;
        for(i = 0; i < 4; i++) begin
            {a,b} = i;
            #10;
        end
        $finish;
    end
endmodule