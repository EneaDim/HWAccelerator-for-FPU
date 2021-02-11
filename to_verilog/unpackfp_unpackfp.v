// File vhdl/unpackfp_unpackfp.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//
// VHDL Architecture HAVOC.UnpackFP.UnpackFP
//
// Created:
//          by - Guillermo
//          at - ITESM, 09:06:00 07/16/03
//
// Generated by Mentor Graphics' HDL Designer(TM) 2002.1b (Build 7)
//
// hds interface_start
// no timescale needed

module UnpackFP(
input wire [31:0] FP,
output wire [31:0] SIG,
output wire [7:0] EXP,
output wire SIGN,
output wire isNaN,
output wire isINF,
output wire isZ,
output wire isDN
);



// Declarations

// hds interface_end
wire [7:0] exp_int;
wire [22:0] sig_int;
wire expZ; wire expFF; wire sigZ;

  assign exp_int = FP[30:23];
  assign sig_int = FP[22:0];
  assign SIGN = FP[31];
  assign EXP = exp_int;
  assign SIG[22:0] = sig_int;
  assign expZ = (exp_int == 8'h00) ? 1'b1 : 1'b0;
  assign expFF = (exp_int == 8'hFF) ? 1'b1 : 1'b0;
  assign sigZ = (sig_int == 23'b00000000000000000000000) ? 1'b1 : 1'b0;
  assign isNaN = expFF & ( ~sigZ);
  assign isINF = expFF & sigZ;
  assign isZ = expZ & sigZ;
  assign isDN = expZ & ( ~sigZ);
  // Restore hidden 1.ffff when not zero or denormal
  assign SIG[23] =  ~expZ;
  assign SIG[31:24] = {8{1'b0}};

endmodule