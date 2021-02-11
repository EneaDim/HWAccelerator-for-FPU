library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity FF is
port( clk : in STD_LOGIC; 
	rst_n : in STD_LOGIC;
        enable : in std_logic;
	a : in std_logic;
	b :out std_logic);
end FF;

architecture beh of FF is
begin
process(clk, rst_n)
begin
if (rst_n = '0') then
	b <= '0';
elsif (clk'event and clk = '1') then
  if (enable='1') then
        b <= a;
  end if;
end if;
end process;
end beh;
