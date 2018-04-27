library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_block is
  port (
    Clock : in std_logic;
    Address : in std_logic_vector(6 downto 0);
    Data : in std_logic_vector(7 downto 0);
    Q : out std_logic_vector(7 downto 0);
    WrEn : in std_logic
  );
end ram_block;

architecture direct of ram_block is
	subtype byte_t is std_logic_vector(7 downto 0);
	type memory_t is array(127 downto 0) of byte_t;
	signal ram : memory_t;
	signal addr_reg : natural range 0 to 127;
	signal addr : integer range 0 to 127;
begin
	addr <= to_integer(unsigned(Address));
	process(Clock)
	begin
		if(rising_edge(Clock)) then
			if(WrEn = '1') then
				ram(addr) <= Data;
			end if;
			addr_reg <= addr;
		end if;
	end process;

	Q <= ram(addr_reg);
end direct;
