library ieee;
use ieee.std_logic_1164.all;

entity mux4_to_1 is
	port (
		d3, d2, d1, d0 : in std_logic_vector(3 downto 0);
		sel : in std_logic_vector(1 downto 0);
		f : out std_logic_vector(3 downto 0)
	);
end mux4_to_1;

architecture structure of mux4_to_1 is
begin
	with sel select
		f <= 	d0 when "00",
				d1 when "01",
				d2 when "10",
				d3 when others;
end structure;
