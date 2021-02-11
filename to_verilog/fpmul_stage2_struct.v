// File vhdl/fpmul_stage2_struct.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// VHDL Entity HAVOC.FPmul_stage2.interface
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

module FPmul_stage2(
input wire [7:0] A_EXP,
input wire [31:0] A_SIG,
input wire [7:0] B_EXP,
input wire [31:0] B_SIG,
input wire SIGN_out_stage1,
input wire clk,
input wire isINF_stage1,
input wire isNaN_stage1,
input wire isZ_tab_stage1,
output reg [7:0] EXP_in,
output reg EXP_neg_stage2,
output reg EXP_pos_stage2,
output reg SIGN_out_stage2,
output reg [27:0] SIG_in,
output reg isINF_stage2,
output reg isNaN_stage2,
output reg isZ_tab_stage2
);



// Declarations

//
// VHDL Architecture HAVOC.FPmul_stage2.struct
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
wire [7:0] EXP_in_int;
wire EXP_neg_int;
wire EXP_pos_int;
wire [27:0] SIG_in_int;
wire dout;
reg [7:0] dout1;
wire [63:0] prod;

  // Architecture concurrent statements
  // HDL Embedded Text Block 1 sig
  // eb1 1
  assign SIG_in_int = prod[47:20];
  // HDL Embedded Text Block 2 inv
  // eb5 5
  assign EXP_in_int = { ~dout1[7],dout1[6:0]};
  // HDL Embedded Text Block 3 latch
  // eb2 2
  always @(posedge clk) begin
    EXP_in <= EXP_in_int;
    SIG_in <= SIG_in_int;
    EXP_pos_stage2 <= EXP_pos_int;
    EXP_neg_stage2 <= EXP_neg_int;
  end

  // HDL Embedded Text Block 4 latch2
  // latch2 4
  always @(posedge clk) begin
    isINF_stage2 <= isINF_stage1;
    isNaN_stage2 <= isNaN_stage1;
    isZ_tab_stage2 <= isZ_tab_stage1;
    SIGN_out_stage2 <= SIGN_out_stage1;
  end

  // HDL Embedded Text Block 5 eb1
  // exp_pos 5
  assign EXP_pos_int = A_EXP[7] & B_EXP[7];
  //   EXP_neg_int <= NOT(A_EXP(7) OR B_EXP(7));
  assign EXP_neg_int = ((A_EXP[7] == 1'b0 && !(A_EXP == 8'h7F)) && (B_EXP[7] == 1'b0 && !(B_EXP == 8'h7F))) ? 1'b1 : 1'b0;
  // ModuleWare code(v1.1) for instance 'I4' of 'add'
  always @(A_EXP, B_EXP, dout) begin : P1
    reg [8:0] mw_I4t0;
    reg [8:0] mw_I4t1;
    reg [8:0] mw_I4sum;
    reg mw_I4carry;

    mw_I4t0 = {1'b0,A_EXP};
    mw_I4t1 = {1'b0,B_EXP};
    mw_I4carry = dout;
    mw_I4sum = (mw_I4t0) + (mw_I4t1) + mw_I4carry;
    dout1 <= conv_std_logic_vector[mw_I4sum[7:0]];
  end

  // ModuleWare code(v1.1) for instance 'I2' of 'mult'
  MBE MBE1(
      A_SIG,
    B_SIG,
    prod);

  //I2combo : PROCESS (A_SIG, B_SIG)
  //variable dtemp : unsigned(63 downto 0);
  // BEGIN
  // dtemp := (unsigned(A_SIG) * unsigned(B_SIG));
  //prod <= std_logic_vector(dtemp);
  //END PROCESS I2combo;
  // ModuleWare code(v1.1) for instance 'I6' of 'vdd'
  assign dout = 1'b1;
    // Instance port mappings.

endmodule
