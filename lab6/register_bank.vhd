library ieee;
use ieee.std_logic_1164.all;
use work.dec3_to_8;
use work.zbuffer;
use work.reg;

entity register_bank is
	port (
		clk : in std_logic;
		data_in : in std_logic_vector(3 downto 0);
		data_out : out std_logic_vector(3 downto 0);
		reg_rd : in std_logic_vector(2 downto 0);
		reg_wr : in std_logic_vector(2 downto 0);
		we: in std_logic;
		clear : in std_logic
	);
end register_bank;

architecture behaviour of register_bank is
	signal d2r: std_logic_vector(7 downto 0);
	signal outreg: std_logic_vector(0 to 31);
	signal r2d: std_logic_vector(7 downto 0);
begin
	d2r_dec: dec3_to_8 port map (sel => reg_wr, output => d2r);
	r2d_dec: dec3_to_8 port map (sel => reg_rd, output => r2d);
	bank: for i in 0 to 7 generate
		regi: reg 
				generic map (N=>4) 
				port map (	clk => clk, 
								data_in => data_in, 
								data_out => outreg(4*i to 4*i+3), 
								clear => clear, 
								load => d2r(i) AND we);
		zbuffi: zbuffer 
				generic map (N=>4) 
				port map ( 	data_in => outreg(4*i to 4*i+3), 
								En => r2d(i), 
								data_out => data_out);
	end generate;
end behaviour;
