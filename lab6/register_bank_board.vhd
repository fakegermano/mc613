library ieee;
use ieee.std_logic_1164.all;
use work.register_bank;
use work.bin2hex;

entity register_bank_board is
	port (
		SW : in std_logic_vector(9 downto 0);
		KEY : in std_logic_vector(2 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
end register_bank_board;

architecture rtl of register_bank_board is
	signal output : std_logic_vector(3 downto 0);
begin
	bank: register_bank 
			port map (	clk => NOT KEY(0), 
							data_in => SW(3 downto 0), 
							data_out => output, 
							reg_rd => SW(9 downto 7), 
							reg_wr => SW(6 downto 4), 
							we => NOT KEY(1),
							clear => KEY(2) );
	dec: bin2hex port map ( SW => output, HEX0 => HEX0);
end rtl;
