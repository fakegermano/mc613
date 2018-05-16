library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bank is
	generic (
		WORDSIZE : natural := 32
	);
	port (
		clock, clear : in std_logic;
		DATA_IN : in std_logic_vector (WORDSIZE-1 downto 0);
		WR_ADDR, RD_ADDR1, RD_ADDR2 : IN	std_logic_vector (4 downto 0);
		DATA_OUT1, DATA_OUT2 : out std_logic_vector (WORDSIZE-1 downto 0);
		WR_EN, RD_EN : in std_logic
	);
end bank;

architecture behaviour of bank is
	subtype word_t is std_logic_vector(WORDSIZE-1 downto 0);
	type reg_bank is array (1 to 31) of word_t;
	signal OUTREG: reg_bank;
	signal OUTPUT1, OUTPUT2 : integer;
begin
	process (clock)
		variable wr, rd1, rd2 : integer;
	begin
		if rising_edge(clock) then
			wr := to_integer(unsigned(WR_ADDR));
			rd1 := to_integer(unsigned(RD_ADDR1));
			rd2 := to_integer(unsigned(RD_ADDR2));
			if clear = '1' then
				for i in 1 to 31 loop
					OUTREG(i) <= (others => '0');
				end loop;
			else
				if WR_EN = '1' then
					if wr /= 0 then
						OUTREG(wr) <= DATA_IN;
					end if;
				elsif RD_EN = '1' then
					OUTPUT1 <= rd1;
					OUTPUT2 <= rd2;
				end if;
			end if;
		end if;
	end process;
	DATA_OUT1 <= OUTREG(OUTPUT1) when OUTPUT1 /= 0 else (others => '0');
	DATA_OUT2 <= OUTREG(OUTPUT2) when OUTPUT2 /= 0 else (others => '0');
end behaviour;