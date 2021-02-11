LIBRARY ieee;
USE ieee.std_logic_1164.all;
--Multiplexer 2 to 1 con segnali a 1 bit

ENTITY MUX2TO1 IS
--Interruttori Select(S), Segnale X, Segnale Y 
		PORT (	A,B,S : IN STD_LOGIC;
				Z : OUT STD_LOGIC); 
END MUX2TO1;

ARCHITECTURE Behavior OF MUX2TO1 IS
BEGIN
		
		Z <= ((NOT S) AND A) OR (S AND B);
		
END Behavior;
