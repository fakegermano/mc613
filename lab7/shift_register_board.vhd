library ieee;
use ieee.std_logic_1164.all;
use work.shift_register;

entity shift_register_board is 
	port (
		SW : in std_logic_vector(8 downto 0);
		KEY : in std_logic_vector(0 downto 0);
		LEDR : out std_logic_vector(5 downto 0)
	);
end shift_register_board;

architecture structure of shift_register_board is 
begin
	shift: shift_register generic map (N=>6) port map (
		clk => KEY(0),
		mode => SW(8 downto 7),
		ser_in => SW(6),
		par_in => SW(5 downto 0),
		par_out => LEDR
	);
end structure;