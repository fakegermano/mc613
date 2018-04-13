library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcdcount_decun is
	port (
		clk: in std_logic;
		enable, clear: in std_logic;
		dec, un: out std_logic_vector(3 downto 0)
	);
end bcdcount_decun;