library ieee;
use ieee.std_logic_1164.all;
use work.barrel_shifter;

entity bs_board is
  port(
    SW : in  std_logic_vector (5 downto 0);
    LEDR : out std_logic_vector (3 downto 0)
  );
end bs_board;

architecture rtl of bs_board is
begin
	shift: barrel_shifter port map ( w => SW(3 downto 0), s => SW(5 downto 4), y => LEDR(3 downto 0) );
end rtl;
