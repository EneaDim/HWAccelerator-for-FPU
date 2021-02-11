library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

entity tb_mul is
end entity;

architecture test of tb_mul is

component data_maker is
port (
    CLK  : in  std_logic;
    DATA : out std_logic_vector(31 downto 0));
end component;

component FPmul is
PORT(
      FP_A : IN     std_logic_vector (31 DOWNTO 0);
      FP_B : IN     std_logic_vector (31 DOWNTO 0);
      clk  : IN     std_logic;
      FP_Z : OUT    std_logic_vector (31 DOWNTO 0)
   );
end component;

signal CLK :  std_logic;
signal DATA:  std_logic_vector (31 DOWNTO 0);
signal OUTPUT : std_logic_vector (31 DOWNTO 0);

begin

dm : data_maker port map (CLK, DATA);

fp : FPmul port map (DATA, DATA, CLK, OUTPUT);

clk_process: process 
begin
	CLK <= '0';
        wait for 5 ns;
        CLK <= '1';
        wait for 5 ns;
end process;


end test;
