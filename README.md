# Hardware Accelerator for FPU Multiplier
![FPU image](https://github.com/EneaDim/HWAccelerator-for-FPU/blob/main/images/FPU.png)

- The hardware accelerator is made for the <b>Multiply Significand</b> block.

- Operands are encoded with a <b>Modified Booth Encoder</b> technique.

- Partial products are added together with a <b>Dadda Adder Plane</b>.

- The Dadda Plane vhdl code is made through Python codes that generate the vhdl code of the Block.

### Requirements to Compile and Simulate

```sudo apt-get install ghdl gtkwave```

### Requirements to Synthetize

Walkthrough <https://github.com/YosysHQ/yosys>

Walkthrough to convert vhdl into verilog files <https://github.com/ldoolitt/vhd2vl> (needed for synthesys with yosys)

### Requirements to Place&Route

Walkthrough <https://github.com/YosysHQ/nextpnr>

### Simulation

The 'tb_mul.vhd' is the default testbench.

The simulation can be seen running ```gtkwave tb/tb_mul.vcd```.

### Compile the design

Running ```tb_script``` file , all files will be analyzed using ```ghdl```.

By default a <b>vcd</b> file named 'tb_mul.vcd will be created in the ```tb/``` directory.

You can see the simulation running again ```gtkwave tb/tb_mul.vcd```.

### Synthesys

The vhdl code are converted in verilog files with ```vhd2vl```.

The DaddaTree.vhd file can't be converted in verilog using 'vhd2vl' because of memory exhausted problem. 

If you can convert it, all verilog files the synthesys can be done with ```yosys```.

The target FPGA platform can be choosed with ```yosys``` with the commmand: ```synth_<target_name>```.

## Place & Route 
Has to be done.

Using ```nextpnr```.


