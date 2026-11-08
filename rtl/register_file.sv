module register_file( //the register file basically holds short term vales - fast memory
//CPU's working memory
input logic [4:0] read_addr1,
input logic [4:0] read_addr2,
input logic [4:0] write_addr,
input logic [31:0] write_data,
input logic we,
input logic clk,


output logic [31:0] out1,
output logic [31:0] out2
);

logic [31:0] reg_file [0:31];

//recieve addresses (1 or 2) then output the value associated with them or writes it
//also can recieve a write port and write the value to an address

assign out1 = (read_addr1 == 0) ? 32'b0 : reg_file[read_addr1]; // if 0 then 0x else value at address
assign out2 = (read_addr2 == 0) ? 32'b0 : reg_file[read_addr2];

always_ff @(posedge clk) begin //writing data logic
    if(we && write_addr != 0) begin
        reg_file[write_addr] <= write_data;
    end
end





endmodule