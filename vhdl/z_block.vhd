library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Z_block is
    Port ( IN_BJ : in  STD_LOGIC_VECTOR (2 downto 0) ;
           Z  : out STD_LOGIC_VECTOR(1 downto 0) );
end Z_block;

architecture Behavioral of Z_block is

component MUX2TO1 is
PORT (	A,B,S : IN STD_LOGIC;
				Z : OUT STD_LOGIC); 
	END component;
	
signal mux0_0_in, mux0_1_in, mux1_0_in, mux1_1_in, zout0, zout1: std_logic;


begin
    mux0_0_in<= IN_BJ(1) OR IN_BJ(0);
	mux0_1_in<= IN_BJ(1) NAND IN_BJ(0);
	mux1_0_in<= IN_BJ(1) AND IN_BJ(0);
	mux1_1_in<= IN_BJ(1) NOR IN_BJ(0);

MUX0: MUX2TO1 PORT MAP(A=>mux0_0_in, B=>mux0_1_in, S=>IN_BJ(2), Z=>Zout0);
MUX1: MUX2TO1 PORT MAP(A=>mux1_0_in, B=>mux1_1_in, S=>IN_BJ(2), Z=>Zout1);
Z<=Zout1&Zout0;
        
End Architecture Behavioral;