library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clock is
  port (
    clk : in std_logic;
    decimal : in std_logic_vector(3 downto 0);
    unity : in std_logic_vector(3 downto 0);
    set_hour : in std_logic;
    set_minute : in std_logic;
    set_second : in std_logic;
    hour_dec, hour_un : out std_logic_vector(6 downto 0);
    min_dec, min_un : out std_logic_vector(6 downto 0);
    sec_dec, sec_un : out std_logic_vector(6 downto 0)
  );
end clock;

architecture rtl of clock is
	component clk_div is
		port (
			clk : in std_logic;
			clk_hz : out std_logic
		);
	end component;
	component bin2hex is
		port (
			SW : in std_logic_vector(3 downto 0);
			HEX0 : out std_logic_vector(6 downto 0)
		);
	end component;
	signal clk_hz : std_logic;
	signal hour_dbcd, hour_ubcd: std_logic_vector(3 downto 0);
	signal min_dbcd, min_ubcd: std_logic_vector(3 downto 0);
	signal sec_dbcd, sec_ubcd: std_logic_vector(3 downto 0);
	-- Your code here!
begin
	clock_divider : clk_div port map (clk, clk_hz);
	
	process (clk, clk_hz)
		variable tmp_hu, tmp_hd, tmp_mu, tmp_md, tmp_su, tmp_sd: std_logic_vector(3 downto 0);
	begin
		if rising_edge(clk) then
			if set_hour = '1' then
				if (decimal = 2 AND unity < 4) OR (decimal < 2) then
					tmp_hd := decimal;
					tmp_hu := unity;
				end if;
			end if;
			if set_minute = '1' then
				if decimal < 6 then 
					tmp_md := decimal;
					tmp_mu := unity;
				end if;
			end if;
			if set_second = '1' then
				if decimal < 6 then
					tmp_sd := decimal;
					tmp_su := unity;
				end if;
			end if;
			if clk_hz = '1' then
				if tmp_su = "1001" then
					tmp_su := "0000";
					if tmp_sd = "0101" then
						tmp_sd := "0000";
						if tmp_mu = "1001" then
							tmp_mu := "0000";
							if tmp_md = "0101" then
								tmp_md := "0000";
								if tmp_hd = "0010" then
									if tmp_hu = "0011" then
										tmp_hu := "0000";
										tmp_hd := "0000";
									else 
										tmp_hu := tmp_hu + '1';
									end if;
								else 
									if tmp_hu = "1001" then
										tmp_hu := "0000";
										tmp_hd := tmp_hd + '1';
									else
										tmp_hu := tmp_hu + '1';
									end if;
								end if;
							else
								tmp_md := tmp_md + '1';
							end if;
						else
							tmp_mu := tmp_mu + '1';
						end if;
					else 
						tmp_sd := tmp_sd + '1';
					end if;
				else
					tmp_su := tmp_su + '1';
				end if;
			end if;
		end if;
		hour_dbcd <= tmp_hd;
		hour_ubcd <= tmp_hu;
		min_dbcd <= tmp_md;
		min_ubcd <= tmp_mu;
		sec_dbcd <= tmp_sd;
		sec_ubcd <= tmp_su;
	end process;
	
	hexusec: bin2hex port map ( SW => sec_ubcd, HEX0 => sec_un);
	hexdsec: bin2hex port map ( SW => sec_dbcd, HEX0 => sec_dec);
	hexumin: bin2hex port map ( SW => min_ubcd, HEX0 => min_un);
	hexdmin: bin2hex port map ( SW => min_dbcd, HEX0 => min_dec);
	hexuhou: bin2hex port map ( SW => hour_ubcd, HEX0 => hour_un);
	hexdhou: bin2hex port map ( SW => hour_dbcd, HEX0 => hour_dec);
  -- Your code here!
end rtl;