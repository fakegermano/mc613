library ieee;
use ieee.std_logic_1164.all;

entity zbuffer is
	generic (N : integer := 4);
	port (
		data_in : in std_logic_vector(N-1 downto 0);
		En : in std_logic;
		data_out : out std_logic_vector(N-1 downto 0)
	);
end zbuffer;

architecture rtl of zbuffer is 
begin
	data_out <= ( others => 'Z' ) when En = '0' else data_in;
end rtl;