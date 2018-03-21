library ieee;
use ieee.std_logic_1164.all;
use work.ripple_carry;
use work.bin2hex;

entity ripple_carry_board is
  port (
    SW : in std_logic_vector(7 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(0 downto 0)
    );
end ripple_carry_board;

architecture rtl of ripple_carry_board is
	signal saida : std_logic_vector(3 downto 0);
begin
	ripple: ripple_carry 
		generic map (N => 4)
		port map ( x => SW(7 downto 4), y => SW(3 downto 0), cin => '0', overflow => LEDR(0), r => saida);
	display1: bin2hex port map (SW(7 downto 4), HEX4);
	display2: bin2hex port map (SW(3 downto 0), HEX2);
	display3: bin2hex port map (saida, HEX0);
end rtl;
