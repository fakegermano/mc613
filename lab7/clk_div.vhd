library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
  port (
    clk : in std_logic; -- 50 MHz
    clk_hz : out std_logic -- 1 Hz
  );
end clk_div;

architecture behavioral of clk_div is
begin
	process (clk)
		constant divider: integer := 50000000; -- each 50M clock cycles toggle clk_hz (pulse each 1 second)
		variable count: integer range 0 to divider := 0;
		variable hz: std_logic := '0';
		variable wid: std_logic := '0'; -- controll the width of the 1 Hz pulse
	begin
		if rising_edge(clk) then
			if count = divider then
				hz := not(hz);
				count := 0;
			end if;
			count := count + 1;
		end if;
		if falling_edge(clk) then
			if hz = '1' then -- if the 1 Hz pulse is up and the clock is falling, cut the pulse
				wid := '1';
			else
				wid := '0';
			end if;
		end if;
		clk_hz <= hz XOR wid; -- limit the pulso of hz to be the width of the clk
	end process;
end behavioral;
