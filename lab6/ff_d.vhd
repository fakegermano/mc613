library ieee;
use ieee.std_logic_1164.all;

entity ff_d is
  port (
    D: in std_logic;
	 Clk: in std_logic;
    Q:   out  std_logic;
    Q_n:   out  std_logic;
	 Preset: in std_logic;
	 Clear: in std_logic
  );
end ff_d;

architecture behaviour of ff_d is
	signal tmpQ: std_logic;
begin
	process
	begin
		wait until Clk'EVENT and Clk = '1';
		if Clear = '1' then
			tmpQ <= '0';
		elsif Preset = '1' then
			tmpQ <= '1';
		else
			tmpQ <= D;
		end if;
	end process;
	Q <= tmpQ;
	Q_n <= NOT(tmpQ);
end behaviour;