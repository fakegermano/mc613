LIBRARY ieee;

USE ieee.std_logic_1164.all;

ENTITY bin2dec IS
	PORT (
		SW: IN std_logic_vector(3 DOWNTO 0);
		HEX0: OUT std_logic_vector(6 DOWNTO 0)
	);
END bin2dec;

ARCHITECTURE Converter OF bin2dec IS
BEGIN
		WITH SW SELECT 
			HEX0 <= 	"1000000" WHEN "0000",
						"1111001" WHEN "0001",
						"0100100" WHEN "0010",
						"0110000" WHEN "0011",
						"0011001" WHEN "0100",
						"0010010" WHEN "0101",
						"0000010" WHEN "0110",
						"1111000" WHEN "0111",
						"0000000" WHEN "1000",
						"0011000" WHEN "1001",
						"0000110" WHEN OTHERS;
END Converter;
