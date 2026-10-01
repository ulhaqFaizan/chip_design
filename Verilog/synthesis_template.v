
// ========== SYNTHESIS TEMPLATE #1: COMBINATIONAL LOGIC ==========
// Use for: Pure combinational logic (no memory, no state)
// Key requirement: ALL inputs in sensitivity list (or use always @(*) in Verilog-2001)
// Result: Infers gates (AND, OR, NOT, MUX, etc.)
always @ (all_inputs) begin
	// Combinational logic - no if without else (causes latch!)
	// Use blocking (=) for combo, but nonblocking (<=) also works
end

// ========== SYNTHESIS TEMPLATE #2: LATCH (USUALLY UNINTENDED!) ==========
// CAUTION: if without else creates a latch to hold previous value
// Latches are usually unintended bugs in digital design
// Missing else clause -> output not defined for all cases -> infers memory
always @ (all_inputs) begin
	if (enable) begin
		// latch value assignments
	end
	// MISSING else -> Latch inferred! Previous value held when enable=0
end

// ========== SYNTHESIS TEMPLATE #3: SYNCHRONOUS SEQUENTIAL LOGIC ==========
// Use for: Flip-flops, registers, counters (synchronous reset)
// Key requirement: Only clock in sensitivity list
// Result: Infers D flip-flops
always @ (posedge clk) begin
	// Sequential logic with synchronous reset
	// Always use nonblocking (<=) assignments
	if (sync_reset) begin
		// reset behavior (happens at clock edge)
	end else begin
		// normal behavior
	end
end

// ========== SYNTHESIS TEMPLATE #4: ASYNC RESET SEQUENTIAL LOGIC ==========
// Use for: Flip-flops with asynchronous reset (most common in ASIC/FPGA)
// Key requirement: Clock edge AND reset edge in sensitivity list
// Result: Infers D flip-flops with async reset/set
always @ (posedge clk or negedge resetn) begin
	if (! resetn) begin
		// Async reset behavior: Executes immediately on resetn falling edge
		// Independent of clock - resets happen instantly
	end else begin
		// Synchronous behavior: Only executes on clock rising edge
	end
end