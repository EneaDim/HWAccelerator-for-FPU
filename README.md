# Hardware Accelerator for FPU
![FPU image](https://github.com/EneaDim/HWAcceleeatorFPU/FPU.png)

- The hardware accelerator is made for the <b>Multiply Significand</b> block.

- Operands are encoded with a <b>Modified Booth Encoder</b> technique.

- Partial products are added together with a <b>Dadda Adder Plane</b>.

- The Dadda Plane vhdl code is made through Python codes that generate the vhdl code of the Block.

## Simulation
Running 'tb\_script' , all files will be analyzed using <b>GHDL</b>.

The 'tb\_mul.vhd' is the testbench of the simulation.

The output of the simulation is the tb\_mul.vcd file.

This simulation can be seen using <b>GTKWAVE</b>.

## Synthesys
The vhdl code are converted in verilog files with <b>VHD2VL</b>.

The DaddaTree.vhd file can't be converted in verilog using 'vhd2vl' because of memory exhausted problem. 

If you can convert it, all verilog files the synthesys can be done with <b>YOSYS</b>.

The target FPGA platform can be choosed with <b>YOSYS</b> with the commmand: 'synth\_<target_name>'.

## Place & Route 
Has to be done.

Using <b>NEXTPNR</b>


