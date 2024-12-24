`timescale 1ns / 1ps

module test_main;

    // Inputs to DUT
    reg [7:0] p_addr0;
    wire [7:0] p_data0; // Changed from reg to wire
    reg [7:0] p_addr1;
    wire [7:0] p_data1; // Changed from reg to wire
    reg clk, reset;
    reg req0, req1;
    reg p_func0, p_func1;

    // Outputs from DUT
    wire ready0, ready1;

    // DUT instance
    main uut (
        .p_addr0(p_addr0),
        .p_data0(p_data0),
        .p_addr1(p_addr1),
        .p_data1(p_data1),
        .clk(clk),
        .reset(reset),
        .req0(req0),
        .req1(req1),
        .p_func0(p_func0),
        .p_func1(p_func1),
        .ready0(ready0),
        .ready1(ready1)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        req0 = 0; req1 = 0;
        p_func0 = 0; p_func1 = 0;
        p_addr0 = 8'h10;
        p_addr1 = 8'h20;

        #10 reset = 0;
        #10 reset = 1;

        // Write operation test
        p_func0 = 1; // Write operation
        req0 = 1;
        #10 req0 = 0;

        // Read operation test
        p_func0 = 0; // Read operation
        req0 = 1;
        #10 req0 = 0;

        $finish;
    end
endmodule

