`timescale 1ns / 1ps

module tb_main;

    // Inputs to DUT
    reg [7:0] p_addr0;        // Processor address for CORE0
    reg [7:0] p_data0;        // Processor data for CORE0
    reg clk, reset;           // Clock and reset
    reg req0;                 // Request for CORE0
    reg p_func0;              // Processor function (1-bit: 0 = read, 1 = write)

    // Outputs from DUT
    wire ready0;              // Ready signal for CORE0

    // Instantiate the DUT
    main DUT (
        .p_addr0(p_addr0),
        .p_addr1(8'b0),        // Unused CORE1 inputs
        .p_data0(p_data0),
        .p_data1(8'bz),        // Unused CORE1 inputs
        .clk(clk),
        .reset(reset),
        .req0(req0),
        .req1(1'b0),           // CORE1 not active
        .p_func0(p_func0),
        .p_func1(1'b0),        // CORE1 not active
        .ready0(ready0),
        .ready1()              // CORE1 not monitored
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Waveform dump setup
        $dumpfile("waveform.vcd"); // Specifies the waveform file
        $dumpvars(0, tb_main);     // Dumps all variables in tb_main hierarchy

        // Initialize inputs
        clk = 0;
        reset = 1;
        req0 = 0;
        p_func0 = 1;               // Write operation
        p_addr0 = 8'h10;
        p_data0 = 8'hAB;

        // Reset the DUT
        #10 reset = 0;
        #10 reset = 1;

        // CORE0 Write Miss
        #10 req0 = 1; // Issue write request (miss expected)
        #10 req0 = 0;
        wait (ready0 == 1);

        // CORE0 Write Hit (same address as before)
        #10 p_data0 = 8'hEF; // Update the data
        #10 req0 = 1; // Issue another write request (hit expected)
        #10 req0 = 0;
        wait (ready0 == 1);

        // Verify outputs
        $display("Write miss and hit test complete for CORE0.");

        // End simulation
        #10 $finish;
    end

endmodule
