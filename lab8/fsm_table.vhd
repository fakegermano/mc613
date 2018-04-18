library ieee;
use ieee.std_logic_1164.all;

entity fsm_table is
	port (
		clock, reset, w: in std_logic;
		z: out std_logic
	);
end fsm_table;

architecture behaviour of fsm_table is
	type state_type is (A, B, C, D);
	signal s: state_type := A;
begin
	process (clock, reset)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				s <= A;
			else
				case s is
					when A =>
						if w = '0' then
							s <= C;
						else
							s <= B;
						end if;
						z <= '1';
					when B =>
						if w = '0' then
							s <= D;
						else
							s <= C;
						end if;
						z <= not(w);
					when C =>
						if w = '0' then
							s <= B;
						else
							s <= C;
						end if;
						z <= '0';
					when D =>
						if w = '0' then
							s <= A;
						else
							s <= C;
						end if;
						z <= w;
				end case;
			end if;
		end if;
	end process;
end behaviour;