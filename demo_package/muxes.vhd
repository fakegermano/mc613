LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE muxes IS

	COMPONENT mux4to1
	PORT
		(
			w0, w1, w2, w3: IN STD_LOGIC;
			s: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			f: OUT STD_LOGIC
		);
	END COMPONENT;
	
END muxes;