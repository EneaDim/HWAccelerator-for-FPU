// File vhdl/booth_encoder.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

// per ora è solo una bozza
// no timescale needed

module booth_encoder(
input wire [31:0] A,
input wire [31:0] B,
output wire [63:0] finpp1,
output wire [63:0] finpp2,
output wire [63:0] finpp3,
output wire [63:0] finpp4,
output wire [63:0] finpp5,
output wire [63:0] finpp6,
output wire [63:0] finpp7,
output wire [63:0] finpp8,
output wire [63:0] finpp9,
output wire [63:0] finpp10,
output wire [63:0] finpp11,
output wire [63:0] finpp12,
output wire [63:0] finpp13,
output wire [63:0] finpp14,
output wire [63:0] finpp15,
output wire [63:0] finpp16,
output wire [63:0] finpp17
);




// devo fare un blocco unico per utilizzare in modo più efficiente il generate statement
wire [34:0] B_init; wire [34:0] B_regout;
wire [31:0] A_regout;
wire [32:0] pp1; wire [32:0] pp2; wire [32:0] pp3; wire [32:0] pp4; wire [32:0] pp5; wire [32:0] pp6; wire [32:0] pp7; wire [32:0] pp8; wire [32:0] pp9; wire [32:0] pp10; wire [32:0] pp11; wire [32:0] pp12; wire [32:0] pp13; wire [32:0] pp14; wire [32:0] pp15; wire [32:0] pp16; wire [32:0] pp17;

  assign B_init = {2'b00,B,1'b0};
  //regA: register_nbit generic map(N=>32) port map (clk=>clk, rst_n=>'1', enable=>'1', a=>A, b=>A_regout);
  assign A_regout = A;
  assign B_regout = B_init;
  //regB: register_nbit generic map(N=>35) port map (clk=>clk, rst_n=>'1', enable=>'1', a=>B_init, b=>B_regout); 
  y_block Y_BLOCK1(
      .IN_BJ(B_regout[2:0]),
    .IN_A(A_regout),
    .Y(pp1));

  y_block Y_BLOCK2(
      .IN_BJ(B_regout[4:2]),
    .IN_A(A_regout),
    .Y(pp2));

  y_block Y_BLOCK3(
      .IN_BJ(B_regout[6:4]),
    .IN_A(A_regout),
    .Y(pp3));

  y_block Y_BLOCK4(
      .IN_BJ(B_regout[8:6]),
    .IN_A(A_regout),
    .Y(pp4));

  y_block Y_BLOCK5(
      .IN_BJ(B_regout[10:8]),
    .IN_A(A_regout),
    .Y(pp5));

  y_block Y_BLOCK6(
      .IN_BJ(B_regout[12:10]),
    .IN_A(A_regout),
    .Y(pp6));

  y_block Y_BLOCK7(
      .IN_BJ(B_regout[14:12]),
    .IN_A(A_regout),
    .Y(pp7));

  y_block Y_BLOCK8(
      .IN_BJ(B_regout[16:14]),
    .IN_A(A_regout),
    .Y(pp8));

  y_block Y_BLOCK9(
      .IN_BJ(B_regout[18:16]),
    .IN_A(A_regout),
    .Y(pp9));

  y_block Y_BLOCK10(
      .IN_BJ(B_regout[20:18]),
    .IN_A(A_regout),
    .Y(pp10));

  y_block Y_BLOCK11(
      .IN_BJ(B_regout[22:20]),
    .IN_A(A_regout),
    .Y(pp11));

  y_block Y_BLOCK12(
      .IN_BJ(B_regout[24:22]),
    .IN_A(A_regout),
    .Y(pp12));

  y_block Y_BLOCK13(
      .IN_BJ(B_regout[26:24]),
    .IN_A(A_regout),
    .Y(pp13));

  y_block Y_BLOCK14(
      .IN_BJ(B_regout[28:26]),
    .IN_A(A_regout),
    .Y(pp14));

  y_block Y_BLOCK15(
      .IN_BJ(B_regout[30:28]),
    .IN_A(A_regout),
    .Y(pp15));

  y_block Y_BLOCK16(
      .IN_BJ(B_regout[32:30]),
    .IN_A(A_regout),
    .Y(pp16));

  y_block Y_BLOCK17(
      .IN_BJ(B_regout[34:32]),
    .IN_A(A_regout),
    .Y(pp17));

  // crezione matrice
  assign finpp1 = {28'b0000000000000000000000000000, ~(B_regout[2]),B_regout[2],B_regout[2],pp1};
  assign finpp2 = {27'b000000000000000000000000000,1'b1, ~(B_regout[4]),pp2,1'b0,B_regout[2]};
  assign finpp3 = {25'b0000000000000000000000000,1'b1, ~(B_regout[6]),pp3,1'b0,B_regout[4],2'b00};
  assign finpp4 = {23'b00000000000000000000000,1'b1, ~(B_regout[8]),pp4,1'b0,B_regout[6],4'b0000};
  assign finpp5 = {21'b000000000000000000000,1'b1, ~(B_regout[10]),pp5,1'b0,B_regout[8],6'b000000};
  assign finpp6 = {19'b0000000000000000000,1'b1, ~(B_regout[12]),pp6,1'b0,B_regout[10],8'b00000000};
  assign finpp7 = {17'b00000000000000000,1'b1, ~(B_regout[14]),pp7,1'b0,B_regout[12],10'b0000000000};
  assign finpp8 = {15'b000000000000000,1'b1, ~(B_regout[16]),pp8,1'b0,B_regout[14],12'b000000000000};
  assign finpp9 = {13'b0000000000000,1'b1, ~(B_regout[18]),pp9,1'b0,B_regout[16],14'b00000000000000};
  assign finpp10 = {11'b00000000000,1'b1, ~(B_regout[20]),pp10,1'b0,B_regout[18],16'b0000000000000000};
  assign finpp11 = {9'b000000000,1'b1, ~(B_regout[22]),pp11,1'b0,B_regout[20],18'b000000000000000000};
  assign finpp12 = {7'b0000000,1'b1, ~(B_regout[24]),pp12,1'b0,B_regout[22],20'b00000000000000000000};
  assign finpp13 = {5'b00000,1'b1, ~(B_regout[26]),pp13,1'b0,B_regout[24],22'b0000000000000000000000};
  assign finpp14 = {3'b000,1'b1, ~(B_regout[28]),pp14,1'b0,B_regout[26],24'b000000000000000000000000};
  assign finpp15 = {1'b0,1'b1, ~(B_regout[ + 1]),pp15,1'b0,B_regout[ + 1],26'b00000000000000000000000000};
  assign finpp16 = { ~(B_regout[ + 1]),pp16,1'b0,B_regout[ + 1],28'b0000000000000000000000000000};
  assign finpp17 = {pp17[31:0],1'b0,B_regout[32],30'b000000000000000000000000000000};

endmodule
