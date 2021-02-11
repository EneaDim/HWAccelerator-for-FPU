library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity HA is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end HA;
 
architecture gate_level of HA is
 
begin
 
 S <= A XOR B;
 Cout <= (A AND B);
 
end gate_level;
