module elevator_tb;

reg clk, rst;
reg ra, rb, rc, rd;
wire [1:0] floor;

// Instantiate the module to be tested
elevator dut (
    .clk(clk),
    .rst(rst),
    .ra(ra),
    .rb(rb),
    .rc(rc),
    .rd(rd),
    .floor(floor)
);

// Clock generation
always #5 clk = ~clk;

// Initial values
initial begin
    clk = 0;
    rst = 1;
    ra = 0;
    rb = 0;
    rc = 0;
    rd = 0;
    #10 rst = 0; // Deassert reset
    #50;
    ra = 1; // Example input values
    #50;
    rb = 1;
    #50;
    rc = 1;
    #50;
    rd = 1;
    #100;
    $finish;
end

// Display outputs
always @(posedge clk) begin
    $display("Time = %0t, Floor = %b", $time, floor);
end

endmodule
