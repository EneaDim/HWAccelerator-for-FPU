library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;


entity MBE is
 Port ( A, B: in std_logic_vector(31 downto 0);
			P: out std_logic_vector(63 downto 0));
end MBE;

architecture Behavioral of MBE is
-- devo fare un blocco unico per utilizzare in modo più efficiente il generate statement

COMPONENT booth_encoder is
    Port ( A, B : in  STD_LOGIC_VECTOR (31 downto 0) ;
           finpp1, finpp2, finpp3, finpp4, finpp5, finpp6, finpp7, finpp8, finpp9, finpp10,
		   finpp11, finpp12, finpp13, finpp14, finpp15, finpp16, finpp17  : out STD_LOGIC_VECTOR(63 downto 0) );
end component;
	
component adder_NBIT is
generic(N: integer:= 64);
Port (	     Cin : in STD_LOGIC;
             IN1 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
             IN2 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
             SUM  : out STD_LOGIC_VECTOR (N-1 downto 0);
             Cout : out STD_LOGIC
     );
end component;
	
component DaddaTree is
generic(N: integer:= 64);
    Port ( IN1 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN2 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN3 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN4 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN5 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN6 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN7 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN8 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN9 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN10 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN11 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN12 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN13 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN14 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN15 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN16 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           IN17 : in  STD_LOGIC_VECTOR (N-1 downto 0) ;
           P1  : out STD_LOGIC_VECTOR (N-1 downto 0);
	   P2  : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;	
	
	
signal pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17, out1, out2  : STD_LOGIC_VECTOR(63 downto 0) ;
signal c_out : STD_LOGIC;

begin

booth: booth_encoder port map (A, B,  pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17);
dadda: DaddaTree port map(pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17, out1, out2);
adder: adder_NBIT port map('0', out1, out2, P, c_out);
        
End Architecture Behavioral;
