// File vhdl/fpmul_stage1_struct.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// VHDL Entity HAVOC.FPmul_stage1.interface
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

module FPmul_stage1(
input wire [31:0] FP_A,
input wire [31:0] FP_B,
input wire clk,
output reg [7:0] A_EXP,
output reg [31:0] A_SIG,
output reg [7:0] B_EXP,
output reg [31:0] B_SIG,
output reg SIGN_out_stage1,
output reg isINF_stage1,
output reg isNaN_stage1,
output reg isZ_tab_stage1
);



// Declarations

//
// VHDL Architecture HAVOC.FPmul_stage1.struct
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
// Non hierarchical truthtable declarations
// Internal signal declarations
wire [7:0] A_EXP_int;
wire A_SIGN;
wire [31:0] A_SIG_int;
wire A_isINF;
wire A_isNaN;
wire A_isZ;
wire [7:0] B_EXP_int;
wire B_SIGN;
wire [31:0] B_SIG_int;
wire B_isINF;
wire B_isNaN;
wire B_isZ;
wire SIGN_out_int;
reg isINF_int;
reg isNaN_int;
reg isZ_tab_int;  // Component Declarations
// Optional embedded configurations
// pragma synthesis_off
//FOR ALL : UnpackFP USE ENTITY work.UnpackFP;
// pragma synthesis_on

  // Architecture concurrent statements
  // HDL Embedded Text Block 1 latch
  // latch 1
  always @(posedge clk) begin
    SIGN_out_stage1 <= SIGN_out_int;
    A_EXP <= A_EXP_int;
    A_SIG <= A_SIG_int;
    isINF_stage1 <= isINF_int;
    isNaN_stage1 <= isNaN_int;
    isZ_tab_stage1 <= isZ_tab_int;
    B_EXP <= B_EXP_int;
    B_SIG <= B_SIG_int;
  end

  // HDL Embedded Block 2 exceptions
  // Non hierarchical truthtable
  //-------------------------------------------------------------------------
  always @(A_isINF, A_isNaN, A_isZ, B_isINF, B_isNaN, B_isZ) begin : P1
  //-------------------------------------------------------------------------

    // Block 1
    if((A_isINF == 1'b0) && (A_isNaN == 1'b0) && (A_isZ == 1'b0) && (B_isINF == 1'b0) && (B_isNaN == 1'b0) && (B_isZ == 1'b0)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b0;
    end
    else if((A_isINF == 1'b1) && (B_isZ == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b1;
    end
    else if((A_isZ == 1'b1) && (B_isINF == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b1;
    end
    else if((A_isINF == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b1;
      isNaN_int <= 1'b0;
    end
    else if((B_isINF == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b1;
      isNaN_int <= 1'b0;
    end
    else if((A_isNaN == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b1;
    end
    else if((B_isNaN == 1'b1)) begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b1;
    end
    else if((A_isZ == 1'b1)) begin
      isZ_tab_int <= 1'b1;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b0;
    end
    else if((B_isZ == 1'b1)) begin
      isZ_tab_int <= 1'b1;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b0;
    end
    else begin
      isZ_tab_int <= 1'b0;
      isINF_int <= 1'b0;
      isNaN_int <= 1'b0;
    end
  end

  // Architecture concurrent statements
  // ModuleWare code(v1.1) for instance 'I3' of 'xor'
  assign SIGN_out_int = A_SIGN ^ B_SIGN;
  // Instance port mappings.
  UnpackFP I0(
      .FP(FP_A),
    .SIG(A_SIG_int),
    .EXP(A_EXP_int),
    .SIGN(A_SIGN),
    .isNaN(A_isNaN),
    .isINF(A_isINF),
    .isZ(A_isZ),
    .isDN(/* open */));

  UnpackFP I1(
      .FP(FP_B),
    .SIG(B_SIG_int),
    .EXP(B_EXP_int),
    .SIGN(B_SIGN),
    .isNaN(B_isNaN),
    .isINF(B_isINF),
    .isZ(B_isZ),
    .isDN(/* open */));


endmodule
