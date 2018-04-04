library ieee;
use ieee.std_logic_1164.all;

entity ff_t is
  port (
    T: in std_logic;
	 Clk: in std_logic;
    Q:   out  std_logic;
    Q_n:   out  std_logic;
	 Preset: in std_logic;
	 Clear: in std_logic
  );
end ff_t;

architecture behaviour of ff_t is
	signal tmpQ: std_logic;
begin
	process
		variable prev: std_logic;
	begin
		prev := tmpQ;
		wait until Clk'EVENT and Clk = '1';
		if Clear = '1' then
			tmpQ <= '0';
		elsif Preset = '1' then
			tmpQ <= '1';
		else
			case(t) is
				when '0' => tmpQ <= prev;
				when others => tmpQ <= NOT(prev);
			end case;
		end if;
	end process;
	Q <= tmpQ;
	Q_n <= NOT(tmpQ);
end behaviour;