library ieee;
use ieee.std_logic_1164.all;
use work.dec2_to_4;
use work.extra_logic;

entity mux4_to_1 is
  port(d3, d2, d1, d0 : in std_logic;
       sel : in std_logic_vector(1 downto 0);
       output : out std_logic);
end mux4_to_1;

architecture rtl of mux4_to_1 is
	signal y : std_logic_vector(3 downto 0);
begin
	decod: dec2_to_4 port map (en => '1', w0 => sel(0), w1 => sel(1),
										y0 => y(0), y1 => y(1), y2 => y(2), y3 => y(3));
	extra: extra_logic port map (d0, d1, d2, d3, y(0), y(1), y(2), y(3), output);
end rtl;

