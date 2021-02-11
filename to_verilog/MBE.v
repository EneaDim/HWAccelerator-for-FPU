// File vhdl/MBE.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

module MBE(
input wire [31:0] A,
input wire [31:0] B,
output wire [63:0] P
);




// devo fare un blocco unico per utilizzare in modo più efficiente il generate statement
wire [63:0] pp1; wire [63:0] pp2; wire [63:0] pp3; wire [63:0] pp4; wire [63:0] pp5; wire [63:0] pp6; wire [63:0] pp7; wire [63:0] pp8; wire [63:0] pp9; wire [63:0] pp10; wire [63:0] pp11; wire [63:0] pp12; wire [63:0] pp13; wire [63:0] pp14; wire [63:0] pp15; wire [63:0] pp16; wire [63:0] pp17; wire [63:0] out1; wire [63:0] out2;
wire c_out;

  booth_encoder booth(
      A,
    B,
    pp1,
    pp2,
    pp3,
    pp4,
    pp5,
    pp6,
    pp7,
    pp8,
    pp9,
    pp10,
    pp11,
    pp12,
    pp13,
    pp14,
    pp15,
    pp16,
    pp17);

  DaddaTree dadda(
      pp1,
    pp2,
    pp3,
    pp4,
    pp5,
    pp6,
    pp7,
    pp8,
    pp9,
    pp10,
    pp11,
    pp12,
    pp13,
    pp14,
    pp15,
    pp16,
    pp17,
    out1,
    out2);

  adder_NBIT adder(
      1'b0,
    out1,
    out2,
    P,
    c_out);


endmodule
