// File vhdl/y_block.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// no timescale needed

module Y_BLOCK(
input wire [2:0] IN_BJ,
input wire [31:0] IN_A,
output wire [32:0] Y
);




wire [1:0] outz_block;
wire [32:0] muxpp_A; wire [32:0] muxpp_2A; wire [32:0] muxpp_0; wire [32:0] zeroes;
wire [32:0] pp_A; wire [32:0] pp_2A;

  z_block Zblock(
      .IN_BJ(IN_BJ),
    .Z(outz_block));

  assign pp_2A = {IN_A,1'b0};
  assign pp_A = {1'b0,IN_A};
  assign zeroes = 33'b000000000000000000000000000000000;
  genvar i;
  generate for (i=0; i <= 32; i = i + 1) begin: GEN_XOR0
      assign muxpp_0[i] = zeroes[i] ^ IN_BJ[2];
  end
  endgenerate
  genvar j;
  generate for (j=0; j <= 32; j = j + 1) begin: GEN_XORA
      assign muxpp_A[j] = pp_A[j] ^ IN_BJ[2];
  end
  endgenerate
  genvar i;
  generate for (i=0; i <= 32; i = i + 1) begin: GEN_XOR2A
      assign muxpp_2A[i] = pp_2A[i] ^ IN_BJ[2];
  end
  endgenerate
  MUX_4_TO_1 #(
      .N(33))
  MUXpp(
      .A(muxpp_0),
    .B(muxpp_A),
    .C(zeroes),
    .D(muxpp_2A),
    .S(outz_block),
    .Z(Y));


endmodule
