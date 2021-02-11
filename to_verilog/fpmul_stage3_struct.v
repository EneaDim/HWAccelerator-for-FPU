// File vhdl/fpmul_stage3_struct.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// VHDL Entity HAVOC.FPmul_stage3.interface
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

module FPmul_stage3(
input wire [7:0] EXP_in,
input wire EXP_neg_stage2,
input wire EXP_pos_stage2,
input wire SIGN_out_stage2,
input wire [27:0] SIG_in,
input wire clk,
input wire isINF_stage2,
input wire isNaN_stage2,
input wire isZ_tab_stage2,
output reg EXP_neg,
output reg [7:0] EXP_out_round,
output reg EXP_pos,
output reg SIGN_out,
output reg [27:0] SIG_out_round,
output reg isINF_tab,
output reg isNaN,
output reg isZ_tab
);



// Declarations

//
// VHDL Architecture HAVOC.FPmul_stage3.struct
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
wire [7:0] EXP_out;
wire [7:0] EXP_out_norm;
wire [27:0] SIG_out;
wire [27:0] SIG_out_norm;  // Component Declarations
// Optional embedded configurations
// pragma synthesis_off
//   FOR ALL : FPnormalize USE ENTITY work.FPnormalize;
//  FOR ALL : FPround USE ENTITY work.FPround;
// pragma synthesis_on

  // Architecture concurrent statements
  // HDL Embedded Text Block 1 latch
  // latch 1
  always @(posedge clk) begin
    EXP_out_round <= EXP_out;
    SIG_out_round <= SIG_out;
  end

  // HDL Embedded Text Block 2 latch2
  // latch2 2
  always @(posedge clk) begin
    isINF_tab <= isINF_stage2;
    isNaN <= isNaN_stage2;
    isZ_tab <= isZ_tab_stage2;
    SIGN_out <= SIGN_out_stage2;
    EXP_pos <= EXP_pos_stage2;
    EXP_neg <= EXP_neg_stage2;
  end

  // Instance port mappings.
  FPnormalize #(
      .SIG_width(28))
  I9(
      .SIG_in(SIG_in),
    .EXP_in(EXP_in),
    .SIG_out(SIG_out_norm),
    .EXP_out(EXP_out_norm));

  FPround #(
      .SIG_width(28))
  I11(
      .SIG_in(SIG_out_norm),
    .EXP_in(EXP_out_norm),
    .SIG_out(SIG_out),
    .EXP_out(EXP_out));


endmodule
