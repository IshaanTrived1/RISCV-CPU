module instruction_memory(
    input logic [31:0] pc, //comes from pc.sv from top level 
    output logic [31:0] instruction,
);

logic [31:0] mem [0:255]; //array that holds instruction in indexes

initial begin //initial because we only have to load instructions into the array once
$readmemh("program.hex", mem); //reads and writes instructions from a file into the array
end

assign instruction = mem[pc[9:2]]; //dividing by 4 to convert byte address into array index


endmodule