module pr_en ( input [7:0] a,        // Input 0 (highest priority)
               input [7:0] b,        // Input 1
               input [7:0] c,        // Input 2
               input [7:0] d,        // Input 3 (lowest priority)
               input [1:0] sel,      // 2-bit priority select
               output reg [7:0] out); // Encoded output

    // Priority encoder using if-else chain
    // sel == 2'b00 has highest priority, sel == 2'b11 has lowest
    always @ (a or b or c or d or sel) begin
        if (sel == 2'b00)             // Highest priority: select input 'a'
            out = a;
        else if (sel == 2'b01)        // Priority 2: select input 'b'
            out = b;
        else if (sel == 2'b10)        // Priority 3: select input 'c'
            out = c;
        else                          // Lowest priority: select input 'd'
            out = d;
    end
endmodule