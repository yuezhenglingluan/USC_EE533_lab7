`timescale 1ns / 1ps

module D_addr_src_MUX
(
    input [63:0] ALU_result_M,
    input [63:0] rt_M,
    input SW_M,

    output [7:0] D_addr
);

    assign D_addr = (SW_M == 1) ? ALU_result_M[7:0] : rt_M[7:0];

endmodule