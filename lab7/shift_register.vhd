library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
generic (N : integer := 6);
port(
    clk     : in  std_logic;
    mode    : in  std_logic_vector(1 downto 0);
    ser_in  : in  std_logic;
    par_in  : in  std_logic_vector((N - 1) downto 0);
    par_out : out std_logic_vector((N - 1) downto 0)
  );
end shift_register;

architecture rtl of shift_register is
begin
	process (clk)
		variable tmp: std_logic_vector((N-1) downto 0);
	begin
		if rising_edge(clk) then
			case mode is
				when "01" =>
					lshift: for i in N-1 downto 1 loop
						tmp(i) := tmp(i-1);
					end loop;
					tmp(0) := ser_in;
				when "10" =>
					rshift: for i in 0 to N-2 loop
						tmp(i) := tmp(i+1);
					end loop;
					tmp(N-1) := ser_in;
				when "11" =>
					tmp := par_in;
				when others =>
					tmp := tmp;
			end case;
		end if;
		par_out <= tmp;
	end process;
end rtl;
