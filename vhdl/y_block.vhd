
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Y_BLOCK is
    Port ( IN_BJ : in  STD_LOGIC_VECTOR (2 downto 0) ;
		IN_A : in  STD_LOGIC_VECTOR (31 downto 0) ;
		Y  : out STD_LOGIC_VECTOR(32 downto 0));
end Y_BLOCK;

architecture Behavioral of Y_BLOCK is

component z_block is
PORT    ( IN_BJ : in  STD_LOGIC_VECTOR (2 downto 0) ;
           Z  : out STD_LOGIC_VECTOR(1 downto 0) );
END component;

component MUX_4_TO_1 is
generic ( N : INTEGER);
 port( A,B,C,D: in std_logic_vector(N-1 downto 0);
             S: in std_logic_vector(1 downto 0);
             Z: out std_logic_vector(N-1 downto 0)); 
	END component;
	
signal outz_block: std_logic_vector(1 downto 0);
signal muxpp_A, muxpp_2A,muxpp_0, zeroes: std_logic_vector(32 downto 0);
signal pp_A, pp_2A: std_LOGIC_VECTOR(32 downto 0);


begin


Zblock: z_block port map(IN_BJ=>IN_BJ, Z=>outz_block);

pp_2A<=IN_A&'0';
pp_A<='0'&IN_A;
zeroes <= "000000000000000000000000000000000" ; 


GEN_XOR0:
   for i in 0 to 32 generate
   muxpp_0(i)<=zeroes(i) xor IN_BJ(2);
   end generate GEN_XOR0;

GEN_XORA:
   for j in 0 to 32 generate
   muxpp_A(j)<=pp_A(j) xor IN_BJ(2);
   end generate GEN_XORA;
   
GEN_XOR2A:
   for i in 0 to 32 generate
   muxpp_2A(i)<=pp_2A(i) xor IN_BJ(2);
   end generate GEN_XOR2A;
   
   

MUXpp: MUX_4_TO_1 generic map(N=> 33)
PORT MAP(A=>muxpp_0, B=>muxpp_A, C=>zeroes, D=>muxpp_2A, S=>outz_block, Z=>Y);
        
End Architecture Behavioral;
