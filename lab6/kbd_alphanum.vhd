library ieee;
use ieee.std_logic_1164.all;

entity kbd_alphanum is
  port (
    clk : in std_logic;
    key_on : in std_logic_vector(2 downto 0);
    key_code : in std_logic_vector(47 downto 0);
    HEX1 : out std_logic_vector(6 downto 0); -- GFEDCBA
    HEX0 : out std_logic_vector(6 downto 0) -- GFEDCBA
  );
end kbd_alphanum;

architecture rtl of kbd_alphanum is
	component bin2hex
		port(
			SW  : in std_logic_vector(3 downto 0);
			HEX0: out std_logic_vector(6 downto 0)
		);
	end component;
	signal output_code: std_logic_vector(15 downto 0);
begin
	hexseg0: bin2hex port map (SW => output_code(3 downto 0), HEX0 => HEX0);
	hexseg1: bin2hex port map (SW => output_code(7 downto 4), HEX0 => HEX1);
	
	process (clk, key_on)
		variable shift, caps: std_logic;
	begin
		if rising_edge(clk) AND ((key_on = "--1" AND key_code(15 downto 0) = x"0058") OR 
										 (key_on = "-1-" AND key_code(31 downto 16) = x"0058") OR 
										 (key_on = "1--" AND key_code(47 downto 32) = x"0058")) then
			caps := not(caps);
		end if;
		if rising_edge(clk) AND key_on = "-11" then
			case (key_code(15 downto 0)) is
				when x"0012" => shift := '1' XOR caps;
				when x"0059" => shift := '1' XOR caps;
				when others => shift := '0' XOR caps;
			end case;
		end if;
		if rising_edge(clk) AND key_on = "-11" AND shift = '1' then
			output_code <= key_code(31 downto 16);
		elsif rising_edge(clk) then
			output_code <= key_code(15 downto 0);
		end if;
	end process;
end rtl;
