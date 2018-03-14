LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY light_vhdl IS
	PORT(x1, x2: IN	STD_LOGIC ;
			f		: OUT	STD_LOGIC);
END light_vhdl ;

ARCHITECTURE LogicFunction OF light_vhdl IS
BEGIN
	
		f <=	(x1 AND NOT x2) OR (NOT X1 AND X2);
END LogicFunction ;