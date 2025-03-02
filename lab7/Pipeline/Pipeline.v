////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : Pipeline.vf
// /___/   /\     Timestamp : 03/01/2025 23:20:51
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "E:/Documents and Settings/student/EE533_Lab7/Pipeline.sch" Pipeline.vf
//Design Name: Pipeline
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module Pipeline(clk, 
                Instr_IN, 
                Instr_W_en, 
                I_W_Addr, 
                rst, 
                ADDI_EX, 
                ADDI_ID, 
                ADDI_M, 
                ADDI_WB, 
                ALU_B, 
                ALU_OP_EX, 
                ALU_OP_ID, 
                ALU_result_EX, 
                ALU_result_M, 
                ALU_result_WB, 
                BEQ_ID, 
                BGT_ID, 
                BLT_ID, 
                D_MEM_addr, 
                D_out_M, 
                D_out_WB, 
                Instruction, 
                J_ID, 
                LW_EX, 
                LW_ID, 
                LW_M, 
                LW_WB, 
                MOVI_EX, 
                MOVI_ID, 
                MOVI_M, 
                MOVI_WB, 
                NOOP_EX, 
                NOOP_ID, 
                NOOP_M, 
                NOOP_WB, 
                Offset_EX, 
                Offset_ID, 
                Offset_M, 
                Offset_WB, 
                OP_CODE_ID, 
                PC, 
                PC_ctrl, 
                PC_next, 
                PC_plus_one, 
                RF_WB_Din, 
                rs_data_EX, 
                rs_data_ID, 
                rs_data_M, 
                rs_data_WB, 
                rs_ID, 
                rt_data_EX, 
                rt_data_ID, 
                rt_data_M, 
                rt_EX, 
                rt_ID, 
                rt_M, 
                rt_WB, 
                SW_EX, 
                SW_ID, 
                SW_M, 
                SW_WB, 
                WME_EX, 
                WME_ID, 
                WME_M, 
                WRE_EX, 
                WRE_ID, 
                WRE_M, 
                WRE_WB);

    input clk;
    input [31:0] Instr_IN;
    input Instr_W_en;
    input [8:0] I_W_Addr;
    input rst;
   output ADDI_EX;
   output ADDI_ID;
   output ADDI_M;
   output ADDI_WB;
   output [63:0] ALU_B;
   output [3:0] ALU_OP_EX;
   output [3:0] ALU_OP_ID;
   output [63:0] ALU_result_EX;
   output [63:0] ALU_result_M;
   output [63:0] ALU_result_WB;
   output BEQ_ID;
   output BGT_ID;
   output BLT_ID;
   output [7:0] D_MEM_addr;
   output [63:0] D_out_M;
   output [63:0] D_out_WB;
   output [31:0] Instruction;
   output J_ID;
   output LW_EX;
   output LW_ID;
   output LW_M;
   output LW_WB;
   output MOVI_EX;
   output MOVI_ID;
   output MOVI_M;
   output MOVI_WB;
   output NOOP_EX;
   output NOOP_ID;
   output NOOP_M;
   output NOOP_WB;
   output [63:0] Offset_EX;
   output [63:0] Offset_ID;
   output [63:0] Offset_M;
   output [63:0] Offset_WB;
   output [5:0] OP_CODE_ID;
   output [63:0] PC;
   output PC_ctrl;
   output [63:0] PC_next;
   output [63:0] PC_plus_one;
   output [63:0] RF_WB_Din;
   output [63:0] rs_data_EX;
   output [63:0] rs_data_ID;
   output [63:0] rs_data_M;
   output [63:0] rs_data_WB;
   output [4:0] rs_ID;
   output [63:0] rt_data_EX;
   output [63:0] rt_data_ID;
   output [63:0] rt_data_M;
   output [4:0] rt_EX;
   output [4:0] rt_ID;
   output [4:0] rt_M;
   output [2:0] rt_WB;
   output SW_EX;
   output SW_ID;
   output SW_M;
   output SW_WB;
   output WME_EX;
   output WME_ID;
   output WME_M;
   output WRE_EX;
   output WRE_ID;
   output WRE_M;
   output WRE_WB;
   
   wire [15:0] Offset;
   wire [63:0] ONE;
   wire NOOP_ID_DUMMY;
   wire [63:0] PC_plus_one_DUMMY;
   wire [63:0] ALU_result_WB_DUMMY;
   wire [63:0] ALU_result_EX_DUMMY;
   wire [3:0] ALU_OP_ID_DUMMY;
   wire [63:0] rs_data_ID_DUMMY;
   wire [63:0] Offset_WB_DUMMY;
   wire [63:0] Offset_EX_DUMMY;
   wire [2:0] rt_WB_DUMMY;
   wire [63:0] RF_WB_Din_DUMMY;
   wire [63:0] D_out_WB_DUMMY;
   wire [63:0] rt_data_EX_DUMMY;
   wire SW_ID_DUMMY;
   wire [4:0] rt_EX_DUMMY;
   wire [63:0] PC_DUMMY;
   wire [7:0] D_MEM_addr_DUMMY;
   wire [63:0] ALU_B_DUMMY;
   wire [4:0] rt_M_DUMMY;
   wire WRE_WB_DUMMY;
   wire [63:0] rs_data_M_DUMMY;
   wire PC_ctrl_DUMMY;
   wire [63:0] ALU_result_M_DUMMY;
   wire MOVI_WB_DUMMY;
   wire WRE_EX_DUMMY;
   wire MOVI_EX_DUMMY;
   wire SW_M_DUMMY;
   wire ADDI_ID_DUMMY;
   wire BGT_ID_DUMMY;
   wire NOOP_EX_DUMMY;
   wire MOVI_M_DUMMY;
   wire BEQ_ID_DUMMY;
   wire [63:0] Offset_M_DUMMY;
   wire [3:0] ALU_OP_EX_DUMMY;
   wire [63:0] rs_data_EX_DUMMY;
   wire LW_ID_DUMMY;
   wire WME_ID_DUMMY;
   wire [4:0] rs_ID_DUMMY;
   wire NOOP_M_DUMMY;
   wire SW_EX_DUMMY;
   wire [63:0] Offset_ID_DUMMY;
   wire BLT_ID_DUMMY;
   wire [31:0] Instruction_DUMMY;
   wire [63:0] rt_data_ID_DUMMY;
   wire ADDI_M_DUMMY;
   wire [4:0] rt_ID_DUMMY;
   wire ADDI_WB_DUMMY;
   wire [63:0] rt_data_M_DUMMY;
   wire ADDI_EX_DUMMY;
   wire J_ID_DUMMY;
   wire LW_WB_DUMMY;
   wire WRE_ID_DUMMY;
   wire LW_EX_DUMMY;
   wire MOVI_ID_DUMMY;
   wire [63:0] D_out_M_DUMMY;
   wire WME_M_DUMMY;
   wire [5:0] OP_CODE_ID_DUMMY;
   wire WRE_M_DUMMY;
   wire LW_M_DUMMY;
   wire [63:0] PC_next_DUMMY;
   wire WME_EX_DUMMY;
   
   assign ADDI_EX = ADDI_EX_DUMMY;
   assign ADDI_ID = ADDI_ID_DUMMY;
   assign ADDI_M = ADDI_M_DUMMY;
   assign ADDI_WB = ADDI_WB_DUMMY;
   assign ALU_B[63:0] = ALU_B_DUMMY[63:0];
   assign ALU_OP_EX[3:0] = ALU_OP_EX_DUMMY[3:0];
   assign ALU_OP_ID[3:0] = ALU_OP_ID_DUMMY[3:0];
   assign ALU_result_EX[63:0] = ALU_result_EX_DUMMY[63:0];
   assign ALU_result_M[63:0] = ALU_result_M_DUMMY[63:0];
   assign ALU_result_WB[63:0] = ALU_result_WB_DUMMY[63:0];
   assign BEQ_ID = BEQ_ID_DUMMY;
   assign BGT_ID = BGT_ID_DUMMY;
   assign BLT_ID = BLT_ID_DUMMY;
   assign D_MEM_addr[7:0] = D_MEM_addr_DUMMY[7:0];
   assign D_out_M[63:0] = D_out_M_DUMMY[63:0];
   assign D_out_WB[63:0] = D_out_WB_DUMMY[63:0];
   assign Instruction[31:0] = Instruction_DUMMY[31:0];
   assign J_ID = J_ID_DUMMY;
   assign LW_EX = LW_EX_DUMMY;
   assign LW_ID = LW_ID_DUMMY;
   assign LW_M = LW_M_DUMMY;
   assign LW_WB = LW_WB_DUMMY;
   assign MOVI_EX = MOVI_EX_DUMMY;
   assign MOVI_ID = MOVI_ID_DUMMY;
   assign MOVI_M = MOVI_M_DUMMY;
   assign MOVI_WB = MOVI_WB_DUMMY;
   assign NOOP_EX = NOOP_EX_DUMMY;
   assign NOOP_ID = NOOP_ID_DUMMY;
   assign NOOP_M = NOOP_M_DUMMY;
   assign Offset_EX[63:0] = Offset_EX_DUMMY[63:0];
   assign Offset_ID[63:0] = Offset_ID_DUMMY[63:0];
   assign Offset_M[63:0] = Offset_M_DUMMY[63:0];
   assign Offset_WB[63:0] = Offset_WB_DUMMY[63:0];
   assign OP_CODE_ID[5:0] = OP_CODE_ID_DUMMY[5:0];
   assign PC[63:0] = PC_DUMMY[63:0];
   assign PC_ctrl = PC_ctrl_DUMMY;
   assign PC_next[63:0] = PC_next_DUMMY[63:0];
   assign PC_plus_one[63:0] = PC_plus_one_DUMMY[63:0];
   assign RF_WB_Din[63:0] = RF_WB_Din_DUMMY[63:0];
   assign rs_data_EX[63:0] = rs_data_EX_DUMMY[63:0];
   assign rs_data_ID[63:0] = rs_data_ID_DUMMY[63:0];
   assign rs_data_M[63:0] = rs_data_M_DUMMY[63:0];
   assign rs_ID[4:0] = rs_ID_DUMMY[4:0];
   assign rt_data_EX[63:0] = rt_data_EX_DUMMY[63:0];
   assign rt_data_ID[63:0] = rt_data_ID_DUMMY[63:0];
   assign rt_data_M[63:0] = rt_data_M_DUMMY[63:0];
   assign rt_EX[4:0] = rt_EX_DUMMY[4:0];
   assign rt_ID[4:0] = rt_ID_DUMMY[4:0];
   assign rt_M[4:0] = rt_M_DUMMY[4:0];
   assign rt_WB[2:0] = rt_WB_DUMMY[2:0];
   assign SW_EX = SW_EX_DUMMY;
   assign SW_ID = SW_ID_DUMMY;
   assign SW_M = SW_M_DUMMY;
   assign WME_EX = WME_EX_DUMMY;
   assign WME_ID = WME_ID_DUMMY;
   assign WME_M = WME_M_DUMMY;
   assign WRE_EX = WRE_EX_DUMMY;
   assign WRE_ID = WRE_ID_DUMMY;
   assign WRE_M = WRE_M_DUMMY;
   assign WRE_WB = WRE_WB_DUMMY;
   PC XLXI_1 (.clk(clk), 
              .PC_next(PC_next_DUMMY[63:0]), 
              .rst(rst), 
              .PC(PC_DUMMY[63:0]));
   PC_MUX XLXI_3 (.BTA(Offset_ID_DUMMY[63:0]), 
                  .PC_ctrl(PC_ctrl_DUMMY), 
                  .PC_next_in(PC_plus_one_DUMMY[63:0]), 
                  .PC_next_out(PC_next_DUMMY[63:0]));
   I_MEM XLXI_4 (.addra(PC_DUMMY[8:0]), 
                 .addrb(I_W_Addr[8:0]), 
                 .clka(clk), 
                 .clkb(clk), 
                 .dinb(Instr_IN[31:0]), 
                 .web(Instr_W_en), 
                 .douta(Instruction_DUMMY[31:0]));
   IF_ID_Reg XLXI_5 (.Instruction(Instruction_DUMMY[31:0]), 
                     .Offset_ID(Offset[15:0]), 
                     .OP_CODE_ID(OP_CODE_ID_DUMMY[5:0]), 
                     .rs_ID(rs_ID_DUMMY[4:0]), 
                     .rt_ID(rt_ID_DUMMY[4:0]));
   RF XLXI_6 (.clk(clk), 
              .rst(rst), 
              .r0addr(rs_ID_DUMMY[2:0]), 
              .r1addr(rt_ID_DUMMY[2:0]), 
              .waddr(rt_WB_DUMMY[2:0]), 
              .wdata(RF_WB_Din_DUMMY[63:0]), 
              .wena(WRE_WB_DUMMY), 
              .r0data(rs_data_ID_DUMMY[63:0]), 
              .r1data(rt_data_ID_DUMMY[63:0]));
   Control_Unit XLXI_7 (.OP_CODE(OP_CODE_ID_DUMMY[5:0]), 
                        .ADDI_ID(ADDI_ID_DUMMY), 
                        .ALU_OP_ID(ALU_OP_ID_DUMMY[3:0]), 
                        .BEQ_ID(BEQ_ID_DUMMY), 
                        .BGT_ID(BGT_ID_DUMMY), 
                        .BLT_ID(BLT_ID_DUMMY), 
                        .J_ID(J_ID_DUMMY), 
                        .LW_ID(LW_ID_DUMMY), 
                        .MOVI_ID(MOVI_ID_DUMMY), 
                        .NOOP_ID(NOOP_ID_DUMMY), 
                        .SW_ID(SW_ID_DUMMY), 
                        .WME_ID(WME_ID_DUMMY), 
                        .WRE_ID(WRE_ID_DUMMY));
   Offset_Extend XLXI_9 (.Offset(Offset[15:0]), 
                         .Offset_ID(Offset_ID_DUMMY[63:0]));
   ID_EX_Reg XLXI_10 (.ADDI_ID(ADDI_ID_DUMMY), 
                      .ALU_OP_ID(ALU_OP_ID_DUMMY[3:0]), 
                      .clk(clk), 
                      .LW_ID(LW_ID_DUMMY), 
                      .MOVI_ID(MOVI_ID_DUMMY), 
                      .NOOP_ID(NOOP_ID_DUMMY), 
                      .Offset_ID(Offset_ID_DUMMY[63:0]), 
                      .rst(rst), 
                      .rs_data_ID(rs_data_ID_DUMMY[63:0]), 
                      .rt_data_ID(rt_data_ID_DUMMY[63:0]), 
                      .rt_ID(rt_ID_DUMMY[4:0]), 
                      .SW_ID(SW_ID_DUMMY), 
                      .WME_ID(WME_ID_DUMMY), 
                      .WRE_ID(WRE_ID_DUMMY), 
                      .ADDI_EX(ADDI_EX_DUMMY), 
                      .ALU_OP_EX(ALU_OP_EX_DUMMY[3:0]), 
                      .LW_EX(LW_EX_DUMMY), 
                      .MOVI_EX(MOVI_EX_DUMMY), 
                      .NOOP_EX(NOOP_EX_DUMMY), 
                      .Offset_EX(Offset_EX_DUMMY[63:0]), 
                      .rs_data_EX(rs_data_EX_DUMMY[63:0]), 
                      .rt_data_EX(rt_data_EX_DUMMY[63:0]), 
                      .rt_EX(rt_EX_DUMMY[4:0]), 
                      .SW_EX(SW_EX_DUMMY), 
                      .WME_EX(WME_EX_DUMMY), 
                      .WRE_EX(WRE_EX_DUMMY));
   ALU XLXI_11 (.A(rs_data_EX_DUMMY[63:0]), 
                .ALU_OP(ALU_OP_EX_DUMMY[3:0]), 
                .B(ALU_B_DUMMY[63:0]), 
                .ALU_Out(ALU_result_EX_DUMMY[63:0]), 
                .Overflow(), 
                .Zero_Flag());
   ALU_src_MUX XLXI_12 (.ADDI_EX(ADDI_EX_DUMMY), 
                        .LW_EX(LW_EX_DUMMY), 
                        .Offset_EX(Offset_EX_DUMMY[63:0]), 
                        .rt_data(rt_data_EX_DUMMY[63:0]), 
                        .SW_EX(SW_EX_DUMMY), 
                        .ALU_B(ALU_B_DUMMY[63:0]));
   EX_M_Reg XLXI_13 (.ADDI_EX(ADDI_EX_DUMMY), 
                     .ALU_result_EX(ALU_result_EX_DUMMY[63:0]), 
                     .clk(clk), 
                     .LW_EX(LW_EX_DUMMY), 
                     .MOVI_EX(MOVI_EX_DUMMY), 
                     .NOOP_EX(NOOP_EX_DUMMY), 
                     .Offset_EX(Offset_EX_DUMMY[63:0]), 
                     .rst(rst), 
                     .rs_data_EX(rs_data_EX_DUMMY[63:0]), 
                     .rt_data_EX(rt_data_EX_DUMMY[63:0]), 
                     .rt_EX(rt_EX_DUMMY[4:0]), 
                     .SW_EX(SW_EX_DUMMY), 
                     .WME_EX(WME_EX_DUMMY), 
                     .WRE_EX(WRE_EX_DUMMY), 
                     .ADDI_M(ADDI_M_DUMMY), 
                     .ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                     .LW_M(LW_M_DUMMY), 
                     .MOVI_M(MOVI_M_DUMMY), 
                     .NOOP_M(NOOP_M_DUMMY), 
                     .Offset_M(Offset_M_DUMMY[63:0]), 
                     .rs_data_M(rs_data_M_DUMMY[63:0]), 
                     .rt_data_M(rt_data_M_DUMMY[63:0]), 
                     .rt_M(rt_M_DUMMY[4:0]), 
                     .SW_M(SW_M_DUMMY), 
                     .WME_M(WME_M_DUMMY), 
                     .WRE_M(WRE_M_DUMMY));
   D_addr_src_MUX XLXI_14 (.ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                           .rt_M(rt_M_DUMMY[4:0]), 
                           .SW_M(SW_M_DUMMY), 
                           .D_addr(D_MEM_addr_DUMMY[7:0]));
   D_MEM XLXI_15 (.addra(D_MEM_addr_DUMMY[7:0]), 
                  .addrb(D_MEM_addr_DUMMY[7:0]), 
                  .clka(clk), 
                  .clkb(clk), 
                  .dina(rt_data_M_DUMMY[63:0]), 
                  .wea(WME_M_DUMMY), 
                  .doutb(D_out_M_DUMMY[63:0]));
   M_WB_Reg XLXI_16 (.ADDI_M(ADDI_M_DUMMY), 
                     .ALU_result_M(ALU_result_M_DUMMY[63:0]), 
                     .clk(clk), 
                     .D_out_M(D_out_M_DUMMY[63:0]), 
                     .LW_M(LW_M_DUMMY), 
                     .MOVI_M(MOVI_M_DUMMY), 
                     .NOOP_M(NOOP_M_DUMMY), 
                     .Offset_M(Offset_M_DUMMY[63:0]), 
                     .rst(rst), 
                     .rs_data_M(rs_data_M_DUMMY[63:0]), 
                     .rt_M(rt_M_DUMMY[4:0]), 
                     .SW_M(SW_M_DUMMY), 
                     .WRE_M(WRE_M_DUMMY), 
                     .ADDI_WB(ADDI_WB_DUMMY), 
                     .ALU_result_WB(ALU_result_WB_DUMMY[63:0]), 
                     .D_out_WB(D_out_WB_DUMMY[63:0]), 
                     .LW_WB(LW_WB_DUMMY), 
                     .MOVI_WB(MOVI_WB_DUMMY), 
                     .NOOP_WB(NOOP_WB), 
                     .Offset_WB(Offset_WB_DUMMY[63:0]), 
                     .rs_data_WB(rs_data_WB[63:0]), 
                     .rt_WB(rt_WB_DUMMY[2:0]), 
                     .SW_WB(SW_WB), 
                     .WRE_WB(WRE_WB_DUMMY));
   RF_WB_data_src_MUX XLXI_17 (.ADDI_WB(ADDI_WB_DUMMY), 
                               .ALU_out_WB(ALU_result_WB_DUMMY[63:0]), 
                               .D_out_WB(D_out_WB_DUMMY[63:0]), 
                               .LW_WB(LW_WB_DUMMY), 
                               .MOVI_WB(MOVI_WB_DUMMY), 
                               .Offset_WB(Offset_WB_DUMMY[63:0]), 
                               .RF_WB_Din(RF_WB_Din_DUMMY[63:0]));
   PC_plus_1 XLXI_18 (.ONE(ONE[63:0]), 
                      .PC(PC_DUMMY[63:0]), 
                      .PC_next(PC_plus_one_DUMMY[63:0]));
   VCC XLXI_19 (.P(ONE[0]));
   Branch_Detection_Unit XLXI_21 (.BEQ_ID(BEQ_ID_DUMMY), 
                                  .BGT_ID(BGT_ID_DUMMY), 
                                  .BLT_ID(BLT_ID_DUMMY), 
                                  .J_ID(J_ID_DUMMY), 
                                  .rs_data(rs_data_ID_DUMMY[63:0]), 
                                  .rt_data(rt_data_ID_DUMMY[63:0]), 
                                  .PC_ctrl(PC_ctrl_DUMMY));
endmodule
