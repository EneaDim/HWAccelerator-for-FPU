library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity adder_NBIT is
generic(N: integer :=64);
Port ( 	
	     Cin : in STD_LOGIC;
	     IN1 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
	     IN2 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
	     SUM  : out STD_LOGIC_VECTOR (N-1 downto 0);
	     Cout : out STD_LOGIC
);
end adder_NBIT;

architecture Behavioral of adder_NBIT is

component FA is
Port ( 	A : in STD_LOGIC;
 	B : in STD_LOGIC;
 	Cin : in STD_LOGIC;
 	S : out STD_LOGIC;
 	Cout : out STD_LOGIC);
end component;

signal a,b,S : 	STD_LOGIC_VECTOR (N-1 DOWNTO 0);
signal t : STD_LOGIC_VECTOR (N-1 DOWNTO 1);

constant m : INTEGER := 64;

begin
	FA1: FA PORT MAP ( a(0), b(0), Cin,  S(0), t(1));
	FA_f: for i in 1 to m-2 generate
		FA_i: FA PORT MAP ( a(i), b(i), t(i), S(i), t(i+1));
		end generate;
	FA4: FA PORT MAP ( a(m-1), b(m-1), t(m-1), S(m-1), Cout);

	a <= IN1;
	b <= IN2;
	SUM <= S;
end Behavioral;
