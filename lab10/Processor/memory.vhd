library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory IS
	GENERIC (
		WORDSIZE		: NATURAL	:= 8;
		BITS_OF_ADDR	: NATURAL	:= 16;
		MIF_FILE		: STRING	:= ""
	);
	PORT (
		clock   : IN	STD_LOGIC;
		we      : IN	STD_LOGIC;
		address : IN	STD_LOGIC_VECTOR(BITS_OF_ADDR-1 DOWNTO 0);
		datain  : IN	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0);
		dataout : OUT	STD_LOGIC_VECTOR(WORDSIZE-1 DOWNTO 0)
	);
END memory;

architecture rtl of memory is
	subtype word_t is std_logic_vector(WORDSIZE-1 downto 0);
	type memory is array ((2 ** BITS_OF_ADDR) - 1 downto 0) of word_t;
	signal mem : memory;
	
	attribute ram_init_file : STRING;
	attribute ram_init_file of mem: signal is MIF_FILE;
	
	signal output : integer;
begin
	process (clock)
		variable addr : integer;
	begin
		if rising_edge(clock) then
			addr := to_integer(unsigned(address));
			if we = '1' then
				mem(addr) <= datain;
			else
				output <= addr;
			end if;
		end if;
	end process;
	dataout <= mem(output);
end rtl;
