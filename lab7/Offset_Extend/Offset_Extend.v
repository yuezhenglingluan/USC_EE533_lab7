`timescale 1ns / 1ps

module Offset_Extend
(
    input [15:0] Offset,

    output [31:0] Offset_ID
);

    assign Offset_ID[15:0] = Offset;
    assign Offset_ID[31:16] = 16'b0;

endmodule