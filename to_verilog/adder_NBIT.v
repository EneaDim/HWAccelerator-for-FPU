// File vhdl/adder_NBIT.vhd translated with vhd2vl v3.0 VHDL to Verilog RTL translator
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

//use IEEE.NUMERIC_STD.ALL;
// no timescale needed

module adder_NBIT(
input wire Cin,
input wire [N - 1:0] IN1,
input wire [N - 1:0] IN2,
output wire [N - 1:0] SUM,
output wire Cout
);

parameter [31:0] N=64;



wire [N - 1:0] a; wire [N - 1:0] b; wire [N - 1:0] S;
wire [N - 1:1] t;
parameter m = 64;

  FA FA1(
      a[0],
    b[0],
    Cin,
    S[0],
    t[1]);

  genvar i;
  generate for (i=1; i <= m - 2; i = i + 1) begin: FA_f
      FA FA_i(
          a[i],
      b[i],
      t[i],
      S[i],
      t[i + 1]);

  end
  endgenerate
  FA FA4(
      a[m - 1],
    b[m - 1],
    t[m - 1],
    S[m - 1],
    Cout);

  assign a = IN1;
  assign b = IN2;
  assign SUM = S;

endmodule
