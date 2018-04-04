library ieee;
use ieee.std_logic_1164.all;

entity ff_jk is
  port (
    J: in std_logic;
	 K: in std_logic;
	 Clk: in std_logic;
    Q:   out  std_logic;
    Q_n:   out  std_logic;
	 Preset: in std_logic;
	 Clear: in std_logic
  );
end ff_jk;

architecture behaviour of ff_jk is
	signal tmpQ: std_logic;
begin
	process
		variable prev: std_logic;
		variable jk: std_logic_vector(1 downto 0);
	begin
		prev := tmpQ;
		jk := J & K;
		wait until Clk'EVENT and Clk = '1';
		if Clear = '1' then
			tmpQ <= '0';
		elsif Preset = '1' then
			tmpQ <= '1';
		else
			case(jk) is
				when "00" => tmpQ <= prev;
				when "01" => tmpQ <= '0';
				when "10" => tmpQ <= '1';
				when others => tmpQ <= NOT(prev);
			end case;
		end if;
	end process;
	Q <= tmpQ;
	Q_n <= NOT(tmpQ);
end behaviour;