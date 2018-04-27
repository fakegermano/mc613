library ieee;
use ieee.std_logic_1164.all;

entity fsm_diag is 
	port (
		clock, reset, w: in std_logic;
		z: out std_logic
	);
end fsm_diag;

architecture behaviour of fsm_diag is
	type state_type is (A, B, C, D);
	signal s: state_type := A;
begin
	process (clock, reset)
	begin
		if rising_edge(clock) then
			if reset = '1' then
				s <= A;
				z <= '0';
			else
				case s is
					when A =>
						if w = '1' then
							s <= B;
						else
							s <= A;
						end if;
						z <= '0';
					when B =>
						if w = '1' then
							s <= B;
						else
							s <= C;
						end if;
						z <= '1';
					when C =>
						if w = '1' then
							s <= D;
						else
							s <= C;
						end if;
						z <= '0';
					when D =>
						if w = '1' then
							s <= D;
						else
							s <= A;
						end if;
						z <= '0';
				end case;
			end if;
		end if;
	end process;
end behaviour;