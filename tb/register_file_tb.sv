`timescale 1ns/1ps

module register_file_tb;

logic clk = 0;
logic [4:0] read_addr1;
logic [4:0] read_addr2;
logic [4:0] write_addr;
logic [31:0] write_data;
logic we;

logic [31:0] out1;
logic [31:0] out2;


register_file dut(
    .clk(clk),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .write_addr(write_addr),
    .write_data(write_data),
    .we(we),
    .out1(out1),
    .out2(out2)
);

always #5 clk = ~clk;



initial begin

    we = 1;
    write_addr = 5'd5;
    write_data = 32'd42;
    @(posedge clk); //waits for a clock cycle
    @(negedge clk); //stops race edge for we 
    we = 0;

    read_addr1 = 5'd5;
    read_addr2 = 0;
    #10;



    if(out1 == 32'd42)
        $display("Value pulled: %d", out1);
        $finish;
end



endmodule