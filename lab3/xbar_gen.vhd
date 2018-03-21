library ieee;
use ieee.std_logic_1164.all;

entity xbar_gen is
	generic(N : integer := 8);
	port(	s: in std_logic_vector (N-1 downto 0);
			y1, y2: out std_logic);
end xbar_gen;

architecture rtl of xbar_gen is
	component xbar_v2
		port(x1, x2, s: in std_logic;
       y1, y2: out std_logic);
	end component;
	signal tmpv, tmpg: std_logic_vector(0 to N);
begin
	tmpv(0) <= '1';
	tmpg(0) <= '0';
	gerador: for i in 0 to N-1 generate
		stage: xbar_v2 port map (tmpv(i), tmpg(i), s(i), tmpv(i+1), tmpg(i+1));
	end generate;
	y1 <= tmpv(N);
	y2 <= tmpg(N);
end rtl;

