# Hardware Accelerator for FPU Multiplier
![FPU image](https://github.com/EneaDim/HWAccelerator-for-FPU/blob/main/images/FPU.png)

The idea is to speed up the <b>Floating Point Multiplier</b> by means of redesigning the <b>Multiply Significand</b> block.

The <b>Modified Booth Encoding</b> technique is implemented, which allow to convert signed numbers into 2's complement, so the multiplication can be performed faster.

This encoding is performed in order to get all the partial products of the multiplication.

Given all the partial products, the way in which they are added toghether is using a <b>Dadda Adder Plane</b>.

This implementation uses <b>full adders</b> and <b>half adders</b> in a <b>Carry Save Adder </b> configuration to add all the partial products together.

To design this particular hardware configuration, a <b>Python</b> script is used to write the <b>VHDL</b> code of the block.

The 2 outputs of <b>DaddaTree</b> are added using a simple <b>Ripple Carry Adder</b>.

## Hardware Design

- The hardware accelerator is made for the <b>Multiply Significand</b> block.

- <b>Modified Booth Encoder</b> .

- <b>Dadda Adder Plane</b>.

- <b>Simple 2-input Adder</b>.

### Requirements to Compile and Simulate

```sudo apt-get install ghdl gtkwave```

### Requirements to Synthetize

Walkthrough <https://github.com/YosysHQ/yosys>

Walkthrough to convert vhdl into verilog files <https://github.com/ldoolitt/vhd2vl> (needed for synthesys with yosys)

### Requirements to Place&Route

Walkthrough <https://github.com/YosysHQ/nextpnr>

### Simulation

The 'tb_mul.vhd' is the default testbench for the overall architecture.

The simulation can be seen running ```gtkwave tb/tb_mul.vcd```.

There is also the 'tb_MBE.vhd' testbench, which involves only the Multiply Significand Block.

This other simulation can be seen running ```gtkwave tb/tb_MBE.vcd```

### Compile the design

Running ```tb_script``` file , files of the overall architecture will be analyzed using ```ghdl```.

By default a <b>vcd</b> file named 'tb_mul.vcd' will be created in the ```tb/``` directory.

You can see the simulation running again ```gtkwave tb/tb_mul.vcd```.

The ```tb_MBE``` file compiles the design of the Hardware Accelerator, the Multiply Significand Block.

Also in this case a <b>vcd</b> file is created in the ```tb/``` directory, named 'tb_MBE.vcd'.

You can see the simulation running again ```gtkwave tb/tb_MBE.vcd```.

### Synthesys

The vhdl code are converted in verilog files with ```vhd2vl```.

The DaddaTree.vhd file can't be converted in verilog using ```vhd2vl``` because of memory exhausted problem. 

If you can convert it, all verilog files the synthesys can be done with ```yosys```.

The target FPGA platform can be choosed with ```yosys``` with the commmand: ```synth_<target_name>```.

## Place & Route 
Has to be done.

Using ```nextpnr```.


