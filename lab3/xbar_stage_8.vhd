library ieee;
use ieee.std_logic_1164.all;
use work.xbar_gen;

entity xbar_stage_8 is
  port(SW  : in std_logic_vector (7 downto 0);
       LEDR: out std_logic_vector(0 downto 0));
end xbar_stage_8;

architecture rtl of xbar_stage_8 is
begin
	instance: xbar_gen
		generic map (N => 8)
		port map ( s => SW, y1 => LEDR(0) );
end rtl;

