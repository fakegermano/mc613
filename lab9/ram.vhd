library ieee;
use ieee.std_logic_1164.all;
use work.ram_block;

entity ram is
	port (
		Clock : in std_logic;
		Address : in std_logic_vector(9 downto 0);
		DataIn : in std_logic_vector(31 downto 0);
		DataOut : out std_logic_vector(31 downto 0);
		WrEn : in std_logic
	);
end ram;

architecture rtl of ram is
	subtype byte_t is std_logic_vector(7 downto 0);
	type data_t is array(7 downto 0) of byte_t;
	signal memdata : data_t;
begin
	mem_line: for i in 0 to 1 generate
		mem_block: for j in 0 to 3 generate
			ram_block_ij: ram_block port map (	Clock => Clock,
															Address => Address(6 downto 0),
															Data => DataIn(8*j+7 downto 8*j),
															Q => memdata(4*i+j),
															WrEn => WrEn );
		end generate mem_block;
	end generate mem_line;
	with Address(9 downto 7) select
		DataOut <= 	memdata(7) & memdata(6) & memdata(5) & memdata(4) when "001",
						memdata(3) & memdata(2) & memdata(1) & memdata(0) when "000",
						(others=>'Z') when others;
end rtl;
