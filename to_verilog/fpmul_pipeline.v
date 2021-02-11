// File vhdl/fpmul_pipeline.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
// vhd2vl settings:
//  * Verilog Module Declaration Style: 2001

// vhd2vl is Free (libre) Software:
//   Copyright (C) 2001 Vincenzo Liguori - Ocean Logic Pty Ltd
//     http://www.ocean-logic.com
//   Modifications Copyright (C) 2006 Mark Gonzales - PMC Sierra Inc
//   Modifications (C) 2010 Shankar Giri
//   Modifications Copyright (C) 2002-2017 Larry Doolittle
//     http://doolittle.icarus.com/~larry/vhd2vl/
//   Modifications (C) 2017 Rodrigo A. Melo
//
//   vhd2vl comes with ABSOLUTELY NO WARRANTY.  Always check the resulting
//   Verilog for correctness, ideally with a formal verification tool.
//
//   You are welcome to redistribute vhd2vl under certain conditions.
//   See the license (GPLv2) file included with the source for details.

// The result of translation follows.  Its copyright status should be
// considered unchanged from the original VHDL.

// VHDL Entity HAVOC.FPmul.symbol
//
// Created by
// Guillermo Marcus, gmarcus@ieee.org
// using Mentor Graphics FPGA Advantage tools.
//
// Visit "http://fpga.mty.itesm.mx" for more info.
//
// 2003-2004. V1.0
//
// no timescale needed

module FPmul(
input wire [31:0] FP_A,
input wire [31:0] FP_B,
input wire clk,
output wire [31:0] FP_Z
);



// Declarations

//
// VHDL Architecture HAVOC.FPmul.pipeline
//
// Created by
// Guillermo Marcus, gmarcus@ieee.org
// using Mentor Graphics FPGA Advantage tools.
//
// Visit "http://fpga.mty.itesm.mx" for more info.
//
// Copyright 2003-2004. V1.0
//
// Architecture declarations
// Internal signal declarations
wire [7:0] A_EXP;
wire [31:0] A_SIG;
wire [7:0] B_EXP;
wire [31:0] B_SIG;
wire [7:0] EXP_in;
wire EXP_neg;
wire EXP_neg_stage2;
wire [7:0] EXP_out_round;
wire EXP_pos;
wire EXP_pos_stage2;
wire SIGN_out;
wire SIGN_out_stage1;
wire SIGN_out_stage2;
wire [27:0] SIG_in;
wire [27:0] SIG_out_round;
wire isINF_stage1;
wire isINF_stage2;
wire isINF_tab;
wire isNaN;
wire isNaN_stage1;
wire isNaN_stage2;
wire isZ_tab;
wire isZ_tab_stage1;
wire isZ_tab_stage2;  // Component Declarations
// Optional embedded configurations
// pragma synthesis_off
//   FOR ALL : FPmul_stage1 USE ENTITY work.FPmul_stage1;
//   FOR ALL : FPmul_stage2 USE ENTITY work.FPmul_stage2;
//   FOR ALL : FPmul_stage3 USE ENTITY work.FPmul_stage3;
//   FOR ALL : FPmul_stage4 USE ENTITY work.FPmul_stage4;
// pragma synthesis_on

  // Instance port mappings.
  FPmul_stage1 I1(
      .FP_A(FP_A),
    .FP_B(FP_B),
    .clk(clk),
    .A_EXP(A_EXP),
    .A_SIG(A_SIG),
    .B_EXP(B_EXP),
    .B_SIG(B_SIG),
    .SIGN_out_stage1(SIGN_out_stage1),
    .isINF_stage1(isINF_stage1),
    .isNaN_stage1(isNaN_stage1),
    .isZ_tab_stage1(isZ_tab_stage1));

  FPmul_stage2 I2(
      .A_EXP(A_EXP),
    .A_SIG(A_SIG),
    .B_EXP(B_EXP),
    .B_SIG(B_SIG),
    .SIGN_out_stage1(SIGN_out_stage1),
    .clk(clk),
    .isINF_stage1(isINF_stage1),
    .isNaN_stage1(isNaN_stage1),
    .isZ_tab_stage1(isZ_tab_stage1),
    .EXP_in(EXP_in),
    .EXP_neg_stage2(EXP_neg_stage2),
    .EXP_pos_stage2(EXP_pos_stage2),
    .SIGN_out_stage2(SIGN_out_stage2),
    .SIG_in(SIG_in),
    .isINF_stage2(isINF_stage2),
    .isNaN_stage2(isNaN_stage2),
    .isZ_tab_stage2(isZ_tab_stage2));

  FPmul_stage3 I3(
      .EXP_in(EXP_in),
    .EXP_neg_stage2(EXP_neg_stage2),
    .EXP_pos_stage2(EXP_pos_stage2),
    .SIGN_out_stage2(SIGN_out_stage2),
    .SIG_in(SIG_in),
    .clk(clk),
    .isINF_stage2(isINF_stage2),
    .isNaN_stage2(isNaN_stage2),
    .isZ_tab_stage2(isZ_tab_stage2),
    .EXP_neg(EXP_neg),
    .EXP_out_round(EXP_out_round),
    .EXP_pos(EXP_pos),
    .SIGN_out(SIGN_out),
    .SIG_out_round(SIG_out_round),
    .isINF_tab(isINF_tab),
    .isNaN(isNaN),
    .isZ_tab(isZ_tab));

  FPmul_stage4 I4(
      .EXP_neg(EXP_neg),
    .EXP_out_round(EXP_out_round),
    .EXP_pos(EXP_pos),
    .SIGN_out(SIGN_out),
    .SIG_out_round(SIG_out_round),
    .clk(clk),
    .isINF_tab(isINF_tab),
    .isNaN(isNaN),
    .isZ_tab(isZ_tab),
    .FP_Z(FP_Z));


endmodule
