library ieee;
use ieee.std_logic_1164.all;
use work.cla_4bits;

entity cla_board is
  port(
		SW : in std_logic_vector(8 downto 0);
		LEDR : out std_logic_vector(4 downto 0)
  );
end cla_board;

architecture rtl of cla_board is
begin
	cla: cla_4bits port map (x => SW(3 downto 0), y => SW(7 downto 4), cin => SW(8), sum => LEDR(3 downto 0), cout => LEDR(4));
end rtl;