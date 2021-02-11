-- per ora è solo una bozza

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity booth_encoder is
    Port ( A, B : in  STD_LOGIC_VECTOR (31 downto 0) ;
           finpp1, finpp2, finpp3, finpp4, finpp5, finpp6, finpp7, finpp8, finpp9, finpp10, finpp11, finpp12, finpp13, finpp14, finpp15, finpp16, finpp17  : out STD_LOGIC_VECTOR(63 downto 0) );
end booth_encoder;

architecture Behavioral of booth_encoder is
-- devo fare un blocco unico per utilizzare in modo più efficiente il generate statement

component y_block is
   Port ( IN_BJ : in  STD_LOGIC_VECTOR (2 downto 0) ;
		IN_A : in  STD_LOGIC_VECTOR (31 downto 0) ;
		Y  : out STD_LOGIC_VECTOR(32 downto 0));
	END component;
	
	
signal B_init, B_regout: std_logic_vector(34 downto 0);
signal A_regout: std_logic_vector(31 downto 0);
signal pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17  : STD_LOGIC_VECTOR(32 downto 0) ;

begin

B_init <= "00" & B & '0' ;

--regA: register_nbit generic map(N=>32) port map (clk=>clk, rst_n=>'1', enable=>'1', a=>A, b=>A_regout);
A_regout <= A;
B_regout <= B_init;

--regB: register_nbit generic map(N=>35) port map (clk=>clk, rst_n=>'1', enable=>'1', a=>B_init, b=>B_regout); 
 
 
 Y_BLOCK1: y_block port map(IN_BJ=>B_regout(2 downto 0), IN_A=>A_regout, Y=>pp1);
 Y_BLOCK2: y_block port map(IN_BJ=>B_regout(4 downto 2), IN_A=>A_regout, Y=>pp2);
 Y_BLOCK3: y_block port map(IN_BJ=>B_regout(6 downto 4), IN_A=>A_regout, Y=>pp3);
 Y_BLOCK4: y_block port map(IN_BJ=>B_regout(8 downto 6), IN_A=>A_regout, Y=>pp4);
 Y_BLOCK5: y_block port map(IN_BJ=>B_regout(10 downto 8), IN_A=>A_regout, Y=>pp5);
 Y_BLOCK6: y_block port map(IN_BJ=>B_regout(12 downto 10), IN_A=>A_regout, Y=>pp6);
 Y_BLOCK7: y_block port map(IN_BJ=>B_regout(14 downto 12), IN_A=>A_regout, Y=>pp7);
 Y_BLOCK8: y_block port map(IN_BJ=>B_regout(16 downto 14), IN_A=>A_regout, Y=>pp8);
 Y_BLOCK9: y_block port map(IN_BJ=>B_regout(18 downto 16), IN_A=>A_regout, Y=>pp9);
 Y_BLOCK10: y_block port map(IN_BJ=>B_regout(20 downto 18), IN_A=>A_regout, Y=>pp10);
 Y_BLOCK11: y_block port map(IN_BJ=>B_regout(22 downto 20), IN_A=>A_regout, Y=>pp11);
 Y_BLOCK12: y_block port map(IN_BJ=>B_regout(24 downto 22), IN_A=>A_regout, Y=>pp12);
 Y_BLOCK13: y_block port map(IN_BJ=>B_regout(26 downto 24), IN_A=>A_regout, Y=>pp13);
 Y_BLOCK14: y_block port map(IN_BJ=>B_regout(28 downto 26), IN_A=>A_regout, Y=>pp14);
 Y_BLOCK15: y_block port map(IN_BJ=>B_regout(30 downto 28), IN_A=>A_regout, Y=>pp15);
 Y_BLOCK16: y_block port map(IN_BJ=>B_regout(32 downto 30), IN_A=>A_regout, Y=>pp16);
 Y_BLOCK17: y_block port map(IN_BJ=>B_regout(34 downto 32), IN_A=>A_regout, Y=>pp17);
 
 -- crezione matrice
 
 finpp1<="0000000000000000000000000000"& (not (B_regout(2))) & B_regout(2)&B_regout(2) & pp1;
 finpp2<="000000000000000000000000000" & '1' & (not (B_regout(4))) & pp2 & '0' & B_regout(2);
 
 finpp3<="0000000000000000000000000" & '1' & (not (B_regout(6))) & pp3 & '0' & B_regout(4) & "00";
 finpp4<="00000000000000000000000" & '1' & (not (B_regout(8))) & pp4 & '0' & B_regout(6) & "0000";
 finpp5<="000000000000000000000" & '1' & (not (B_regout(10))) & pp5 & '0' & B_regout(8) & "000000";
 finpp6<="0000000000000000000" & '1' & (not (B_regout(12))) & pp6 & '0' & B_regout(10) & "00000000";
 
 finpp7<="00000000000000000" & '1' & (not (B_regout(14))) & pp7 & '0' & B_regout(12) & "0000000000";
 finpp8<="000000000000000" & '1' & (not (B_regout(16))) & pp8 & '0' & B_regout(14) & "000000000000";
 finpp9<="0000000000000" & '1' & (not (B_regout(18))) & pp9 & '0' & B_regout(16) & "00000000000000";
 finpp10<="00000000000" & '1' & (not (B_regout(20))) & pp10 & '0' & B_regout(18) & "0000000000000000";
 finpp11<="000000000" & '1' & (not (B_regout(22))) & pp11 & '0' & B_regout(20) & "000000000000000000";
 finpp12<="0000000" & '1' & (not (B_regout(24))) & pp12 & '0' & B_regout(22) & "00000000000000000000";
 finpp13<="00000" & '1' & (not (B_regout(26))) & pp13 & '0' & B_regout(24) & "0000000000000000000000";
 
 finpp14<="000" & '1' & (not (B_regout(28))) & pp14 & '0' & B_regout(26) & "000000000000000000000000";
 finpp15<="0" & '1' & (not (B_regout(30))) & pp15 & '0' & B_regout(28) & "00000000000000000000000000";
 
 finpp16<=(not (B_regout(32))) & pp16 & '0' & B_regout(30) & "0000000000000000000000000000";
 finpp17<=pp17(31 downto 0) & '0' & B_regout(32) & "000000000000000000000000000000";
 

        
End Architecture Behavioral;
