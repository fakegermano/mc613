library ieee;
use ieee.std_logic_1164.all;
use work.alu;
use work.two_comp_to_7seg;
use work.bin2hex;

entity alu_board is
  port (
    SW : in std_logic_vector(9 downto 0);
    HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(3 downto 0)
  );
end alu_board;

architecture behavioral of alu_board is
	signal result : std_logic_vector(3 downto 0);
	signal hex_a, hex_b, hex_r: std_logic_vector (6 downto 0);
	signal twocomp_a, twocomp_b, twocomp_r: std_logic_vector (6 downto 0);
	signal neg: std_logic_vector(0 to 2);
	signal show_neg1, show_neg2, show_neg3: std_logic_vector(1 downto 0);
begin
	alu_work: alu port map (a => SW(7 downto 4), b => SW(3 downto 0), F => result,
									s0 => SW(8), s1 => SW(9), 
									Z => LEDR(3), C => LEDR(2), V => LEDR(1), N => LEDR(0));
	display1hex: bin2hex port map (SW(7 downto 4), hex_a);
	display2hex: bin2hex port map (SW(3 downto 0), hex_b);
	display3hex: bin2hex port map (result, hex_r);
	display1twocomp: two_comp_to_7seg port map (SW(7 downto 4), twocomp_a, neg(0));
	display2twocomp: two_comp_to_7seg port map (SW(3 downto 0), twocomp_b, neg(1));
	display3twocomp: two_comp_to_7seg port map (result, twocomp_r, neg(2));
	HEX4 <= twocomp_a when SW(9) = '0' else hex_a;
	HEX2 <= twocomp_b when SW(9) = '0' else hex_b;
	HEX0 <= twocomp_r when SW(9) = '0' else hex_r;
	show_neg1 <= SW(9) & neg(0);
	show_neg2 <= SW(9) & neg(1);
	show_neg3 <= SW(9) & neg(2);
	HEX5 <= "0111111" when show_neg1 = "01" else "1111111";
	HEX3 <= "0111111" when show_neg2 = "01" else "1111111";
	HEX1 <= "0111111" when show_neg3 = "01" else "1111111";
end behavioral;
