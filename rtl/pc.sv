module pc (
    input logic [31:0]next_pc,
    input clk,
    input reset,
    output logic [31:0]pc

);

always_ff @(posedge clk) begin
    if(!reset) begin
        pc <= next_pc; 
    end
    else begin
        pc <= 0;
    end
end


endmodule