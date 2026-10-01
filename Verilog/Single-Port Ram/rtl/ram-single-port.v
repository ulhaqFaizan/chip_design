module ram_single_port
#(
 parameter ADDR_WIDTH = 16, // 64K addresses
 parameter DATA_WIDTH = 32 // 32-bit data bus
)
(
 input wire clk, // Clock input
 input wire we, // Write enable (1=write, 0=read)
 input wire [ADDR_WIDTH-1:0] addr, // Address input
 input wire [DATA_WIDTH-1:0] din, // Data input (for writes)
 output wire [DATA_WIDTH-1:0] dout // Data output (for reads)
);

 // Memory array: 2^16 locations, each 32 bits wide
 reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0];

 // Synchronous write operation
 always @(posedge clk) begin
 if (we == 1'b1)
 mem[addr] <= din; // Write data to address 'addr' on clock edge
 end

 // Asynchronous read operation (combinational)
 assign dout = mem[addr]; // Read data from current address

endmodule