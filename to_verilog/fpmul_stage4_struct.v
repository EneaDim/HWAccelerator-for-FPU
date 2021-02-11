// File vhdl/fpmul_stage4_struct.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// VHDL Entity HAVOC.FPmul_stage4.interface
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

module FPmul_stage4(
input wire EXP_neg,
input wire [7:0] EXP_out_round,
input wire EXP_pos,
input wire SIGN_out,
input wire [27:0] SIG_out_round,
input wire clk,
input wire isINF_tab,
input wire isNaN,
input wire isZ_tab,
output reg [31:0] FP_Z
);



// Declarations

//
// VHDL Architecture HAVOC.FPmul_stage4.struct
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
wire [31:0] FP;
wire SIG_isZ;
wire [22:0] SIG_out;
wire [27:0] SIG_out_norm2;
reg isINF;
wire isZ;  // Component Declarations
// Optional embedded configurations
// pragma synthesis_off
//   FOR ALL : FPnormalize USE ENTITY work.FPnormalize;
// FOR ALL : PackFP USE ENTITY work.PackFP;
// pragma synthesis_on

  // Architecture concurrent statements
  // HDL Embedded Text Block 1 trim
  // trim 1 
  assign SIG_out = SIG_out_norm2[25:3];
  // HDL Embedded Text Block 2 zero
  // zero 2
  assign SIG_isZ = ((SIG_out_norm2[26:3] == 24'h000000) || (EXP_neg == 1'b1 && EXP_out[7] == 1'b1)) ? 1'b1 : 1'b0;
  // HDL Embedded Text Block 3 isINF_logic
  // isINF_logic 3
  always @(isZ, isINF_tab, EXP_pos, EXP_out) begin
    if(isZ == 1'b0) begin
      if(isINF_tab == 1'b1) begin
        isINF <= 1'b1;
      end
      else if(EXP_out == 8'hFF) begin
        isINF <= 1'b1;
      end
      else if(((EXP_pos == 1'b1) && (EXP_out[7] == 1'b0))) begin
        isINF <= 1'b1;
      end
      else begin
        isINF <= 1'b0;
      end
    end
    else begin
      isINF <= 1'b0;
    end
  end

  // HDL Embedded Text Block 4 latch
  // latch 4
  always @(posedge clk) begin
    FP_Z <= FP;
  end

  // ModuleWare code(v1.1) for instance 'I2' of 'or'
  assign isZ = SIG_isZ | isZ_tab;
  // Instance port mappings.
  FPnormalize #(
      .SIG_width(28))
  I1(
      .SIG_in(SIG_out_round),
    .EXP_in(EXP_out_round),
    .SIG_out(SIG_out_norm2),
    .EXP_out(EXP_out));

  PackFP I3(
      .SIGN(SIGN_out),
    .EXP(EXP_out),
    .SIG(SIG_out),
    .isNaN(isNaN),
    .isINF(isINF),
    .isZ(isZ),
    .FP(FP));


endmodule
