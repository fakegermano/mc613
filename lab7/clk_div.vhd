library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  port (
    clk : in std_logic; -- 50 MHz
    clk_hz : out std_logic -- 1 Hz
  );
end clk_div;

architecture bhv of clk_div is
	signal count: integer := 1;
	signal hz1: std_logic := '0';
begin
	process(clk)
		constant divider : integer := 50000000;
	begin
		if rising_edge(clk) then
			count <= count + 1;
			if count = divider then
				hz1 <= '1';
				count <= 1;
			else 
				hz1 <= '0';
			end if;
		end if;
	end process;
	clk_hz <= hz1;
end bhv;