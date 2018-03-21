library ieee;
use ieee.std_logic_1164.all;

entity dec2_to_4 is
  port(en, w1, w0: in std_logic;
       y3, y2, y1, y0: out std_logic);
end dec2_to_4;

architecture rtl of dec2_to_4 is
	signal input: std_logic_vector(0 to 2);
begin
	input <= w0 & w1 & en;
	with input select
		y0 <= '1' when "001",
				'0' when others;
	with input select
		y1 <= '1' when "101",
				'0' when others;
	with input select
		y2 <= '1' when "011",
				'0' when others;
	with input select
		y3 <= '1' when "111",
				'0' when others;	
end rtl;

