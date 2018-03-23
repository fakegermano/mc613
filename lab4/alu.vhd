library ieee;
use ieee.std_logic_1164.all;
use work.ripple_carry;

entity alu is
  port (
    a, b : in std_logic_vector(3 downto 0);
    F : out std_logic_vector(3 downto 0);
    s0, s1 : in std_logic;
    Z, C, V, N : out std_logic
  );
end alu;

architecture behavioral of alu is
	signal sel : std_logic_vector(1 downto 0);
	signal sum_r, and_r, or_r : std_logic_vector(3 downto 0);
	signal carry_sum, over_sum: std_logic;
	signal zero_sum, zero_and, zero_or: std_logic;
	signal b_sum: std_logic_vector(3 downto 0);
begin
	sel <= s1 & s0;
	b_sum <= NOT b when sel = "01" else b;
	sum_work: ripple_carry
		generic map (N => 4)
		port map (x => a, y => b_sum, r => sum_r, cout => carry_sum, overflow => over_sum, cin => sel(0));
	and_work: and_r <= a AND b;
	or_work: or_r <= a OR b;
	with sel select
		F <= 	and_r when "10",
				or_r when "11",
				sum_r when others;
	zero_sum <= '1' when sum_r = "0000" else '0';
	zero_and <= '1' when and_r = "0000" else '0';
	zero_or <= '1' when or_r = "0000" else '0';
	with sel select
		Z <= 	zero_and when "10",
				zero_or when "11",
				zero_sum when others;
	C <= carry_sum when sel(1) = '0' else '0';
	V <= over_sum when sel(1) = '0' else '0';
	N <= sum_r(3) when sel(1) = '0' else '0';
end behavioral;
