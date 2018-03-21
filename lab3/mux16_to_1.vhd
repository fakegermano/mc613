library ieee;
use ieee.std_logic_1164.all;
use work.mux4_to_1;

entity mux16_to_1 is
  port(data : in std_logic_vector(15 downto 0);
       sel : in std_logic_vector(3 downto 0);
       output : out std_logic);
end mux16_to_1;

architecture rtl of mux16_to_1 is
	signal interno : std_logic_vector(0 to 3);
begin
	gerador: for i in 0 to 3 generate
		muxes: mux4_to_1 port map (data(4*i+3), data(4*i+2), data(4*i+1), data(4*i), sel(1 downto 0), interno(i));
	end generate;
	mux_final: mux4_to_1 port map (interno(3), interno(2), interno(1), interno(0), sel(3 downto 2), output);
end rtl;

